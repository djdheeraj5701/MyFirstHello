import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'mycartscreen.dart';
import '../Services/signinupservices.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Services/generalservices.dart';
import '../Widgets/signinupwidgets.dart';

setVisitingFlag(b,e,p,n)async{
  SharedPreferences preferences=await SharedPreferences.getInstance();
  await preferences.setBool("userlogged",b);
  await preferences.setStringList("cred",[e,p,n]);
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  InputController inputController=new InputController();

  forSignin() async {
    print(inputController.email.text+":"+inputController.password.text);
    try{
      User x=await FRBSAuth.loginEmail(inputController.email.text, inputController.password.text);
      setState(() {
        if(x!=null){
          // store in shared preferences
          setVisitingFlag(
              true,
              inputController.email.text,
              inputController.password.text,
              FRBSAuth.auth.currentUser.displayName);
          Navigator.pushReplacement(context,
            MaterialPageRoute(
                builder: (context) => MyCartScreen()),
          );
        }
      });
    }catch(e){

    }
  }
  
  forForgotPassword(){
    print("Forgot yaar");
  }

  forSignup(){
    print("Go to signup");
    Navigator.of(context).pushReplacementNamed('/signup');
  }

  @override
  void initState(){
    onlyPortraitMode();
    super.initState();
  }

  @override
  dispose(){
    allOrientationModes();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff07FEC9),
          body: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height*0.1,
                left: MediaQuery.of(context).size.width*0.05,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.8,
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30,bottom: 10),
                          child: Text(
                            'Welcome',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Text(
                          'Sign in to your account',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        EmailInput(inputController.email),
                        PasswordInput(inputController.password),
                        Padding(
                          padding: EdgeInsets.only(top:12.0,right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [HyperLink('Forgot Password?', forForgotPassword)],
                          ),
                        ),
                        SubmitButton('Sign in', forSignin),
                        SigninAlternative('in'),
                        Padding(
                          padding: EdgeInsets.only(top:10.0,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                    fontSize: 18,
                                  fontWeight: FontWeight.w300
                                ),
                              ),
                              HyperLink('Sign up now!', forSignup)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  InputController inputController=new InputController();

  forSignin(){
    print("Go to signin");
    Navigator.of(context).pushReplacementNamed('/signin');
  }

  forSignup() async {
    print(inputController.email.text+":"+inputController.password.text);
    try{
      User x=await FRBSAuth.signupEmail(inputController.email.text,inputController.password.text,inputController.name.text);
      setState(() {
        if(x!=null){
          setVisitingFlag(
              true,
              inputController.email.text,
              inputController.password.text,
              FRBSAuth.auth.currentUser.displayName);
          Navigator.pushReplacement(context,
            MaterialPageRoute(
                builder: (context) => MyCartScreen()),
          );
        }
      });
    }catch(e){
    }
  }

  @override
  void initState(){
    onlyPortraitMode();
    super.initState();
  }

  @override
  dispose(){
    allOrientationModes();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff07FEC9),
        body: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height*0.1,
              left: MediaQuery.of(context).size.width*0.05,
              child: Container(
                height: MediaQuery.of(context).size.height*0.8,
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          'Create a new Account',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      NameInput(inputController.name),
                      EmailInput(inputController.email),
                      PasswordInput(inputController.password),
                      SubmitButton('Sign up', forSignup),
                      SigninAlternative('up'),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300
                              ),
                            ),
                            HyperLink('Sign in now!', forSignin)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

