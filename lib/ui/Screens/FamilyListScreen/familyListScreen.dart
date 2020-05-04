import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jamaithius_family/Models/family.dart';
import 'package:jamaithius_family/Network/apiResponce.dart';
import 'package:jamaithius_family/Services/familyService.dart';
import 'package:jamaithius_family/config/appConstants.dart';
import 'package:jamaithius_family/ui/Common/commonWidgets.dart';
import 'package:jamaithius_family/ui/Screens/FamilyListScreen/verticalListViewCard.dart';

class FamilyListViewScreen extends StatefulWidget {
  @override
  _FamilyListViewScreenState createState() => _FamilyListViewScreenState();
}

class _FamilyListViewScreenState extends State<FamilyListViewScreen> {
//Getting user service to get Summary
  FamilyService get familyService => GetIt.I<FamilyService>();

  //Api responce call for Summary
  APIResponce<List<Family>> apiResponce;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

//Scroll controller for lazy loading
  ScrollController lazyListscrollController = ScrollController();

// New data

  final _familyList = <Family>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  // final _itemFetcher = _ItemFetcher();

  bool _isLoading = false;
  bool isNewLoader = true;

  bool _hasMore = true;
  int _currentPage = 1;

  @override
  void initState() {
    // TODO: implement initState

    lazyListscrollController.addListener(() {
      if (lazyListscrollController.position.pixels ==
          lazyListscrollController.position.maxScrollExtent) {
        netWorkChek();
      }
    });

    // //calling main data functon for this screen

    // //_fetchSammury();

    _hasMore = true;
    netWorkChek();
    // _loadMore();

    super.initState();
  }

  void _loadMore() async {
    _isLoading = true;
    // setState(() {

    //   if(!_isLoading)
    //   {
    //   _isLoading = true;
    //   }
    // });

    apiResponce = await familyService.getFamilyList(_currentPage);

    if (apiResponce.data.length < 10) {
      setState(() {
        _isLoading = false;
        _hasMore = false;
      });
    }

    if (apiResponce.error) {
      setState(() {
        _isLoading = false;
        //_hasMore = false;
      });
      showMessageError("Something went wrong !!!");
     // print("${apiResponce.errorMessage}");
    }

// print("${apiResponce.data.apr}");

    if (mounted) {
      setState(() {
        _isLoading = false;
        isNewLoader = false;
        _familyList.addAll(apiResponce.data);
        _currentPage++;
      });
    }
  }

  netWorkChek() async {
    await NetworkConnectivity.check().then((internet) async {
      // clear past user

      if (internet) {
        _loadMore();
      } else {
        //show network erro
        showMessageError("Network is not avalable !!!");
      }
    });
  }

  void showMessageSuccess(String message, [MaterialColor color = Colors.blue]) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      backgroundColor: color,
      content: new Text(
        message,
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      duration: const Duration(seconds: 1),
    ));
  }

  void showMessageError(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      backgroundColor: color,
      content: new Text(
        message,
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      duration: const Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )
              ],
              title: Text("All Families"),
              backgroundColor: AppColorsStyles.backgroundColour),
          backgroundColor: AppColorsStyles.backgroundColour,
          body: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () {
              return netWorkChek();
            },
            child: Builder(
              builder: (BuildContext context) {
                if (isNewLoader) {
                  return CommonWidgets.progressIndicator;
                }
                return familyDataInListView();
              },
            ),
          )),
    );
  }

  // Widget body ()
  // {
  //   return RefreshIndicator(
  //           key: _refreshIndicatorKey,
  //           onRefresh: () {
  //             return netWorkChek();
  //           },
  //           child: Builder(
  //             builder: (BuildContext context) {
  //               if (isLoading) {
  //                 return CommonWidgets.progressIndicator;
  //               }

  //               if (apiResponce == null) {
  //                 // showMessageError("Something went wrong");
  //                 return Center(child: Text("Pull to refresh."));
  //               }

  //               return familyDataInListView();
  //             },
  //           ));

  //   }
  // }

  Widget familyDataInListView() {
    return ListView.builder(
      controller: lazyListscrollController,
      itemCount: _hasMore ? _familyList.length + 1 : _familyList.length,
      itemBuilder: (BuildContext context, int index) {
        if (index >= _familyList.length) {
          // Don't trigger if one async loading is already under way

          if (_hasMore) {
            if (!_isLoading) {
              _loadMore();
            }
          }

          return Center(
            child: CommonWidgets.progressIndicator,
          );
        } else {
          return ListCard(
            family: _familyList[index],
          );
        }
      },

      // child: ListView.builder(
      //   controller: lazyListscrollController,
      //   itemCount: _hasMore ? _familyList.length + 1 : _familyList.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     Family thisListItems = _familyList[index];

      //     if (index == _familyList.length - 1) {
      //       print("length matched");
      //       return Padding(
      //         padding: const EdgeInsets.only(bottom: 18.0),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           mainAxisSize: MainAxisSize.min,
      //           children: <Widget>[
      //             SizedBox(
      //               width: 18,
      //               height: 18,
      //               child: CircularProgressIndicator(
      //                 strokeWidth: 2.5,
      //               ),
      //             ),
      //           ],
      //         ),
      //       );
      //     } else {
      //       return ListCard(
      //           // items: thisListItems,

      //           );
      //     }
      //   },
      // ),
    );
  }
}
