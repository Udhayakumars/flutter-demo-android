import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/models/organization/PI_87_PRI_205_PRCI_817_Items.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_state/gs.dart';

class SiteAddressList extends StatefulWidgetGS {
  @override
  _SiteAddressListState createState() => _SiteAddressListState();
}

class _SiteAddressListState extends State<SiteAddressList> {
  TextEditingController _lat = TextEditingController();
  TextEditingController _lang = TextEditingController();
  bool formChangesDetected = false;
  AppDatabase database;
  List<JsonCrmAddressesDATA> jsonCrmAddresses;
  List<JsonCrmCommunicationsDATA> jsonCrmCommunications;

  @override
  void initState() {
    builder();
    super.initState();
  }

  builder() async {
    database = await $FloorAppDatabase.databaseBuilder('mml.db').build();
  }

  @override
  Widget build(BuildContext context) {
    final pi_87_PRI_205_PRCI_817_Items =
        APIConstants.pi_87_PRI_205_PRCI_817_Items.length > 0
            ? APIConstants.pi_87_PRI_205_PRCI_817_Items[0]
            : null;
    TvpCrmSitesDATA tvpSites_APP_DATA;

    if (pi_87_PRI_205_PRCI_817_Items != null) {
      if (pi_87_PRI_205_PRCI_817_Items.tvpCrmSitesDATA != null) {
        tvpSites_APP_DATA =
            pi_87_PRI_205_PRCI_817_Items.tvpCrmSitesDATA.length > 0
                ? pi_87_PRI_205_PRCI_817_Items.tvpCrmSitesDATA[0]
                : null;

        if (tvpSites_APP_DATA != null) {
          if (_lang.text == "" && !formChangesDetected) {
            _lat.text = (tvpSites_APP_DATA.dblPrimaryLatitude ?? "").toString();
          }
          if (_lang.text == "" && !formChangesDetected) {
            _lang.text =
                (tvpSites_APP_DATA.dblPrimaryLongitude ?? "").toString();
          }
          if (jsonCrmAddresses == null) {
            jsonCrmAddresses = tvpSites_APP_DATA.jsonCrmAddressesDATA;
            jsonCrmAddresses.sort((a, b) => a.intIndex1.compareTo(b.intIndex1));
          }

          jsonCrmCommunications = tvpSites_APP_DATA.jsonCrmCommunicationsDATA;
          jsonCrmCommunications
              .sort((a, b) => a.intIndex1.compareTo(b.intIndex1));
        }
      }
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 80,
          title: Text(
            '${tvpSites_APP_DATA != null ? tvpSites_APP_DATA.strSummaryID + '' : "Place - Editing - Address"}',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
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
                        database, context, GlobalState.PI);
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
                                database, context, GlobalState.PI);
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
                await UtilMethods.eventBack(database, context, GlobalState.PI);
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
            TextButton(
              onPressed: () async {
                if (formChangesDetected) {
                  Map editFields = {
                  };
                  if (tvpSites_APP_DATA.dblPrimaryLatitude != _lat.text) {
                    editFields['dblPrimaryLatitude'] =
                        (_lat.text != null && _lat.text != "")
                            ? _lat.text
                            : "[[NULL]]";
                  }
                  if (tvpSites_APP_DATA.dblPrimaryLongitude != _lang.text) {
                    editFields['dblPrimaryLongitude'] =
                        (_lang.text != null && _lang.text != "")
                            ? _lang.text
                            : "[[NULL]]";
                  }

                  Map<String, dynamic> bodyDataCustom = {
                    "ClientDataJson": {
                      "jDT": [
                        {
                          "PRCI": 817,
                          "DT": {
                            "tvpCrmSites_DATA": [editFields],
                          },
                          "ND": true
                        }
                      ]
                    }
                    // "ImageIndex": imageIndex,
                  };
                  await UtilMethods.eventSave(
                      database, context, 237, bodyDataCustom);
                }
                // if (!GlobalState.errorCallMsgShown) {
                //   await UtilMethods.eventBack(
                //       database, context, GlobalState.PI);
                // }
              },
              child: Text(
                'SAVE',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.blue),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Stack(children: [
          ListView(
            children: [
              ListTile(
                leading: Padding(
                  child: Text(
                    'GPS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  padding: EdgeInsets.all(12),
                ),
                title: Row(
                  children: [
                    Stack(
                      children: [
                        // Align(
                        //   child: Text(
                        //     'Latitude',
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 12,
                        //         color: Colors.black),
                        //   ),
                        //   alignment: Alignment.topLeft,
                        // ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.02),
                              child: Container(
                                height: 40,
                                width:
                                    MediaQuery.of(context).size.height * 0.145,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    color: Colors.grey[200]),
                                child: TextFormField(
                                  controller: _lat,
                                  // initialValue: "10",
                                  cursorHeight: 20,
                                  maxLines: 1,
                                  onChanged: (value) {
                                    setState(() {
                                      formChangesDetected = true;
                                    });
                                  },
                                  // obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: 'Latitude',
                                    fillColor: Colors.black,
                                    hintText: '',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black38),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black38),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black38),
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
                              ),
                            ))
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Stack(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.02),
                              child: Container(
                                height: 40,
                                width:
                                    MediaQuery.of(context).size.height * 0.145,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    color: Colors.grey[200]),
                                child: TextFormField(
                                  cursorHeight: 20,
                                  controller: _lang,
                                  maxLines: 1,
                                  onChanged: (value) {
                                    setState(() {
                                      formChangesDetected = true;
                                    });
                                  },
                                  // obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: 'Longitude',
                                    fillColor: Colors.black,
                                    hintText: '',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black38),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black38),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black38),
                                    ),
                                    contentPadding: EdgeInsets.all(11),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Container(
                  height: MediaQuery.of(context).size.height -
                      (kBottomNavigationBarHeight + 300),
                  child: ReorderableListView(
                      physics: ClampingScrollPhysics(),
                      onReorder: (oldIndex, newIndex) {
                        setState(() {
                          if (oldIndex < newIndex) {
                            newIndex -= 1;
                          }

                          JsonCrmAddressesDATA item =
                              jsonCrmAddresses.removeAt(oldIndex);
                          jsonCrmAddresses.insert(newIndex, item);
                        });
                      },
                      children: [
                        for (int index = 0;
                            index < jsonCrmAddresses.length;
                            index++)
                          Column(key: Key('$index'), children: [
                            Container(
                              height: 90,
                              child: ListTile(
                                leading: Image.asset(
                                    GlobalConfiguration().get("1804")),
                                title: Text(
                                  '${jsonCrmAddresses[index].strType}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                subtitle: Padding(
                                  child: ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    children: [
                                      Text(
                                        '${jsonCrmAddresses[index].strCityStateZipCountryMobileApp}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.only(top: 6, left: 6),
                                ),
                                trailing: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1),
                                      child: IconButton(
                                        icon: Icon(Icons.edit),
                                        color: Colors.black,
                                        onPressed: () async {
                                          await UtilMethods
                                              .eventPageRegionChange(database,
                                                  context, 853, 2, null);
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1),
                                      child: IconButton(
                                        icon: Image.asset(
                                          GlobalConfiguration().get("1125"),
                                          height: 25,
                                          width: 25,
                                        ),
                                        color: Colors.red,
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ])
                      ])),
              Padding(
                padding: EdgeInsets.all(12),
                child: Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Stack(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Padding(
                          child: Text(
                            'Add',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          padding: EdgeInsets.only(left: 30),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          if (GlobalState.apiLoading) PageDataLoader()
        ]));
  }
}
