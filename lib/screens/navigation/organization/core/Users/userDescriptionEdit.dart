import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/databasemodels/RowSourceDropdown.dart';
import 'package:MMLMobile/models/organization/PI_88_PRI_206_PRCI_818_Items.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_state/gs.dart';

class UserDescriptionEdit extends StatefulWidgetGS {
  @override
  _UserDescriptionEditState createState() => _UserDescriptionEditState();
}

class _UserDescriptionEditState extends State<UserDescriptionEdit> {
  AppDatabase appDatabase;
  bool isPressed = false;
  bool activeStatus = null;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController middle = TextEditingController();
  TextEditingController usercode = TextEditingController();
  TextEditingController emailPrimary = TextEditingController();
  TextEditingController emailAlternate = TextEditingController();
  TextEditingController phonePrimary = TextEditingController();
  TextEditingController phoneAlternate = TextEditingController();
  RowsourceDropDown _rowSource_13_24_6_2;
  RowsourceDropDown _rowSource;
  bool formChangeDetected = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
    builder();
    imageCache.clear();
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  activeStatusChange(val) {
    setState(() {
      activeStatus = val;
    });
  }

  builder() async {
    appDatabase = await $FloorAppDatabase.databaseBuilder('mml.db').build();
  }

  @override
  Widget build(BuildContext context) {
    final pi_88_PRI_206_PRCI_818_Items =
        APIConstants.pi_88_PRI_206_PRCI_818_Items.length > 0
            ? APIConstants.pi_88_PRI_206_PRCI_818_Items[0]
            : null;
    TvpCrmUsersDATA tvpUsers_APP_DATA;
    if (pi_88_PRI_206_PRCI_818_Items != null) {
      if (pi_88_PRI_206_PRCI_818_Items.tvpCrmUsersDATA != null) {
        tvpUsers_APP_DATA =
            pi_88_PRI_206_PRCI_818_Items.tvpCrmUsersDATA.length > 0
                ? pi_88_PRI_206_PRCI_818_Items.tvpCrmUsersDATA[0]
                : null;
        if (tvpUsers_APP_DATA != null) {
          if (firstName.text == "" && !formChangeDetected) {
            firstName.text = tvpUsers_APP_DATA.strFirstName;
          }
          if (lastName.text == "" && !formChangeDetected) {
            lastName.text = tvpUsers_APP_DATA.strLastName;
          }
          if (middle.text == "" && !formChangeDetected) {
            middle.text = tvpUsers_APP_DATA.strMiddleName;
          }
          if (usercode.text == "" && !formChangeDetected) {
            usercode.text = tvpUsers_APP_DATA.strUserCode1;
          }
          if (emailPrimary.text == "" && !formChangeDetected) {
            emailPrimary.text = tvpUsers_APP_DATA.strEmail1;
          }
          if (emailAlternate.text == "" && !formChangeDetected) {
            emailAlternate.text = tvpUsers_APP_DATA.strEmail2;
          }
          if (phonePrimary.text == "" && !formChangeDetected) {
            phonePrimary.text = tvpUsers_APP_DATA.strPhone1;
          }
          if (phoneAlternate.text == "" && !formChangeDetected) {
            phoneAlternate.text = tvpUsers_APP_DATA.strPhone2;
          }
          if (activeStatus == null && !formChangeDetected) {
            activeStatus = tvpUsers_APP_DATA.blnIsActive;
          }
          if (_rowSource_13_24_6_2 == null &&
              APIConstants.rowSource_RS_13_24_6_2.length > 0) {
            int index =
                APIConstants.rowSource_RS_13_24_6_2.indexWhere((element) {
              return element.i == tvpUsers_APP_DATA.intOrganizationNode1_autoID;
            });

            if (index != -1 && _rowSource_13_24_6_2 == null) {
              _rowSource_13_24_6_2 = APIConstants.rowSource_RS_13_24_6_2[index];
            }
          }
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        backgroundColor: Colors.white,
        title: Text(
          '${tvpUsers_APP_DATA != null ? tvpUsers_APP_DATA.strSummaryID : "Person"}',
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
                        // Navigator.of(context).pop();

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
            alignment: Alignment.centerLeft,
            child: Text("CANCEL",
                style: TextStyle(
                    fontSize: 14,
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
                      "autoTvpID": tvpUsers_APP_DATA.autoTvpID
                      // 'strThingName':  "[[NULL]]",
                      // 'strUserCode1':  "[[NULL]]",
                      // 'strDescription': "[[NULL]]"
                    };
                    if (tvpUsers_APP_DATA.strFirstName != firstName.text) {
                      editFields['strFirstName'] =
                          (firstName.text != null && firstName.text != "")
                              ? firstName.text
                              : "[[NULL]]";
                    }
                    if (tvpUsers_APP_DATA.strLastName != lastName.text) {
                      editFields['strLastName'] =
                          (lastName.text != null && lastName.text != "")
                              ? lastName.text
                              : "[[NULL]]";
                    }
                    if (tvpUsers_APP_DATA.strMiddleName != middle.text) {
                      editFields['strMiddleName'] =
                          (middle.text != null && middle.text != "")
                              ? middle.text
                              : "[[NULL]]";
                    }
                    if (tvpUsers_APP_DATA.strUserCode1 != usercode.text) {
                      editFields['strUserCode1'] =
                          (usercode.text != null && usercode.text != "")
                              ? usercode.text
                              : "[[NULL]]";
                    }
                    if (tvpUsers_APP_DATA.strEmail1 != emailPrimary.text) {
                      editFields['strEmail1'] =
                          (emailPrimary.text != null && emailPrimary.text != "")
                              ? emailPrimary.text
                              : "[[NULL]]";
                    }
                    if (tvpUsers_APP_DATA.strEmail2 != emailAlternate.text) {
                      editFields['strEmail2'] = (emailAlternate.text != null &&
                              emailAlternate.text != "")
                          ? emailAlternate.text
                          : "[[NULL]]";
                    }
                    if (tvpUsers_APP_DATA.strPhone1 != phonePrimary.text) {
                      editFields['strPhone1'] =
                          (phonePrimary.text != null && phonePrimary.text != "")
                              ? phonePrimary.text
                              : "[[NULL]]";
                    }

                    if (tvpUsers_APP_DATA.strPhone2 != phoneAlternate.text) {
                      editFields['strPhone2'] = (phoneAlternate.text != null &&
                              phoneAlternate.text != "")
                          ? phoneAlternate.text
                          : "[[NULL]]";
                    }

                    if (tvpUsers_APP_DATA.blnIsActive != activeStatus) {
                      editFields['blnIsActive'] = activeStatus;
                    }


                    if (tvpUsers_APP_DATA.intOrganizationNode1_autoID !=
                        _rowSource_13_24_6_2.i) {
                      editFields['intOrganizationNode1_autoID'] =
                          (_rowSource_13_24_6_2.i != null &&
                                  _rowSource_13_24_6_2.i != 0)
                              ? _rowSource_13_24_6_2.i
                              : "[[NULL]]";
                    }
                    // if (tvpThingsDATA.intOrganizationNode1AutoID !=
                    //     _rowItem.i) {
                    //   editFields['strThingType'] =
                    //       (_rowItem.d != null && _rowItem.d != "")
                    //           ? _rowItem.d
                    //           : "[[NULL]]";
                    // }

                    Map<String, dynamic> bodyDataCustom = {
                      "ClientDataJson": {
                        "jDT": [
                          {
                            "PRCI": 818,
                            "DT": {
                              "tvpCrmUsers_DATA": [editFields],
                            },
                            "ND": true
                          }
                        ]
                      }
                      // "ImageIndex": imageIndex,
                    };
                    await UtilMethods.eventSave(
                        appDatabase, context, 238, bodyDataCustom);
                  } else {
                    await UtilMethods.eventBack(
                        appDatabase, context, GlobalState.PI);
                  }
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
      backgroundColor: Colors.grey[300],
      body: Form(
          key: _formKey,
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Container(
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.all(6),
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      // height: MediaQuery.of(context).size.height * 0.10,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            formChangeDetected = true;
                          });
                        },
                        controller: firstName,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "First name is required";
                          }
                        },
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            suffix: Text(
                              "${firstName.text == "" ? "(Required)" : ""}",
                              style: TextStyle(fontSize: 14),
                            ),
                            hoverColor: Colors.black,
                            border: OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            labelText: 'First Name *',
                            hintText: 'First Name',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16),
                            contentPadding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02,
                                left: 15)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      // height: MediaQuery.of(context).size.height * 0.10,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            formChangeDetected = true;
                          });
                        },
                        controller: middle,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            hoverColor: Colors.black,
                            border: OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            labelText: 'Middle',
                            hintText: 'Middle',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16),
                            contentPadding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02,
                                left: 15)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      // height: MediaQuery.of(context).size.height * 0.10,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            formChangeDetected = true;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Last name is required";
                          }
                        },
                        controller: lastName,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            hoverColor: Colors.black,
                            border: OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            suffix: Text(
                              "${lastName.text == "" ? "(Required)" : ""}",
                              style: TextStyle(fontSize: 14),
                            ),
                            labelText: 'Last *',
                            hintText: 'Last',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16),
                            contentPadding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02,
                                left: 15)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.all(6),
                height: MediaQuery.of(context).size.height * 0.27,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      // height: MediaQuery.of(context).size.height * 0.10,
                      child: TextField(
                        controller: usercode,
                        onChanged: (value) {
                          setState(() {
                            formChangeDetected = true;
                          });
                        },
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            hoverColor: Colors.black,
                            border: OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            labelText: 'User Code',
                            hintText: 'User Code',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16),
                            contentPadding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02,
                                left: 15)),
                      ),
                    ),
                    // SizedBox(height: 30),
                    Container(
                        padding: EdgeInsets.all(8),
                        // height: MediaQuery.of(context).size.height * 0.10,
                        child: new DropdownButtonFormField<RowsourceDropDown>(
                          isExpanded: true,
                          decoration: const InputDecoration(
                            labelText: 'Type',
                            fillColor: Colors.black,
                            hintText: 'Please Enter Type',
                            border: OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            contentPadding: EdgeInsets.all(11),
                          ),
                          hint: new Text(''),
                          value: _rowSource_13_24_6_2 == null
                              ? null
                              : _rowSource_13_24_6_2,
                          items: (APIConstants.rowSource_RS_13_24_6_2.length > 0
                                  ? APIConstants.rowSource_RS_13_24_6_2
                                  : new List<RowsourceDropDown>())
                              .map((dynamic value) {
                            return new DropdownMenuItem<RowsourceDropDown>(
                              value: value,
                              child: new Text(
                                value.d.toString(),
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (dynamic newValue) {
                            setState(() {
                              _rowSource_13_24_6_2 = newValue;
                              formChangeDetected = true;
                            });
                          },
                        )),
                    // Container(
                    //   padding: EdgeInsets.all(8),
                    //   // height: MediaQuery.of(context).size.height * 0.10,
                    //   child: TextField(
                    //     // controller:,
                    //     cursorColor: Colors.black,
                    //     decoration: InputDecoration(
                    //         hoverColor: Colors.black,
                    //         border: OutlineInputBorder(),
                    //         focusedBorder: const OutlineInputBorder(
                    //           borderSide:
                    //               const BorderSide(color: Colors.grey, width: 2.0),
                    //         ),
                    //         enabledBorder: const OutlineInputBorder(
                    //           borderSide:
                    //               const BorderSide(color: Colors.grey, width: 2.0),
                    //         ),
                    //         labelStyle:
                    //             TextStyle(color: Colors.black, fontSize: 14),
                    //         labelText: 'Type',
                    //         hintText: 'Type',
                    //         hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    //         contentPadding: EdgeInsets.only(
                    //             top: MediaQuery.of(context).size.height * 0.02,
                    //             left: 15)),
                    //   ),
                    // ),
                    Container(
                      padding: EdgeInsets.all(8),
                      // height: MediaQuery.of(context).size.height * 0.10,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            formChangeDetected = true;
                          });
                        },
                        //controller: ,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            hoverColor: Colors.black,
                            border: OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            labelText: 'Job Title',
                            hintText: 'Job Title',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16),
                            contentPadding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02,
                                left: 15)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.all(6),
                height: MediaQuery.of(context).size.height * 0.36,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      // height: MediaQuery.of(context).size.height * 0.10,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            formChangeDetected = true;
                          });
                        },
                        controller: emailPrimary,
                        cursorColor: Colors.black,
                        enabled: false,
                        decoration: InputDecoration(
                            hoverColor: Colors.black,
                            border: OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            labelText: 'Email(Primary)',
                            hintText: 'Email(Primary)',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16),
                            contentPadding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02,
                                left: 15)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      // height: MediaQuery.of(context).size.height * 0.10,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            formChangeDetected = true;
                          });
                        },
                        controller: emailAlternate,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            hoverColor: Colors.black,
                            border: OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            labelText: 'Email(Alternatively)',
                            hintText: 'Email(Alternatively)',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16),
                            contentPadding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02,
                                left: 15)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      // height: MediaQuery.of(context).size.height * 0.10,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            formChangeDetected = true;
                          });
                        },
                        controller: phonePrimary,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            hoverColor: Colors.black,
                            border: OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            labelText: 'Phone(Primary)',
                            hintText: 'Phone(Primary)',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16),
                            contentPadding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02,
                                left: 15)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      // height: MediaQuery.of(context).size.height * 0.10,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            formChangeDetected = true;
                          });
                        },
                        controller: phoneAlternate,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            hoverColor: Colors.black,
                            border: OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            labelText: 'Phone(Alternatively)',
                            hintText: 'Phone(Alternatively)',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16),
                            contentPadding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02,
                                left: 15)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.all(6),
                  margin: EdgeInsets.all(6),
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.002,
                              top: MediaQuery.of(context).size.height * 0.025),
                          child: RichText(
                            text: TextSpan(
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: activeStatus ? 'Active' : 'InActive',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal),
                                  )
                                ],
                                text: 'Status:\t\t\t',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.height * 0.002,
                              top: MediaQuery.of(context).size.height * 0.018),
                          child: Switch(
                            onChanged: (val) {
                              setState(() {
                                formChangeDetected = true;
                                activeStatus = val;
                              });
                            },
                            value: activeStatus,
                            activeColor: Colors.green,
                            inactiveTrackColor: Colors.grey,
                          ))
                    ],
                  ))
            ],
          )),
    );
  }
}
