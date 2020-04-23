import 'package:flutter/material.dart';
import 'package:jamaithius_family/config/appConstants.dart';
import 'package:jamaithius_family/ui/Screens/MemebersScreen/memeberlistCard.dart';

class MemeberListScreen extends StatefulWidget {
  @override
  _MemeberListScreenState createState() => _MemeberListScreenState();
}

class _MemeberListScreenState extends State<MemeberListScreen> {
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
          title: Text("All Members"),
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

                        
                              return MemeberListCard(
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