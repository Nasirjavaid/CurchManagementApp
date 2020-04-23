import 'package:flutter/material.dart';
import 'package:jamaithius_family/config/appConstants.dart';
import 'package:jamaithius_family/ui/Screens/FamilyListScreen/verticalListViewCard.dart';

class FamilyListViewScreen extends StatefulWidget {
  @override
  _FamilyListViewScreenState createState() => _FamilyListViewScreenState();
}

class _FamilyListViewScreenState extends State<FamilyListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right:12.0),
              child: Icon(Icons.search,color: Colors.white,),
            )
          ],
          title: Text("All Families"),
           backgroundColor: AppColorsStyles.backgroundColour
        ),
         backgroundColor: AppColorsStyles.backgroundColour,
              body: Container(
                 child: ListView.builder(
                   // controller: lazyListscrollController,
                  //  itemCount: globalItemsList.data.length,
                  itemCount: 20,
                    
                    itemBuilder: (BuildContext context, int index) {
                     // Items thisListItems = globalItemsList
                        //  .data[index];
                      // (snapshot.data[snapshot.data.length - index].title);
                    //  if (index == globalItemsList.data.length - 1) {
                        print("length matched");
                        // return Padding(
                        //   padding: const EdgeInsets.only(bottom: 18.0),
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     mainAxisSize: MainAxisSize.min,
                        //     children: <Widget>[
                        //       SizedBox(
                        //         width: 18,
                        //         height: 18,
                        //         child: CircularProgressIndicator(
                        //           strokeWidth: 2.5,
                        //         ),
                        //       ),

                        //     ],
                        //   ),
                        // );
                    //  }
                    //  else{

                        
                              return ListCard(
                       // items: thisListItems,

                       );
                      }               
                 //   },
                    
                  ),
               ),
      ),
    );
  }
}