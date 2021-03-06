import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jamaithius_family/ui/Screens/DashBoardScreen/homeScreen.dart';
import 'package:jamaithius_family/ui/Screens/LoginScreen/loginScreen.dart';
import 'Services/familyService.dart';
import 'Services/memberService.dart';
import 'Services/familySearchService.dart';
import 'Services/userService.dart';
import 'config/methods.dart';


void setUpLocator() {
  GetIt.I.registerLazySingleton(() => FamilyService());
  GetIt.I.registerLazySingleton(() => MemberService());
  GetIt.I.registerLazySingleton(() => FamilySearchService());
  GetIt.I.registerLazySingleton(() => UserService());
}

void main() async {
  
// add this, and it should be the first line in main method
  WidgetsFlutterBinding.ensureInitialized();

//Set up locator function
  setUpLocator();


 // Set default home.
  Widget _defaultHome = new LoginScreen();
  LoginPrefrences loginPrefrences = LoginPrefrences();
  bool _result = await loginPrefrences.getUser();
  if (_result) {
    _defaultHome = new DashBordScreen();
  } 

//  runApp(MyApp());

 // Run app!
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
      // Set routes for using the Navigator.
      '/home': (BuildContext context) => new DashBordScreen(),
      '/login': (BuildContext context) => new LoginScreen()
    },
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: DashBordScreen() ,
    );
  }
}
