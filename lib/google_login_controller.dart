import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController with ChangeNotifier {
  var _googleSignin = GoogleSignIn();
  GoogleSignInAccount? gaccount;

  login() async{
    this.gaccount= await _googleSignin.signIn();
    notifyListeners();
  }

  logout() async{
    this.gaccount =await _googleSignin.signOut();
    notifyListeners();
  }
}