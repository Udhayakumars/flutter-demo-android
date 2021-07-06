import 'dart:convert';

import 'package:MMLMobile/databasemodels/StandardHeader.dart';
import 'package:MMLMobile/databasemodels/WebAppClientDataKeys.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysFromSql.dart';
import 'package:MMLMobile/models/CustomHeader.dart';
import 'package:MMLMobile/models/InputConvertExitObjects.dart';
import 'package:MMLMobile/models/RowSources.dart';

import 'InputObject.dart';
import 'NavigationObject.dart';

class ResponseBody {
  final String jsonInput_StandardHeader;
  final String jsonInput_WebAppClientDataKeys;
  final String jsonInput_WebAppClientData;
  final String jsonInput_CustomHeader;
  final StandardHeader jsonOutput_StandardHeader;
  final List<dynamic> jsonOutput_WebAppClientDataKeys;
  final List<dynamic> jsonOutput_WebAppClientData;
  final CustomHeader jsonOutput_CustomHeader;
  final List<RowSources> jsonOutput_RowSources;
  final String jsonOutput_Data;
  final int intSystemErrorsTypeID;
  final bool Context;

  // "jsonInput_StandardHeader": null,
  // "jsonInput_WebAppClientDataKeys": null,
  // "jsonInput_WebAppClientData": null,
  // "jsonInput_CustomHeader": null,
  // "jsonInput_SystemAgent": null,
  // jsonOutput_CustomHeader": "{\"jOCH\":{\"NV_DT\":{\"LGI\":{\"ML_AC_ID\":10,\"CR_US_ID\":10,\"SN_ID\":183}}}}",
  // "jsonOutput_RowSources": "",
  // "jsonOutput_Data": "",
  // "intSystemErrorsTypeID": 0,
  // "jsonOutput_SystemAgent": "",
  // "Context": false

  //{\"jOCH\":{\"NV_DT\":{\"LGI\":{\"ML_AC_ID\":10,\"CR_US_ID\":10,\"SN_ID\":119}}}}",

  ResponseBody(
      {this.jsonInput_StandardHeader,
      this.jsonInput_WebAppClientDataKeys,
      this.jsonInput_WebAppClientData,
      this.jsonInput_CustomHeader,
      this.jsonOutput_StandardHeader,
      this.jsonOutput_WebAppClientDataKeys,
      this.jsonOutput_WebAppClientData,
      this.jsonOutput_CustomHeader,
      this.jsonOutput_RowSources,
      this.jsonOutput_Data,
      this.intSystemErrorsTypeID,
      this.Context});

  factory ResponseBody.fromJson(Map<String, dynamic> json) {
    print(json['jsonOutput_WebAppClientData']);
    //var val = jsonDecode(json['jsonOutput_WebAppClientData'])['jDT'];
    //print(val);

    // print(jsonDecode(json['jsonOutput_CustomHeader']));

    // print(((jsonDecode(json['jsonOutput_CustomHeader'])['jOCH'])['NV_DT'])['LGI']);

    // (json.decode(response.body) as List).map((i) => MyModel.fromJson(i)).toList();
    return ResponseBody(
      jsonInput_StandardHeader: json['jsonInput_StandardHeader'],
      jsonInput_WebAppClientDataKeys: json['jsonInput_WebAppClientDataKeys'],
      jsonInput_WebAppClientData: json['jsonInput_WebAppClientData'],
      jsonInput_CustomHeader: json['jsonInput_CustomHeader'],
      jsonOutput_StandardHeader: StandardHeader.fromJson(
          jsonDecode(json['jsonOutput_StandardHeader'])['jOSH']),
      jsonOutput_WebAppClientDataKeys:
          json['jsonOutput_WebAppClientDataKeys'] != "" &&
                  json['jsonOutput_WebAppClientDataKeys'] != null
              ? (jsonDecode(json['jsonOutput_WebAppClientDataKeys'])['jDK']
                      as List)
                  .map((e) => WebAppClientKeysFromSql.fromJson(e))
                  .toList()
              : [],
      // jsonOutput_WebAppClientDataKeys: jsonDecode(json['jsonOutput_WebAppClientDataKeys'])['jDK'],
      jsonOutput_WebAppClientData: json['jsonOutput_WebAppClientData'] != "" &&
              json['jsonOutput_WebAppClientData'] != null && json['jsonOutput_WebAppClientData'] != "{[]}"
          ? (jsonDecode(json['jsonOutput_WebAppClientData'])['jDT'] as List)
              .map((e) => NavigationObject.fromJson(e))
              .toList()
          : [],
      jsonOutput_CustomHeader: json['jsonOutput_CustomHeader'] != "" &&
              json['jsonOutput_CustomHeader'] != null && json['jsonOutput_CustomHeader'] != "{[]}"
          ? CustomHeader.fromJson(((jsonDecode(
              json['jsonOutput_CustomHeader'])['jOCH'])['NV_DT'])['LGI'])
          : new CustomHeader(),
      jsonOutput_RowSources: json['jsonOutput_RowSources'] != "" &&
              json['jsonOutput_RowSources'] != null && json['jsonOutput_RowSources'] != "{[]}"
          ? (jsonDecode(json['jsonOutput_RowSources'])['jORS'] as List)
              .map((e) => RowSources.fromJson(e))
              .toList()
          : [],
      jsonOutput_Data: json['jsonOutput_Data'],
      intSystemErrorsTypeID: json['intSystemErrorsTypeID'],
      Context: json['Context'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jsonInput_StandardHeader': jsonInput_StandardHeader,
      'jsonInput_WebAppClientDataKeys': jsonInput_WebAppClientDataKeys,
      'jsonInput_WebAppClientData': jsonInput_WebAppClientData,
      'jsonInput_CustomHeader': jsonInput_CustomHeader,
      'jsonOutput_WebAppClientDataKeys': jsonOutput_WebAppClientDataKeys,
      'jsonOutput_WebAppClientData': jsonOutput_WebAppClientData,
      'jsonOutput_CustomHeader': jsonOutput_CustomHeader,
      'jsonOutput_RowSources': jsonOutput_RowSources,
      'jsonOutput_Data': jsonOutput_Data,
      'intSystemErrorsTypeID': intSystemErrorsTypeID
    };
  }
}

//TY':1,'PC':0,'CL':1239,'TI':1,'UI':true

// "FullName": " Demonstration User: Demo10",
// "UserID": 10,
// "userName": "dtalken@meqlib.com",
// "Password": null,
// "userTypeID": 0,
// "access_token": "pYO3EkY8IGnBGHm0CLGXbFPrJI56cLQmfSWvLt4217r7OaWBHbQRqPHaf7MjLIzmGLLJAKDgLUycN2v4t2zNEe_zwVDZpMNYgyPJodF8JXFi1d4Ah1bqkBqmnVameS9l4KfR8PRzoOH9p6VehvWYkB2ztTb93kTTF5NEpIFv9a6859qnLlwHvdbwgwB5HeZQk900aRm2BJTBplnW1LLjdJ416a5yzX_v4h0KqHvQrgwX8pt6u3VkD8rubnYLKZqG-g5VZI2txveVk3QIK5dyqMtZfk5DBHFJHHBej7u8ZJlKHZeFsUrovg_2Ib9QhbZhZYFaqYb9tPFyb1OBq2PNH7vnJ_lDbB6l1BY-LsGarXpYoXXJ2Dv4eUM36iHY8KBbfH9lWeDbAwcmFlSL4J3vQbcwTy_GhXBrn3aP_kKXHtZXjszpLdNrYJnsMutZiey3t5CTcvzb4qqMDn6_9T_mhRZEUEnF23WunQy8xruktwVu0tpiiwH-2ErUX_bvVS3l",
// "token_type": "bearer",
// "expires_in": "1209599",
// "refresh_token": null,
// "accessToken": null,
// "isValidUser": true,
// "IsMobile": false
