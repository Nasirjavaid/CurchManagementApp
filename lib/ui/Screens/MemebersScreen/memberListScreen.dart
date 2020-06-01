import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jamaithius_family/Models/family.dart';
import 'package:jamaithius_family/Models/member.dart';
import 'package:jamaithius_family/Network/apiResponce.dart';
import 'package:jamaithius_family/Services/memberService.dart';
import 'package:jamaithius_family/config/appConstants.dart';
import 'package:jamaithius_family/ui/Common/commonWidgets.dart';
import 'package:jamaithius_family/ui/Screens/MemebersScreen/memeberlistCard.dart';

class MemeberListScreen extends StatefulWidget {
  Family family;

  MemeberListScreen({this.family});
  @override
  _MemeberListScreenState createState() =>
      _MemeberListScreenState(family: family);
}

class _MemeberListScreenState extends State<MemeberListScreen> {
  Family family;
  _MemeberListScreenState({this.family});

//Getting member service to get memberDetail
  MemberService get memberService => GetIt.I<MemberService>();

  //Api responce call for Summary
  APIResponce<List<Member>> apiResponce;
  bool isLoading = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    // TODO: implement initState

    //callinf main data functon for this screen
    netWorkChek();
    //_fetchSammury();

    super.initState();
  }

  netWorkChek() async {
    await NetworkConnectivity.check().then((internet) async {
      // clear past user

      if (internet) {
        _getMemberListData(family);
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


  _getMemberListData(Family family) async {
    setState(() {
      isLoading = true;
    });

    apiResponce = await memberService.getMemeberList(family.familyId);

    if (apiResponce.error) {
      setState(() {
        isLoading = false;
      });
      showMessageError("Something went wrong !!!");
      print(" ${apiResponce.errorMessage}");
    } else if (apiResponce.error) {
      setState(() {
        isLoading = false;
      });
      showMessageError("Something went wrong !!!");
    }
// print("${apiResponce.data.apr}");
    setState(() {
      isLoading = false;
    });
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
              title: Text("All Members"),
              backgroundColor: AppColorsStyles.backgroundColour),
          backgroundColor: AppColorsStyles.backgroundColour,
          body: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () {
              return netWorkChek();
            },
            child: Builder(
              builder: (BuildContext context) {
                if (isLoading) {
                  return CommonWidgets.progressIndicator;
                }

                if (apiResponce == null) {
                  // showMessageError("Something went wrong");
                  return Center(child: Text("Pull to refresh."));
                }

                return _bodyWidget();
              },
            ),
          )),
    );
  }

  Widget _bodyWidget() {
    return Container(
      child: ListView.builder(
          itemCount: apiResponce.data.length,
          itemBuilder: (BuildContext context, int index) {
            return MemeberListCard(
              member: apiResponce.data[index], family: family,
            );
          }
          //   },

          ),
    );
  }
}
