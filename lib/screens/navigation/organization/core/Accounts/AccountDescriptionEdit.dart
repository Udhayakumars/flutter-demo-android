import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/databasemodels/RowSourceDropdown.dart';
import 'package:MMLMobile/models/organization/PI_85_PRI_203_PRCI_815_Items.dart';
import 'package:MMLMobile/models/organization/PRCI_786_Items.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_state/gs.dart';

class AccountDescriptionEdit extends StatefulWidgetGS {
  @override
  _AccountDescriptionEditState createState() => _AccountDescriptionEditState();
}

class _AccountDescriptionEditState extends State<AccountDescriptionEdit> {
  AppDatabase appDatabase;
  TextEditingController name = TextEditingController();
  TextEditingController usercode = TextEditingController();
  TextEditingController domain = TextEditingController();
  RowsourceDropDown _rowItem;
  bool formChangeDetected = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    builder();
    imageCache.clear();
    // APIConstants.page_PRCI_786_Items.clear();
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
  }

  @override
  Widget build(BuildContext context) {
    final pi_85_PRI_203_PRCI_815_Items =
        APIConstants.pi_85_PRI_203_PRCI_815_Items.length > 0
            ? APIConstants.pi_85_PRI_203_PRCI_815_Items[0]
            : null;

    // print(pi_89_PRI_207_PRCI_786_Items.toJson());
    TvpAccountsDATA tvpAccountsDATA;
    if (pi_85_PRI_203_PRCI_815_Items != null) {
      if (pi_85_PRI_203_PRCI_815_Items.tvpAccountsDATA != null) {
        tvpAccountsDATA =
            pi_85_PRI_203_PRCI_815_Items.tvpAccountsDATA.length > 0
                ? pi_85_PRI_203_PRCI_815_Items.tvpAccountsDATA[0]
                : null;
        if (tvpAccountsDATA != null) {
          if (name.text == "" && !formChangeDetected) {
            name.text = tvpAccountsDATA.strAccountName;
          }
          if (usercode.text == "" && !formChangeDetected) {
            usercode.text = tvpAccountsDATA.strUserCode1;
          }
          if (domain.text == "" && !formChangeDetected) {
            domain.text = tvpAccountsDATA.strDomain;
          }

        }
      }
    }

    return Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          backgroundColor: Colors.white,
          title: Text(
            'ACCOUNT',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () async {
              // set up the button

              // show the dialog
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    title: Text("Warning"),
                    content: Text("Your changes will be lost"),
                    actions: [
                      FlatButton(
                        child: Text("OK"),
                        onPressed: () async {
                          Navigator.of(dialogContext).pop();
                          await UtilMethods.eventBack(
                              appDatabase, context, GlobalState.PI);
                        },
                      ),
                      FlatButton(
                        child: Text("CANCEL"),
                        onPressed: () async {
                          // Navigator.of(context).pop();
                          // if (Navigator.canPop(dialogContext)) {
                          Navigator.of(dialogContext).pop();
                          // }
                        },
                      )
                    ],
                  );
                },
              );
              // await UtilMethods.eventBack(appDatabase, context, 94);
            },
            child: Align(
              alignment: Alignment.center,
              child: Text("CANCEL",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
            ),
          ),
          actions: [
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () async {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    if (formChangeDetected) {
                      Map editFields = {
                        // 'strThingName':  "[[NULL]]",
                        // 'strUserCode1':  "[[NULL]]",
                        // 'strDescription': "[[NULL]]"
                      };
                      if (tvpAccountsDATA.strAccountName != name.text) {
                        editFields['strAccountName'] =
                            (name.text != null && name.text != "")
                                ? name.text
                                : "[[NULL]]";
                      }
                      if (tvpAccountsDATA.strUserCode1 != usercode.text) {
                        editFields['strUserCode1'] =
                            (usercode.text != null && usercode.text != "")
                                ? usercode.text
                                : "[[NULL]]";
                      }
                      if (tvpAccountsDATA.strDomain != domain.text) {
                        editFields['strDomain'] =
                            (domain.text != null && domain.text != "")
                                ? domain.text
                                : "[[NULL]]";
                      }

                      Map<String, dynamic> bodyDataCustom = {
                        "ClientDataJson": {
                          "jDT": [
                            {
                              "PRCI": 815,
                              "DT": {
                                "tvpAccounts_DATA": [editFields],
                              },
                              "ND": true
                            }
                          ]
                        }
                        // "ImageIndex": imageIndex,
                      };
                      await UtilMethods.eventSave(
                          appDatabase, context, 235, bodyDataCustom);
                    }else{
                      await UtilMethods.eventBack(appDatabase, context, GlobalState.PI);
                    }
                    // if (!GlobalState.errorCallMsgShown) {
                    //   await UtilMethods.eventBack(
                    //       appDatabase, context, GlobalState.PI);
                    // }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("SAVE",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  ),
                ))
          ],
        ),
        backgroundColor: Colors.white,
        body: Stack(children: [
          Visibility(
            child: Text(GlobalState.pageDataLoaded.toString()),
            visible: false,
          ),
          Container(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                  child:ListView(
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    controller: name,
                    maxLines: 1,
                    onChanged: (value) {
                      setState(() {
                        formChangeDetected = true;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Name is required";
                      }
                    },
                    // obscureText: true,
                    decoration:  InputDecoration(
                      labelText: 'Name',
                      suffix: Text(
                        "${name.text == "" ? "(Required)" : ""}",
                        style: TextStyle(fontSize: 14),
                      ),
                      fillColor: Colors.black,
                      hintText: 'Please Enter name',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      contentPadding: EdgeInsets.all(11),
                    ),
                    // // keyboardType: TextInputType.visiblePassword,
                    // validator: (String value) {
                    //   if (value.isEmpty)
                    //     return '';
                    //   else
                    //     return null;
                    // },
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: usercode,
                    onChanged: (value) {
                      setState(() {
                        formChangeDetected = true;
                      });
                    },
                    maxLines: 1,
                    // obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'UserCode',
                      fillColor: Colors.black,
                      hintText: 'Please Enter UserCode',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      contentPadding: EdgeInsets.all(11),
                    ),
                    // // keyboardType: TextInputType.visiblePassword,
                    // validator: (String value) {
                    //   if (value.isEmpty)
                    //     return '';
                    //   else
                    //     return null;
                    // },
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: domain,
                    onChanged: (value) {
                      setState(() {
                        formChangeDetected = true;
                      });
                    },
                    // obscureText: true,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      labelText: 'Domain',
                      fillColor: Colors.black,
                      hintText: 'Please Enter Domain',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      contentPadding: EdgeInsets.all(11),
                    ),
                    // // keyboardType: TextInputType.visiblePassword,
                    // validator: (String value) {
                    //   if (value.isEmpty)
                    //     return '';
                    //   else
                    //     return null;
                    // },
                  ),
                ],
              ))),
          if (GlobalState.apiLoading) PageDataLoader(),
        ]));
  }
}
