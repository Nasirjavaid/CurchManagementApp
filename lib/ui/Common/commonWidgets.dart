
import 'package:flutter/material.dart';


class CommonWidgets {



static final  progressIndicator = Padding(
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 90),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Container(
            height: 20,
            width: 20,
            margin: EdgeInsets.all(5),
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ),
        ),
      ],
    ));


    static final  progressIndicatorBlue = Padding(
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 90),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Container(
            height: 20,
            width: 20,
            margin: EdgeInsets.all(5),
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
        ),
      ],
    ));





}