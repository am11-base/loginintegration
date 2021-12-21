

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialsignin/google_login_controller.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_final.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40.0,),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: Text(
            "LOGIN",
            style:
                GoogleFonts.ubuntu(fontSize: 40.0, fontWeight: FontWeight.bold),
          ),
        ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0,20,0,100),
                  child: Text(
                    "The Sparks Foundation",
                    style:
                    GoogleFonts.ubuntu(fontSize: 20.0, fontWeight: FontWeight.normal,color: Colors.grey[800]),
                  ),
                ),
        loginUI()
      ])),
    );
  }

  loginUI() {
    return Consumer<Login>(builder: (context, model, child) {
      if (model.details != null) {
        return Container(
          child: loggedInUI(model),
        );
      } else {
        return loginControls(context);
      }
    });
  }

  loggedInUI(Login model) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              backgroundImage:
                  Image.network(model.details!.photoURL ?? '').image,
              radius: 70),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text( model.details!.Name ?? '',style: GoogleFonts.ubuntu(fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold),)),
          Padding(
              padding: EdgeInsets.fromLTRB(0,0,0,30),
              child: Text(model.details!.email ?? '',style: GoogleFonts.ubuntu(fontSize: 20.0,color: Colors.black),)),
          ActionChip(
            shape:ContinuousRectangleBorder(borderRadius:BorderRadius.all(Radius.elliptical(20, 10))),
            side: BorderSide(style: BorderStyle.solid),
            backgroundColor: Colors.cyan[400],
              label: Text('LOGOUT',style: TextStyle(fontSize: 15.0),),
              avatar: Icon(Icons.logout,color: Colors.black87,),
              onPressed: () {
                Provider.of<Login>(context, listen: false)
                    .logout();
              })
        ],
    );
  }

  loginControls(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: GestureDetector(
                child: Image.asset(
                  'asetts/glogin.png',
                  width: 250,
                  
                ),
                onTap: () {
                  Provider.of<Login>(context, listen: false)
                      .googlelogin();
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: GestureDetector(
                child: Image.asset(
                  'asetts/flogin.png',
                  width: 250,

                ),
                onTap: () {
                  Provider.of<Login>(context, listen: false)
                      .facebooklogin();
                }),
          ),
        ],
      ),
    );
  }
}
