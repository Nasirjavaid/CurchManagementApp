import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jamaithius_family/Models/family.dart';
import 'package:jamaithius_family/Network/apiResponce.dart';
import 'package:jamaithius_family/config/appConstants.dart';
import 'package:jamaithius_family/Services/familySearchService.dart';
import 'package:jamaithius_family/ui/Common/commonWidgets.dart';
import 'package:jamaithius_family/ui/Screens/FamilyListScreen/verticalListViewCard.dart';

class FamilySearchScreen extends StatefulWidget {
  @override
  _FamilySearchScreenState createState() => _FamilySearchScreenState();
}

class _FamilySearchScreenState extends State<FamilySearchScreen> {
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";

// getting instance of family service
  FamilySearchService get familySearchService => GetIt.I<FamilySearchService>();

  //Api responce call for list
  APIResponce<List<Family>> apiResponce;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

//Scroll controller for lazy loading
  ScrollController lazyListscrollController = ScrollController();

// New data

  final _familyList = <Family>[];
  bool _isLoading = false;

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
        backgroundColor: AppColorsStyles.backgroundColour,
        appBar: AppBar(
          backgroundColor: AppColorsStyles.backgroundColour,
          leading: const BackButton(),
          title: _buildSearchField(),
          actions: _buildActions(),
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      child: Builder(
        builder: (BuildContext context) {
         
          if (_isLoading) {
            return CommonWidgets.progressIndicator;
          }
           if (apiResponce == null) {
            return searchEmptyContainer();
          }
          if (!_isLoading && apiResponce.data.length != 0) {
            return _dynamicListWidget();
          }

          return searchEmptyContainer();
        },
      ),
    );
  }

  Widget _dynamicListWidget() {
    return Container(
      child: ListView.builder(
          itemCount: apiResponce.data.length == 0 ? 1 : apiResponce.data.length,
          itemBuilder: (BuildContext context, int index) {

            if (apiResponce  == null) {
              return CommonWidgets.progressIndicator;
            }

            return ListCard(
              family: apiResponce.data[index],
            );
          }
          //   },

          ),
    );
  }

  Widget searchEmptyContainer() {
    return Container(
      child: Center(
        child: Text("Search", style: TextStyle(fontSize:20,color: Colors.white10,fontWeight: FontWeight.w900),),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
    
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search Data...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery,
    );
  }

  List<Widget> _buildActions() {
    // if (_isSearching) {
    //   return <Widget>[
    //     IconButton(
    //       icon: const Icon(Icons.clear),
    //       onPressed: () {
    //         if (_searchQueryController == null ||
    //             _searchQueryController.text.isEmpty) {
    //           // Navigator.pop(context);

    //         }
    //         //  if (_searchQueryController != null ||
    //         //      _searchQueryController.text.isNotEmpty) {
    //         //   _getFamilySearchResult();
    //         //   return;
    //         // }
    //         _stopSearching();
    //       },
    //     ),
    //   ];
    // }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    // ModalRoute.of(context)
    //     .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    // setState(() {
    //   _isSearching = true;
    //   _isLoading = true;
    // });
    if (_searchQueryController.text == null ||
        _searchQueryController.text.isEmpty) {
      showMessageError("Please enter search keywords");
    } else {
      netWorkChek();
    }
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
     // searchQuery = newQuery;
      _isSearching = false;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
      _isSearching = false;
      _isLoading = false;
    });
  }

  netWorkChek() async {
    await NetworkConnectivity.check().then((internet) async {
      // clear past user

      if (internet) {
        _getFamilySearchResult();
      } else {
        //show network erro
        showMessageError("Network is not avalable !!!");
      }
    });
  }

  void _getFamilySearchResult() async {
    setState(() {
      _isLoading = true;
      _isSearching = true;
    });

    apiResponce = await familySearchService
        .getFamilySearchList(_searchQueryController.text);

    if (apiResponce.data.length == 0) {
      setState(() {
        _isLoading = false;
        // _isSearching = false;
      });
      showMessageError("No record found !!!");
    }

    if (apiResponce.error) {
      setState(() {
        _isLoading = false;
        // _isSearching = false;
      });

      // print("${apiResponce.errorMessage}");
    }

    setState(() {
      _isLoading = false;
    });
  }
}
