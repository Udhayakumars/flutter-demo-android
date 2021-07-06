import 'package:MMLMobile/customwidgets/PageDataLoader.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_13_23_6_2.dart';
import 'package:MMLMobile/models/organization/PI_87_PRI_205_PRCI_817_Items.dart';
import 'package:MMLMobile/models/organization/PRCI_786_Items.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:flutter/material.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:global_state/gs.dart';

class SiteAddressEdit extends StatefulWidgetGS {
  @override
  _SiteAddressEditState createState() => _SiteAddressEditState();
}

class _SiteAddressEditState extends State<SiteAddressEdit> {
  AppDatabase appDatabase;
  TextEditingController line1 = TextEditingController();
  TextEditingController line2 = TextEditingController();
  TextEditingController line3 = TextEditingController();
  TextEditingController line4 = TextEditingController();
  TextEditingController line5 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController postal = TextEditingController();
  // TextEditingController country = TextEditingController();
  RowSources_RS_13_23_6_2 _rowItem;
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
    print(APIConstants.rowSource_RS_13_23_6_2);
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
          if (tvpSites_APP_DATA.jsonCrmAddressesDATA.length > 0) {
            line1.text = tvpSites_APP_DATA.jsonCrmAddressesDATA[0].strAddress1;
            line2.text = tvpSites_APP_DATA.jsonCrmAddressesDATA[0].strAddress2;
            city.text = tvpSites_APP_DATA.jsonCrmAddressesDATA[0].strCityName;
            postal.text =
                tvpSites_APP_DATA.jsonCrmAddressesDATA[0].strPostalCode;
          }
          // usercode.text = tvpSites_APP_DATA.strUserCode1;
          // notes.text = tvpSites_APP_DATA.strAddress;
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
            'Place',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () async {
              // set up the button
              Widget okButton = FlatButton(
                child: Text("OK"),
                onPressed: () async {
                  // Navigator.of(context).pop();
                  await UtilMethods.eventBack(appDatabase, context, GlobalState.PI);
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
                    Map editFields = {
                      // 'strSiteName':  "[[NULL]]",
                      // 'strUserCode1':  "[[NULL]]",
                      // 'strAddress': "[[NULL]]"
                    };
                    // if (tvpSites_APP_DATA.strCrmSiteName != name.text) {
                    //   editFields['strCrmSiteName'] =
                    //       (name.text != null && name.text != "")
                    //           ? name.text
                    //           : "[[NULL]]";
                    // }
                    // if (tvpSites_APP_DATA.strUserCode1 != usercode.text) {
                    //   editFields['strUserCode1'] =
                    //       (usercode.text != null && usercode.text != "")
                    //           ? usercode.text
                    //           : "[[NULL]]";
                    // }
                    // if (tvpSites_APP_DATA.strCrmSiteType != _rowItem.d) {
                    //   editFields['strCrmSiteType'] =
                    //       (_rowItem.i != null && _rowItem.i != 0)
                    //           ? _rowItem.i
                    //           : "[[NULL]]";
                    // }
                    // if (tvpSites_APP_DATA.strAddress != notes.text) {
                    //   editFields['strAddress'] =
                    //       (notes.text != null && notes.text != "")
                    //           ? notes.text
                    //           : "[[NULL]]";
                    // }
                    //
                    // Map<String, dynamic> bodyDataCustom = {
                    //   "ClientDataJson": {
                    //     "jDT": [
                    //       {
                    //         "PRCI": 817,
                    //         "DT": {
                    //           "tvpCrmSites_DATA": [editFields],
                    //           "ND": true
                    //         },
                    //       }
                    //     ]
                    //   }
                    //   // "ImageIndex": imageIndex,
                    // };
                    // await UtilMethods.eventSave(
                    //     appDatabase, context, 237, bodyDataCustom);
                    await UtilMethods.eventBack(appDatabase, context, GlobalState.PI);
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
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    controller: line1,
                    maxLines: 1,
                    // obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Line 1:',
                      fillColor: Colors.black,
                      hintText: 'Please Enter Line 1',
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
                  SizedBox(height: 10),
                  TextFormField(
                    controller: line2,
                    maxLines: 1,
                    // obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Line 2:',
                      fillColor: Colors.black,
                      hintText: 'Please Enter Line 2',
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
                  SizedBox(height: 10),
                  TextFormField(
                    controller: line3,
                    maxLines: 1,
                    // obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Line 3:',
                      fillColor: Colors.black,
                      hintText: 'Please Enter Line 3',
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
                  SizedBox(height: 10),
                  TextFormField(
                    controller: line4,
                    maxLines: 1,
                    // obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Line 4:',
                      fillColor: Colors.black,
                      hintText: 'Please Enter Line 4',
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
                  SizedBox(height: 10),
                  TextFormField(
                    controller: line4,
                    maxLines: 1,
                    // obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Line 5:',
                      fillColor: Colors.black,
                      hintText: 'Please Enter Line 5',
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
                  SizedBox(height: 10),
                  new DropdownButtonFormField<RowSources_RS_13_23_6_2>(
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Country',
                      fillColor: Colors.black,
                      hintText: 'Please Enter Country',
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
                    items: (APIConstants.rowSource_RS_13_23_6_2.length > 0
                            ? APIConstants.rowSource_RS_13_23_6_2
                            : new List<RowSources_RS_13_23_6_2>())
                        .map((dynamic value) {
                      return new DropdownMenuItem<RowSources_RS_13_23_6_2>(
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
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: city,
                    // obscureText: true,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      labelText: 'City',
                      fillColor: Colors.black,
                      hintText: 'Please Enter City',
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
                  SizedBox(height: 10),
                  new DropdownButtonFormField<RowSources_RS_13_23_6_2>(
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'State',
                      fillColor: Colors.black,
                      hintText: 'Please Enter State',
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
                    items: (APIConstants.rowSource_RS_13_23_6_2.length > 0
                        ? APIConstants.rowSource_RS_13_23_6_2
                        : new List<RowSources_RS_13_23_6_2>())
                        .map((dynamic value) {
                      return new DropdownMenuItem<RowSources_RS_13_23_6_2>(
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
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: city,
                    // obscureText: true,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      labelText: 'Postal Code',
                      fillColor: Colors.black,
                      hintText: 'Please Enter PostalCode',
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
              )),
          if (GlobalState.apiLoading) PageDataLoader(),
        ]));
  }
}
