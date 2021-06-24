import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FRBSAuth{
  final fb = FacebookLogin();
  final googleSignIn = GoogleSignIn(scopes: ['email']);

  loginFacebook() async {
    print('Starting Facebook Login');
    final res = await fb.logIn(
        permissions: [
          FacebookPermission.publicProfile,
          FacebookPermission.email
        ]
    );

    switch(res.status){
      case FacebookLoginStatus.success:
        print('It worked');

        //Get Token
        final FacebookAccessToken fbToken = res.accessToken;

        //Convert to Auth Credential
        final AuthCredential credential
        = FacebookAuthProvider.credential(fbToken.token);

        //User Credential to Sign in with Firebase
        final result = await auth.signInWithCredential(credential);

        print('${result.user.displayName} is now logged in');

        break;
      case FacebookLoginStatus.cancel:
        print('The user canceled the login');
        break;
      case FacebookLoginStatus.error:
        print('There was an error');
        break;
    }
  }

  loginGoogle() async {

    try {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken
      );

      //Firebase Sign in
      final result = await auth.signInWithCredential(credential);

      print('${result.user.displayName}');

    } catch(error){
      print(error);
    }

  }

  static FirebaseAuth auth=FirebaseAuth.instance;

  static signInWithCredential(AuthCredential credential) => auth.signInWithCredential(credential);

  static loginEmail(email,password)async{
    try{
      UserCredential result=await auth.signInWithEmailAndPassword(email: email, password: password);
      if(result.user != null){
        return auth.currentUser;
      }
    }catch(e){
      return throw e;
    }
  }
  static signupEmail(email,password,displayName)async{
    try{
      UserCredential result=await auth.createUserWithEmailAndPassword(email: email, password: password,);
      if(result.user != null){
        // ignore: deprecated_member_use
        await auth.currentUser.updateProfile(displayName: displayName);
        return auth.currentUser;
      }
    }catch(e){
      print(e);
      return throw e;
    }
  }
  static logoutMail()async{
    await Future.delayed(Duration(milliseconds: 1000));
    await auth.signOut();
  }
}