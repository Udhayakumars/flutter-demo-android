import 'dart:convert';

import 'package:MMLMobile/models/UserLogin.dart';
import 'package:MMLMobile/networking/ApiBaseHelper.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'dart:developer' as developer;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [logoStyle(), loginDesign()],
          ),
        ));
  }

  Widget logoStyle() {
    return new Align(
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(-100.0)),
        child: Image.asset(
          'assets/images/loginScreen.jpg',
          width: double.infinity,
          height: 240,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  Widget loginDesign() {
    return Material(
        child: new Align(
      child: Column(
        children: [
          new Container(
            child: Text(
              'Login...',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new Padding(
                padding: EdgeInsets.only(top: 10, left: 0),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(fillColor: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  // ignore: missing_return
                  validator: (String args) {
                    var email = args;
                    bool emailValid;
                    emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email);
                    print(emailValid);
                  }),
              new Padding(
                padding: EdgeInsets.only(top: 10, left: 0),
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              TextFormField(
                controller: _pass,
                decoration: const InputDecoration(fillColor: Colors.black),
                keyboardType: TextInputType.visiblePassword,
                validator: (String value) {
                  if (value.isEmpty)
                    return 'Enter the Password';
                  else
                    return null;
                },
              ),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                color: Color(0xff01A0C7),
                child: MaterialButton(
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () async {
                      developer.log("Hi Flutter");
                      //developer.log(this.apiUrl);
                      //_email.notifyListeners();
                      print(_email.text);
                      print(_pass.text);

                      // var body = jsonEncode(<String, String>{
                      //   'userName': "dtalken@meqlib.com",
                      //   'Password': "Robbie69!",
                      // });


                      var body = jsonEncode(<String, String>{
                        'userName': _email.text,
                        'Password': _pass.text,
                      });

                      Map<dynamic, dynamic> userMap = await ApiBaseHelper().post(APIConstants.BASE_LOGIN, body, context);
                      var user = UserLogin.fromJson(userMap);
                      print(user.UserID);

                         if(user.UserID != null)
                         {
                           Preference.setItem("IsLoggedIn", user.access_token);
                           Navigator.of(context).pushReplacementNamed('/screens/HomeScreen');
                         }
                      // Map userMap = jsonDecode(ApiBaseHelper().post(APIConstants.BASE_LOGIN, body));
                      //
                      // var user = UserLogin.fromJson(userMap);
                      // print(_)
                      //print(user.UserID);

                    },
                    child: Text("Login", textAlign: TextAlign.center)),
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
