import 'dart:convert';

import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/databasemodels/RowSourceDropdown.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_13_23_6_2.dart';
import 'package:MMLMobile/models/organization/PI_87_PRI_205_PRCI_817_Items.dart';
import 'package:MMLMobile/models/organization/PRCI_786_Items.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_state/gs.dart';

class SiteDescriptionEdit extends StatefulWidgetGS {
  @override
  _SiteDescriptionEditState createState() => _SiteDescriptionEditState();
}

class _SiteDescriptionEditState extends State<SiteDescriptionEdit> {
  AppDatabase appDatabase;
  TextEditingController name = TextEditingController();
  TextEditingController usercode = TextEditingController();
  TextEditingController notes = TextEditingController();
  RowsourceDropDown _rowItem;
  bool formChangesDetected = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool activeStatus = null;

  @override
  void initState() {
    builder();
    imageCache.clear();
    APIConstants.page_PRCI_786_Items.clear();
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
    // print(APIConstants.rowSource_RS_13_23_6_2);
    final pi_87_PRI_205_PRCI_817_Items =
        APIConstants.pi_87_PRI_205_PRCI_817_Items.length > 0
            ? APIConstants.pi_87_PRI_205_PRCI_817_Items[0]
            : null;
    TvpCrmSitesDATA tvpSites_APP_DATA;
    List<JsonCrmAddressesDATA> jsonCrmAddresses;
    List<JsonCrmCommunicationsDATA> jsonCrmCommunications;
    if (pi_87_PRI_205_PRCI_817_Items != null) {
      if (pi_87_PRI_205_PRCI_817_Items.tvpCrmSitesDATA != null) {
        tvpSites_APP_DATA =
            pi_87_PRI_205_PRCI_817_Items.tvpCrmSitesDATA.length > 0
                ? pi_87_PRI_205_PRCI_817_Items.tvpCrmSitesDATA[0]
                : null;

        if (tvpSites_APP_DATA != null) {
          if (name.text == "" && !formChangesDetected) {
            name.text = tvpSites_APP_DATA.strCrmSiteName;
          }
          if (usercode.text == "" && !formChangesDetected) {
            usercode.text = tvpSites_APP_DATA.strUserCode1;
          }
          if (notes.text == "" && !formChangesDetected) {
            notes.text = tvpSites_APP_DATA.strDescription;
          }
          if (activeStatus == null && !formChangesDetected) {
            activeStatus = tvpSites_APP_DATA.blnIsActive;
          }
          if (APIConstants.rowSource_RS_13_23_6_2.length > 0) {
            int index = APIConstants.rowSource_RS_13_23_6_2.indexWhere(
                (element) =>
                    element.i == tvpSites_APP_DATA.intOrganizationNode1AutoID);
            if (index != -1 && _rowItem == null) {
              _rowItem = APIConstants.rowSource_RS_13_23_6_2[index];
            }
          }
          // }
          jsonCrmAddresses = tvpSites_APP_DATA.jsonCrmAddressesDATA;
          jsonCrmAddresses.sort((a, b) => a.intIndex1.compareTo(b.intIndex1));

          jsonCrmCommunications = tvpSites_APP_DATA.jsonCrmCommunicationsDATA;
          jsonCrmCommunications
              .sort((a, b) => a.intIndex1.compareTo(b.intIndex1));
        }
      }
    }

    return Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          backgroundColor: Colors.white,
          title: Text(
            '${tvpSites_APP_DATA.strSummaryID}',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () async {
              if (formChangesDetected) {
                // set up the button
                Widget okButton = FlatButton(
                  child: Text("OK"),
                  onPressed: () async {
                    // Navigator.of(context).pop();
                    await UtilMethods.eventBack(
                        appDatabase, context, GlobalState.PI);
                  },
                );

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
              } else {
                await UtilMethods.eventBack(
                    appDatabase, context, GlobalState.PI);
              }
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
                    Map editFields = {
                      // 'strSiteName':  "[[NULL]]",
                      // 'strUserCode1':  "[[NULL]]",
                      // 'strDescription': "[[NULL]]"
                    };

                    print(formChangesDetected);
                    print("UUUUUUUUUUUUUUUUU");
                    if (formChangesDetected) {
                      print("Testingggg......Form Changess.........");
                      if (tvpSites_APP_DATA.strCrmSiteName != name.text) {
                        editFields['strCrmSiteName'] =
                            (name.text != null && name.text != "")
                                ? name.text
                                : "[[NULL]]";
                      }
                      if (tvpSites_APP_DATA.strUserCode1 != usercode.text) {
                        editFields['strUserCode1'] =
                            (usercode.text != null && usercode.text != "")
                                ? usercode.text
                                : "[[NULL]]";
                      }

                      print(tvpSites_APP_DATA.intOrganizationNode1AutoID);
                      print(_rowItem.i);
                      print("lllllllll");
                      if (tvpSites_APP_DATA.intOrganizationNode1AutoID !=
                          _rowItem.i) {
                        editFields['intOrganizationNode1_autoID'] =
                            (_rowItem.i != null && _rowItem.i != 0)
                                ? _rowItem.i
                                : "[[NULL]]";
                      }
                      // if (tvpSites_APP_DATA.intOrganizationNode1AutoID !=
                      //     _rowItem.i) {
                      //   editFields['strCrmSiteType'] =
                      //       (_rowItem.d != null && _rowItem.d != "")
                      //           ? _rowItem.d
                      //           : "[[NULL]]";
                      // }
                      if (tvpSites_APP_DATA.strDescription != notes.text) {
                        editFields['strDescription'] =
                            (notes.text != null && notes.text != "")
                                ? notes.text
                                : "[[NULL]]";
                      }
                      if (tvpSites_APP_DATA.blnIsActive != activeStatus) {
                        editFields['blnIsActive'] = activeStatus;
                      }

                      Map<String, dynamic> bodyDataCustom = {
                        "ClientDataJson": {
                          "jDT": [
                            {
                              "PRCI": 817,
                              "DT": {
                                "tvpCrmSites_DATA": [editFields]
                              },
                              "ND": true
                            }
                          ]
                        }
                        // "ImageIndex": imageIndex,
                      };
                      await UtilMethods.eventSave(
                          appDatabase, context, 237, bodyDataCustom);
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
          Container(
              // padding: EdgeInsets.all(16),
              child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
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
                                  formChangesDetected = true;
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Name is required";
                                }
                              },
                              // obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Name *',
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
                              onChanged: (value) {
                                setState(() {
                                  formChangesDetected = true;
                                });
                              },
                              controller: usercode,
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
                              items:
                                  (APIConstants.rowSource_RS_13_23_6_2.length >
                                              0
                                          ? APIConstants.rowSource_RS_13_23_6_2
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
                              onChanged: (newValue) {
                                setState(() {
                                  print(newValue.i);
                                  print("99999999");
                                  _rowItem = newValue;
                                  formChangesDetected = true;
                                });
                              },
                            ),
                            SizedBox(height: 30),
                            TextFormField(
                              controller: notes,
                              onChanged: (value) {
                                setState(() {
                                  formChangesDetected = true;
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
                                      left: MediaQuery.of(context).size.height *
                                          0.002,
                                      top: MediaQuery.of(context).size.height *
                                          0.025),
                                  child: RichText(
                                    text: TextSpan(
                                        children: <InlineSpan>[
                                          TextSpan(
                                            text: activeStatus
                                                ? 'Active'
                                                : 'InActive',
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
                                      right:
                                          MediaQuery.of(context).size.height *
                                              0.002,
                                      top: MediaQuery.of(context).size.height *
                                          0.018),
                                  child: Switch(
                                    onChanged: (val) {
                                      setState(() {
                                        formChangesDetected = true;
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
                  ))),
          if (GlobalState.apiLoading) PageDataLoader(),
        ]));
  }
}
