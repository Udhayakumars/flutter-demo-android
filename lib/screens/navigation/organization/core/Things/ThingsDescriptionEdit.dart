import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/databasemodels/RowSourceDropdown.dart';
import 'package:MMLMobile/models/organization/PRCI_786_Items.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_state/gs.dart';

class ThingDescriptionEdit extends StatefulWidgetGS {
  @override
  _ThingDescriptionEditState createState() => _ThingDescriptionEditState();
}

class _ThingDescriptionEditState extends State<ThingDescriptionEdit> {
  AppDatabase appDatabase;
  TextEditingController name = TextEditingController();
  TextEditingController usercode = TextEditingController();
  TextEditingController notes = TextEditingController();
  RowsourceDropDown _rowItem;
  bool formChangeDetected = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode myFocusNode = new FocusNode();

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
    final pi_89_PRI_207_PRCI_786_Items =
        APIConstants.page_PRCI_786_Items.length > 0
            ? APIConstants.page_PRCI_786_Items[0]
            : null;

    // print(pi_89_PRI_207_PRCI_786_Items.toJson());
    TvpThingsDATA tvpThingsDATA;
    if (pi_89_PRI_207_PRCI_786_Items != null) {
      if (pi_89_PRI_207_PRCI_786_Items.tvpThingsDATA != null) {
        tvpThingsDATA = pi_89_PRI_207_PRCI_786_Items.tvpThingsDATA.length > 0
            ? pi_89_PRI_207_PRCI_786_Items.tvpThingsDATA[0]
            : null;
        if (tvpThingsDATA != null) {
          if (name.text == "" && !formChangeDetected) {
            name.text = tvpThingsDATA.strThingName;
          }
          if (usercode.text == "" && !formChangeDetected) {
            usercode.text = tvpThingsDATA.strUserCode1;
          }
          if (notes.text == "" && !formChangeDetected) {
            notes.text = tvpThingsDATA.strDescription;
          }

          if (_rowItem == null &&
              APIConstants.rowSource_RS_13_25_6_2.length > 0) {
            int index =
                APIConstants.rowSource_RS_13_25_6_2.indexWhere((element) {
              print(element.i);
              print(tvpThingsDATA.intOrganizationNode1AutoID);
              print("********asfasdfasdf*********");
              return element.i == tvpThingsDATA.intOrganizationNode1AutoID;
            });

            if (index != -1 && _rowItem == null) {
              _rowItem = APIConstants.rowSource_RS_13_25_6_2[index];
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
            '${tvpThingsDATA.strSummaryID ?? "Thing"}',
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
                      Map editFields = {"autoTvpID": tvpThingsDATA.autoTvpID};
                      if (tvpThingsDATA.strThingName != name.text) {
                        editFields['strThingName'] =
                            (name.text != null && name.text != "")
                                ? name.text
                                : "[[NULL]]";
                      }
                      if (tvpThingsDATA.strUserCode1 != usercode.text) {
                        editFields['strUserCode1'] =
                            (usercode.text != null && usercode.text != "")
                                ? usercode.text
                                : "[[NULL]]";
                      }
                      if (tvpThingsDATA.strDescription != notes.text) {
                        editFields['strDescription'] =
                            (notes.text != null && notes.text != "")
                                ? notes.text
                                : "[[NULL]]";
                      }

                      if (tvpThingsDATA.intOrganizationNode1AutoID !=
                          _rowItem.i) {
                        editFields['intOrganizationNode1_autoID'] =
                            (_rowItem.i != null && _rowItem.i != 0)
                                ? _rowItem.i
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
                              "PRCI": 786,
                              "DT": {
                                "tvpThingsDATA": [editFields],
                              },
                              "ND": true
                            }
                          ]
                        }
                        // "ImageIndex": imageIndex,
                      };
                      await UtilMethods.eventSave(
                          appDatabase, context, 239, bodyDataCustom);
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
        backgroundColor: Colors.white,
        body: Stack(children: [
          Visibility(
            child: Text(GlobalState.pageDataLoaded.toString()),
            visible: false,
          ),
          Form(
              key: _formKey,
              child: Container(
                  padding: EdgeInsets.all(16),
                  child: ListView(
                    children: [
                      SizedBox(height: 20),
                      TextFormField(
                        controller: name,
                        // focusNode: myFocusNode,
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
                          labelStyle: TextStyle(fontSize: 20),
                          labelText: 'Name *',
                          // helperText: "FFFF",
                          fillColor: Colors.black,
                          suffix: Text(
                            "${name.text == "" ? "(Required)" : ""}",
                            style: TextStyle(fontSize: 14),
                          ),
                          // suffix: Text('${tvpUsers_APP_DATA.strSummaryID ?? "Person"}',),
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
                        decoration: InputDecoration(
                          labelText: 'UserCode *',
                          suffix: Text(
                            "${usercode.text == "" ? "(Required)" : ""}",
                            style: TextStyle(fontSize: 14),
                          ),
                          // labelStyle: TextStyle(fontSize: 20),
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
                        validator: (value) {
                          if (value.isEmpty) {
                            return "UserCode is required";
                          }
                        },
                        // },
                      ),
                      SizedBox(height: 30),
                      new DropdownButtonFormField<RowsourceDropDown>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          labelText: 'Type',
                          // suffix: Text(
                          //   "${"(Required)"}",
                          //   style: TextStyle(fontSize: 14),
                          // ),
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
                        items: (APIConstants.rowSource_RS_13_25_6_2.length > 0
                                ? APIConstants.rowSource_RS_13_25_6_2
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
                        controller: notes,
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
                    ],
                  ))),
          if (GlobalState.apiLoading) PageDataLoader(),
        ]));
  }
}
