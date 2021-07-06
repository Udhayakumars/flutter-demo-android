import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:MMLMobile/networking/ApiBaseHelper.dart';
import 'package:MMLMobile/screens/LoginScreenV.dart';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:tuple/tuple.dart';


class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Container(),
          preferredSize: Size(0.0, 0.0),
        ),
        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          Column(children: <Widget>[
            logoStyle(),
            Center(child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return SafeArea(
                    child: forgotPassDesign(context),
                  );
                } else {
                  return SafeArea(
                    child: forgotPassDesign(context),
                  );
                }
              },
            )),
          ]),
        ]));
  }

  Widget logoStyle() {
    return new Align(
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0)),
        child: Image.asset(
          'assets/images/forgot_password.jpg',
          width: double.infinity,
          height: 250,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  String encryptAESCryptoJS(String plainText, String passphrase) {
    try {
    //  final salt = "BF03C0C6AB4DEB3C";
      final salt = genRandomWithNonZero(8);
      var keyndIV = deriveKeyAndIV(passphrase, salt);


      final key = encrypt.Key(utf8.encode(passphrase));
      final iv = encrypt.IV(utf8.encode(passphrase));

      final encrypter = encrypt.Encrypter(
          encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: "PKCS7"));
      final encrypted = encrypter.encrypt(plainText, iv: iv);

      // Uint8List encryptedBytesWithSalt = Uint8List.fromList(
      //     createUint8ListFromString("Salted__") + salt + encrypted.bytes);
      return encrypted.base64;
    } catch (error) {
      throw error;
    }
  }

  Uint8List genRandomWithNonZero(int seedLength) {
    final random = Random.secure();
    const int randomMax = 245;
    final Uint8List uint8list = Uint8List(seedLength);
    for (int i=0; i < seedLength; i++) {
      uint8list[i] = random.nextInt(randomMax)+1;
    }
    return uint8list;
  }


  Tuple2<Uint8List, Uint8List> deriveKeyAndIV(String passphrase, Uint8List salt) {
    var password = createUint8ListFromString(passphrase);
    Uint8List concatenatedHashes = Uint8List(0);
    Uint8List currentHash = Uint8List(0);
    bool enoughBytesForKey = false;
    Uint8List preHash = Uint8List(0);

    while (!enoughBytesForKey) {
      int preHashLength = currentHash.length + password.length + salt.length;
      if (currentHash.length > 0)
        preHash = Uint8List.fromList(
            currentHash + password + salt);
      else
        preHash = Uint8List.fromList(
            password + salt);

      currentHash = crypto.md5.convert(preHash).bytes;
      concatenatedHashes = Uint8List.fromList(concatenatedHashes + currentHash);
      if (concatenatedHashes.length >= 48) enoughBytesForKey = true;
    }

    var keyBtyes = concatenatedHashes.sublist(0, 32);
    var ivBtyes = concatenatedHashes.sublist(32, 48);
    return new Tuple2(keyBtyes, ivBtyes);
  }

  Uint8List createUint8ListFromString(String s) {
    var ret = new Uint8List(s.length);
    for (var i = 0; i < s.length; i++) {
      ret[i] = s.codeUnitAt(i);
    }
    return ret;
  }



  TextEditingController _email = TextEditingController();

  Widget forgotPassDesign(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: new Align(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
              ),
              new Padding(
                padding: EdgeInsets.only(top: 10, left: 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    fillColor: Colors.black,
                    hintText: 'Enter your email ID',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    contentPadding: EdgeInsets.only(bottom: 11, top: 11),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  // ignore: missing_return
                  validator: (String args) {
                    var email = args;
                    bool emailValid;
                    emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email);

                    return emailValid
                        ? null
                        : 'Email cannot be blank/not valid';
                    // print(emailValid);
                  }),
              Padding(
                padding: EdgeInsets.all(6.0),
              ),
              Stack(alignment: Alignment.center, children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.77,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: FlatButton(
                    child: Image.asset(
                      'assets/images/login_btn.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                    onPressed: () async {

                      final plainText = 'dtalken@meqlib.com';
                      final key = encrypt.Key.fromLength(32);
                      final iv = encrypt.IV.fromLength(16);

                      final encrypter =encrypt.Encrypter(encrypt.AES(key));

                      final encrypted = encrypter.encrypt(plainText, iv: iv);
                      final decrypted = encrypter.decrypt(encrypted, iv: iv);

                      print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
                      print(encrypted.base64); //

                      print(encryptAESCryptoJS(plainText, "BF03C0C6AB4DEB3C"));

                      Preference.getItem("IsLoggedIn");
                      print(_email.text);

                      var body = jsonEncode(<String, dynamic>{
                        'strLogin': encryptAESCryptoJS(plainText, "BF03C0C6AB4DEB3C"),
                        'IsActivation': false,
                        'EventName' : 'ForgotMailRequest',
                      });


                      Map<dynamic, dynamic> userMap = await ApiBaseHelper().post(APIConstants.GET_FORGOT_DETAILS, body, context);

                      print(_email.text);

                    },
                  ),
                ),
                Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ]),
              Padding(
                padding: EdgeInsets.all(24.0),
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(50)),
                  Text(
                    'Back to \t',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    child: new Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreenV()));
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
