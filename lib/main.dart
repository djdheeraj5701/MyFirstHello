import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  List vf=await getVisitingFlag();
  runApp(MyApp(b:vf[0],n:vf[1][2]));
}

getVisitingFlag()async{
  SharedPreferences preferences=await SharedPreferences.getInstance();
  print(preferences);
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
        // routes: {
        //   '/onboarding':(context)=>OnBoardingScreen(),
        //   '/signin':(context)=>SignInScreen(),
        //   '/signup':(context)=>SignUpScreen(),
        //   '/mycart':(context)=>MyCartScreen(),
        // },
        home: b?MyCartScreen():SignInScreen()
    );
  }
}

class MyCartScreen extends StatefulWidget {
  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  forSignin() async {
    try{
      setState(() {
        // store in shared preferences
        setVisitingFlag(
            false,"yes","no","maybe"
        );
        Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder: (context) => SignInScreen()),
        );
      }
      );
    }catch(e){

    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: forSignin,
            child: Text("This is cart"),
          ),
        ),
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

setVisitingFlag(b,e,p,n)async{
  SharedPreferences preferences=await SharedPreferences.getInstance();
  await preferences.setBool("userlogged",b);
  await preferences.setStringList("cred",[e,p,n]);
}

class _SignInScreenState extends State<SignInScreen> {

  forSignin() async {
    try{
      setState(() {
          // store in shared preferences
          setVisitingFlag(
              true,"yes","no","maybe"
          );
          Navigator.pushReplacement(context,
            MaterialPageRoute(
                builder: (context) => MyCartScreen()),
          );
        }
      );
    }catch(e){

    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: forSignin,
            child: Text("this is sign in"),
          ),
        ),
      ),
    );
  }
}
