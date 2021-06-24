import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import '../model/User.dart';
import '../model/product.dart';
import 'AuthNotifier.dart';
import 'FoodNotifier.dart';

Future<String> getJsonFromFirebaseRestAPI() async {
  String url = "https://onlinebhajipalamarket.firebaseio.com/items.json?";
  http.Response response = await http.get(Uri.parse(url));
  return response.body;
}

getFoods(FoodNotifier foodNotifier) async {
  List<Food> _foodList = [];

  String jsonString = await getJsonFromFirebaseRestAPI();
  final jsonResponse = json.decode(jsonString);
  print(jsonResponse);
  for (var i in jsonResponse.values){
    if(i!=null)
      print(i);
      _foodList.add(Food.fromMap(i));
  }
  foodNotifier.foodList = _foodList;
}

login(Users user, AuthNotifier authNotifier) async {
  UserCredential authResult = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: user.email, password: user.password)
      // ignore: invalid_return_type_for_catch_error
      .catchError((error) => print(error.code));

  if (authResult != null) {
    User firebaseUser = authResult.user;

    if (firebaseUser != null) {
      print("Log In: $firebaseUser");
      authNotifier.setUser(firebaseUser);
    }
  }
}

signup(Users user, AuthNotifier authNotifier) async {
  try{UserCredential authResult = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((error) => print(error.code));

  if (authResult != null) {
    User firebaseUser = authResult.user;

    if (firebaseUser != null) {
      await firebaseUser.updateDisplayName(user.displayName);

      await firebaseUser.reload();

      print("Sign up: $firebaseUser");

      User currentUser = await FirebaseAuth.instance.currentUser;
      authNotifier.setUser(currentUser);
    }
  }}catch(error) {
print(error);
  }
}

signout(AuthNotifier authNotifier) async {
  await FirebaseAuth.instance.signOut().catchError((error) => print(error.code));

  authNotifier.setUser(null);
}

initializeCurrentUser(AuthNotifier authNotifier) async {
  User firebaseUser = await FirebaseAuth.instance.currentUser;

  if (firebaseUser != null) {
    print(firebaseUser);
    authNotifier.setUser(firebaseUser);
  }
}