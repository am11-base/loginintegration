import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInController with ChangeNotifier{
  Map? fbdata;

  login() async{
    var result = await FacebookAuth.i.login(
      permissions: ["public_profile","email"]);

    if(result.status==LoginStatus.success)
      {
        final userdata=await FacebookAuth.i.getUserData(
          fields: "email,name,picture",
        );

        fbdata=userdata;
        notifyListeners();
      }
  }

  logout() async{
    await FacebookAuth.i.logOut();
    fbdata=null;
    notifyListeners();
}
}