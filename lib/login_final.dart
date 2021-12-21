

import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialsignin/userdetails.dart';

class Login with ChangeNotifier {
  var _googleSignin = GoogleSignIn();
  GoogleSignInAccount? _gaccount;

  UserDetails? details;

  googlelogin() async {
    this._gaccount = await _googleSignin.signIn();
    this.details = new UserDetails(
      Name: this._gaccount!.displayName,
      email: this._gaccount!.email,
      photoURL: this._gaccount!.photoUrl,
    );

    notifyListeners();
  }


  facebooklogin() async {

    var result = await FacebookAuth.i.login(
        permissions: ["public_profile", "email"]);

    if (result.status == LoginStatus.success) {
      final userdata = await FacebookAuth.i.getUserData(
        fields: "email,name,picture",
      );

      this.details = new UserDetails(
        Name: userdata["name"],
        email: userdata["email"],
        photoURL: userdata["picture"]["data"]["url"]??'',
      );

      notifyListeners();
    }
  }

  logout() async {
    await FacebookAuth.i.logOut();
    this._gaccount =await _googleSignin.signOut();
    details=null;
    notifyListeners();
  }

}