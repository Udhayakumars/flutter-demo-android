import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/databasemodels/RowSourceDropdown.dart';
import 'package:MMLMobile/models/organization/PI_86_PRI_204_PRCI_816_Items.dart';
import 'package:MMLMobile/models/organization/PRCI_786_Items.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_state/gs.dart';
import 'package:intl/intl.dart';

class CompanyDescriptionEdit extends StatefulWidgetGS {
  @override
  _CompanyDescriptionEditState createState() => _CompanyDescriptionEditState();
}

class _CompanyDescriptionEditState extends State<CompanyDescriptionEdit> {
  AppDatabase appDatabase;
  TextEditingController name = TextEditingController();
  TextEditingController usercode = TextEditingController();
  TextEditingController founded = TextEditingController();
  TextEditingController description = TextEditingController();
  RowsourceDropDown _rowItem;
  bool formChangeDetected = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  bool activeStatus = null;

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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime((DateTime.now().year - 100), 1),
        lastDate: DateTime((DateTime.now().year + 50)));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        formChangeDetected = true;
        if (selectedDate != null) {
          founded.text = DateFormat('MM/dd/yyyy').format(selectedDate);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final pi_86_PRI_204_PRCI_816_Items =
        APIConstants.pi_86_PRI_204_PRCI_816_Items.length > 0
            ? APIConstants.pi_86_PRI_204_PRCI_816_Items[0]
            : null;

    // print(pi_89_PRI_207_PRCI_786_Items.toJson());
    TvpCrmCompaniesDATA tvpCrmCompaniesDATA;
    if (pi_86_PRI_204_PRCI_816_Items != null) {
      if (pi_86_PRI_204_PRCI_816_Items.tvpCrmCompaniesDATA != null) {
        tvpCrmCompaniesDATA =
            pi_86_PRI_204_PRCI_816_Items.tvpCrmCompaniesDATA.length > 0
                ? pi_86_PRI_204_PRCI_816_Items.tvpCrmCompaniesDATA[0]
                : null;
        if (tvpCrmCompaniesDATA != null) {
          if (name.text == "" && !formChangeDetected) {
            name.text = tvpCrmCompaniesDATA.strCrmCompanyName;
          }
          if (usercode.text == "" && !formChangeDetected) {
            usercode.text = tvpCrmCompaniesDATA.strUserCode1;
          }
          if (founded.text == "" && !formChangeDetected) {
            founded.text = tvpCrmCompaniesDATA.strFounded;
          }
          if (description.text == "" && !formChangeDetected) {
            description.text = tvpCrmCompaniesDATA.strDescription;
          }
          if (activeStatus == null && !formChangeDetected) {
            activeStatus = tvpCrmCompaniesDATA.blnIsActive;
          }

          if (_rowItem == null &&
              APIConstants.rowSource_RS_13_22_6_2.length > 0) {
            int index =
                APIConstants.rowSource_RS_13_22_6_2.indexWhere((element) {
              print(element.i);
              print(tvpCrmCompaniesDATA.intOrganizationNode1AutoID);
              print("********asfasdfasdf*********");
              return element.i ==
                  tvpCrmCompaniesDATA.intOrganizationNode1AutoID;
            });

            if (index != -1 && _rowItem == null) {
              _rowItem = APIConstants.rowSource_RS_13_22_6_2[index];
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
            'Company',
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
                      if (tvpCrmCompaniesDATA.strCrmCompanyName != name.text) {
                        editFields['strCrmCompanyName'] =
                            (name.text != null && name.text != "")
                                ? name.text
                                : "[[NULL]]";
                      }
                      if (tvpCrmCompaniesDATA.strUserCode1 != usercode.text) {
                        editFields['strUserCode1'] =
                            (usercode.text != null && usercode.text != "")
                                ? usercode.text
                                : "[[NULL]]";
                      }
                      if (tvpCrmCompaniesDATA.strDescription !=
                          description.text) {
                        editFields['strDescription'] =
                            (description.text != null && description.text != "")
                                ? description.text
                                : "[[NULL]]";
                      }
                      if (tvpCrmCompaniesDATA.strFounded != founded.text) {
                        editFields['strFounded'] =
                            (founded.text != null && founded.text != "")
                                ? founded.text
                                : "[[NULL]]";
                      }

                      if (tvpCrmCompaniesDATA.intOrganizationNode1AutoID !=
                          _rowItem.i) {
                        editFields['intOrganizationNode1_autoID'] =
                            (_rowItem.i != null && _rowItem.i != 0)
                                ? _rowItem.i
                                : "[[NULL]]";
                      }
                      if (tvpCrmCompaniesDATA.blnIsActive != activeStatus) {
                        editFields['blnIsActive'] = activeStatus;
                      }
                      // if (tvpCrmCompaniesDATA.intOrganizationNode1AutoID !=
                      //     _rowItem.i) {
                      //   editFields['strCrmCompanyType'] =
                      //       (_rowItem.d != null && _rowItem.d != "")
                      //           ? _rowItem.d
                      //           : "[[NULL]]";
                      // }

                      Map<String, dynamic> bodyDataCustom = {
                        "ClientDataJson": {
                          "jDT": [
                            {
                              "PRCI": 816,
                              "DT": {
                                "tvpCrmCompanies_DATA": [editFields],
                              },
                              "ND": true
                            }
                          ]
                        }
                        // "ImageIndex": imageIndex,
                      };
                      await UtilMethods.eventSave(
                          appDatabase, context, 236, bodyDataCustom);
                    } else {
                      await UtilMethods.eventBack(
                          appDatabase, context, GlobalState.PI);
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
        backgroundColor: Colors.grey[300],
        body: Stack(children: [
          Visibility(
            child: Text(GlobalState.pageDataLoaded.toString()),
            visible: false,
          ),
          Form(
            key:_formKey,
              child: ListView(physics: ClampingScrollPhysics(), children: [
            Container(
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.all(6),
                height: MediaQuery.of(context).size.height * 0.50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),

                // padding: EdgeInsets.all(16),
                child: ListView(children: [
                  SizedBox(height: 20),
                  TextFormField(
                    controller: name,
                    maxLines: 1,
                    onChanged: (value) {
                      setState(() {
                        formChangeDetected = true;
                      });
                    },
                    // obscureText: true,
                    decoration:  InputDecoration(
                      labelText: 'Name *',
                      suffix: Text(
                        "${name.text == "" ? "(Required)" : ""}",
                        style: TextStyle(fontSize: 14),
                      ),
                      fillColor: Colors.black,
                      hintText: 'Please Enter name',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding: EdgeInsets.all(11),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Name is required";
                      }
                    },
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
                  new DropdownButtonFormField<RowsourceDropDown>(
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Type',
                      fillColor: Colors.black,
                      hintText: 'Please Enter Type',
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
                    hint: new Text(''),
                    value: _rowItem == null ? null : _rowItem,
                    items: (APIConstants.rowSource_RS_13_22_6_2.length > 0
                            ? APIConstants.rowSource_RS_13_22_6_2
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
                        _rowItem = newValue;
                        formChangeDetected = true;
                      });
                    },
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: description,
                    onChanged: (value) {
                      setState(() {
                        formChangeDetected = true;
                      });
                    },
                    // obscureText: true,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      fillColor: Colors.black,
                      hintText: 'Please Enter Description',
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
                ])),
            Container(
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.all(6),
                height: MediaQuery.of(context).size.height * 0.10,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),

                // padding: EdgeInsets.all(16),
                child: ListView(
                  children: [
                    SizedBox(height: 18),
                    TextFormField(
                      readOnly: true,
                      controller: founded,
                      onTap: () {
                        _selectDate(context);
                      },
                      maxLines: 1,
                      decoration: const InputDecoration(
                        labelText: 'Founded',
                        fillColor: Colors.black,
                        hintText: 'Please Enter Founded',
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
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Founded is required";
                        }
                      },
                      // // keyboardType: TextInputType.visiblePassword,
                      // validator: (String value) {
                      //   if (value.isEmpty)
                      //     return '';
                      //   else
                      //     return null;
                      // },
                    ),
                  ],
                )),
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
          ])),
          if (GlobalState.apiLoading) PageDataLoader(),
        ]));
  }
}
