import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Pages/mycartscreen.dart';
import 'Pages/onboardingscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/signinupscreen.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  List vf=await getVisitingFlag();
  runApp(MyApp(b:vf[0],n:vf[1][2]));
}

getVisitingFlag()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    bool alreadyVisited=(await preferences.getBool("userlogged"))??false;
    List cred=(await preferences.getStringList("cred"))??["","",""];
    return [alreadyVisited,cred];
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool b;String n;
  MyApp({this.b,this.n});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/onboarding':(context)=>OnBoardingScreen(),
        '/signin':(context)=>SignInScreen(),
        '/signup':(context)=>SignUpScreen(),
        '/mycart':(context)=>MyCartScreen(),
      },
      home: b?MyCartScreen():SignInScreen()
    );
  }
}