import 'dart:convert';
import 'dart:io';
import 'package:MMLMobile/customwidgets/ImageView.dart';
import 'package:MMLMobile/customwidgets/ImageViewEdit.dart';
import 'package:MMLMobile/database/AppDatabase.dart';
import 'package:MMLMobile/databasemodels/RowSources_30_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_12_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_13_23_6_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_1_10_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_29_41_15_6.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_31_42_2_6.dart';
import 'package:MMLMobile/databasemodels/StandardHeader.dart';
import 'package:MMLMobile/databasemodels/WebAppClientData.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysCache.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysPageTab.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysRequestKeys.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysToSql.dart';
import 'package:MMLMobile/models/CustomHeader.dart';
import 'package:MMLMobile/models/RequestKeys.dart';
import 'package:MMLMobile/models/NavigationObject.dart';
import 'package:MMLMobile/models/PIandPRI.dart';
import 'package:MMLMobile/models/PageDirectionObject.dart';
import 'package:MMLMobile/models/ResponseBody.dart';
import 'package:MMLMobile/models/Rkeys.dart';
import 'package:MMLMobile/models/RowItem.dart';
import 'package:MMLMobile/models/RowSources.dart';
import 'package:MMLMobile/models/organization/PI_33_PRI_130_PRCI_688_Children.dart';
import 'package:MMLMobile/models/organization/PI_33_PRI_130_PRCI_688_Parent.dart';
import 'package:MMLMobile/models/organization/PI_85_PRI_203_PRCI_815_Items.dart';
import 'package:MMLMobile/models/organization/PI_86_PRI_204_PRCI_816_Items.dart';
import 'package:MMLMobile/models/organization/PI_87_PRI_205_PRCI_817_Items.dart';
import 'package:MMLMobile/models/organization/PI_88_PRI_206_PRCI_818_Items.dart';
import 'package:MMLMobile/models/organization/PI_89_PRI_207_PRCI_785_Items.dart';
import 'package:MMLMobile/models/organization/PRCI_786_Items.dart';
import 'package:MMLMobile/models/organization/PI_90_PRI_208_PRCI_819_Items.dart';
import 'package:MMLMobile/models/organization/PI_92_PRI_210_PRCI_787_Items.dart';
import 'package:MMLMobile/models/organization/PI_94_PRI_212_PRCI_796_Items.dart';
import 'package:MMLMobile/models/organization/PI_95_PRI_213_PRCI_805_Items.dart';
import 'package:MMLMobile/models/organization/PI_97_PRI_215_PRCI_807_Items.dart';
import 'package:MMLMobile/models/organization/PI_99_PRI_217_PRCI_821_Items.dart';
import 'package:MMLMobile/models/organization/ThingsPageTextItems.dart';
import 'package:MMLMobile/models/recents/PI_30_PRI_127_PRCI_656_Items.dart';
import 'package:MMLMobile/models/settings/PI_30_PRI_187_PRCI_716_Items.dart';
import 'package:MMLMobile/networking/ApiBaseHelper.dart';
import 'package:MMLMobile/networking/CustomException.dart';
import 'package:MMLMobile/screens/ComingSoonScreen.dart';
import 'package:MMLMobile/screens/LoginScreenV.dart';
import 'package:MMLMobile/screens/navigation/NavigationCalls.dart';
import 'package:MMLMobile/screens/SplashScreen.dart';
import 'package:MMLMobile/screens/navigation/home/Settings.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Accounts/AccountDescriptionEdit.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Accounts/AccountEdit.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Companies/companyDescriptionEdit.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Companies/companyEdit.dart';
import 'package:MMLMobile/screens/navigation/organization/core/EditVideo.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Locations/locationEdit.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Sites/SiteAddressEdit.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Sites/SiteAddressList.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Sites/SiteDescriptionEdit.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Sites/siteEdit.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Things/ThingsDescriptionEdit.dart';
import 'package:MMLMobile/screens/navigation/organization/core/FilmStripEdit.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Users/userDescriptionEdit.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Users/userEdit.dart';
import 'package:MMLMobile/screens/navigation/organization/core/VideoTrimmer.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Accounts/account.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Companies/companies.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Locations/locations.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Sites/Sites.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Things/Things.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Things/ThingsEdit.dart';
import 'package:MMLMobile/screens/navigation/organization/core/Users/users.dart';
import 'package:MMLMobile/screens/navigation/settings/About.dart';
import 'package:MMLMobile/screens/navigation/settings/ChangePassword.dart';
import 'package:MMLMobile/screens/navigation/settings/Debug.dart';
import 'package:MMLMobile/screens/navigation/settings/Notification.dart';
import 'package:MMLMobile/utils/GlobalState.dart';
import 'package:dio/dio.dart' as dio;
// import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:toast/toast.dart';
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;
import 'package:MMLMobile/models/organization/PI_33_PRI_130_PRCI_688_TreePath.dart';
import 'package:MMLMobile/utils/ErrorCodes.dart' as ErrorCodes;

import 'Preference.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

//================================================================================
//================================================================================
// EVENTS - EXTERNAL HOOKS INTO AC_DK SYSTEM
//================================================================================
//================================================================================

//========================================================================
// eventLogin			eventLogin			eventLogin
//========================================================================
// This will initialize and start AC_DK System
Future<void> eventLogin(AppDatabase database, BuildContext context) async {}

//=========================================================================
// eventRevive			eventRevive			eventRevive
//=========================================================================
// This is call after the OS has purged the Widget data but still logged in
// AC_DK used PageTab to restart AC_DK System
Future<void> eventRevive(AppDatabase database, BuildContext context) async {
  try {
    GlobalState.eventMethod = 'eventRevive';

    final getPIAndPRIValues = await getPIandPRIforRevive(database, context);

    await eventCommonSteps(database, context, getPIAndPRIValues, 2, true, {});
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    final errorCode =
        ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
  }
  ;
}

//===================================================================================
// eventPageRegionChange	eventPageRegionChange		eventPageRegionChange
//===================================================================================
// Widget can have a hard coded pageControlPRCI value which will cause a Page/Region change
Future<void> eventPageRegionChange(AppDatabase database, BuildContext context,
    int pageControlPRCI, int eventID, List<RequestKeys> dataRequestKeys) async {
  try {
    GlobalState.eventMethod = 'eventPageRegionChange';

    // This will clear Request Keys first
    final getPIAndPRIValues = await getPIandPRIforPageRegionChange(
        database, context, pageControlPRCI);

    print("PI and PRI Values-----------");
    print(getPIAndPRIValues.PI);
    print(getPIAndPRIValues.PRI);

    // DJT This allow a Page Regsion Change to also modify Data Keys before calling SQL
    if (dataRequestKeys != null) {
      // Request Keys = Data Request Keys
      // Put JSON NK into Request Keys
      List<WebAppClientKeysRequestKeys> requestKeys = dataRequestKeys
          .map((e) => WebAppClientKeysRequestKeys.fromJson(e.toJson()))
          .toList();
      //PUSH REQUEST KEYS
      await database.webAppClientKeysRequestKeys
          .insertWebClientDataList(requestKeys);
    }

    await eventCommonSteps(
        database, context, getPIAndPRIValues, eventID, true, {});
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
  }
}

// DJT - Added
//============================================================================================
// eventPrci688NodeChange		eventPrci688NodeChange		eventPrci688NodeChange
//============================================================================================

Future<String> eventPrci688NodeChange(AppDatabase database,
    BuildContext context, List<RequestKeys> nodeRequestKeys) async {
  GlobalState.eventMethod = 'eventPrci688NodeChange';
  try {
    // Prci688Stack Fields:
    // id - primary key
    // PTIR - Parent Treeview ID Record
    // TIR - Treeview ID Record
    // DATE - date record added to table
    // CCT - Children Count for this PTIR (does nooot incll the records from Lazy Swipe actions)
    // PFK - preference Key - Format: PG_33_PRCI_688_{PTIR} PG_33, Organization is Page 33, PRCI_688 - Control ID for Folder View

    await purgePrci688CacheExceeded(database);
    // Get the newly selected target PTIR from the nodeRequestKeys

    print("node Request Keys........");
    print(nodeRequestKeys.toString());

    // @conWebAppHtmlPagesRegionsControls_Organization#Header#ID#Active_Treeview_Node_Record_ID#_(REF) = 755"
    // @conSystemCodesTablesColumns_tblWebAppTreeviewControls_19#autoWebAppTreeviewControlID = 7822
    int newPTIR;
    int newDTID;
    String newPFK;
    if (nodeRequestKeys.length > 0) {
      newPTIR = nodeRequestKeys[0].TI;
    }

    print(newPTIR);
    print("================Node Request Keys======");

    //-- EXIST CHECK: Determine if NEW_PTIR exists in Prci688Stack
    // PFK - preferenceKey
    // DTID - intDataTypeID (uses for Sort Control)
    List<Map> listPrciStackMatchFound = await database.database
        .rawQuery("SELECT * FROM Prci688Stack WHERE PTIR = ${newPTIR}");

    // NO RECORD FOUND
    if (listPrciStackMatchFound.length == 0) {
      print(
          "======================= PRCI_688 - API Call Required ==============");

      // Request Keys = Node Request Keys
      // Purge RequestKeys
      database.database.rawQuery("DELETE FROM WebAppClientKeysRequestKeys");

      // Put JSON NK into Request Keys
      List<WebAppClientKeysRequestKeys> requestKeys = nodeRequestKeys
          .map((e) => WebAppClientKeysRequestKeys.fromJson(e.toJson()))
          .toList();
      //PUSH REQUEST KEYS
      await database.webAppClientKeysRequestKeys
          .insertWebClientDataList(requestKeys);

      final getPIandPRIValues = await getPIandPRIfromPageTab(database, context);

      // This call API/SQL, Updates AC_DK, Puts JSON into Preference and Updates Sort
      await eventCommonSteps(
          database, context, getPIandPRIValues, 211, false, {});

      print("new PTIR");
      print(newPTIR);
      print(await database.database.rawQuery("SELECT PFK FROM Prci688Stack"));
      // Now there will be a match since API/SQL just made it (if not there is a bug)
      final newPFKList = await database.database.rawQuery(
          "SELECT PFK FROM Prci688Stack WHERE PTIR = ${newPTIR.toInt()}");

      print("length values in PTIR");
      print(newPFKList.length);
      if (newPFKList.length > 0) {
        newPFK = newPFKList[0]['PFK'];
      }
    }

    // RECORD FOUND
    else if (listPrciStackMatchFound.length != 0) {
      print(
          "================= PRCI_688 - USE Preference Data Found ==============");
      newPTIR = listPrciStackMatchFound[0]['PTIR'];
      newDTID = listPrciStackMatchFound[0]['DTID'];
      newPFK = listPrciStackMatchFound[0]['PFK'];

      // Normally Request Keys are sent to SQL and the return AC_DK will update Active Table
      // However, in this case no SQL call will be made and so we will update Active Table with
      // all the AC_DK required

      // Delete 755/7822
      // @conWebAppHtmlPagesRegionsControls_Organization#Header#ID#Active_Treeview_Node_Record_ID#_(REF) = 755
      // @conSystemCodesTablesColumns_tblWebAppTreeviewControls_19#autoWebAppTreeviewControlID = 7822
      await database.database.rawQuery(
          "DELETE FROM WebAppClientKeysActive WHERE PC = 755 AND CL = 7822");

      // Insert 755/7822
      await database.database.rawQuery(
          "INSERT INTO WebAppClientKeysActive(TY, PC, CL, TI, UI) SELECT 1, 755, 7822, ${newPTIR}, 0");

      // Sort is controlled based on the Parent Node intDataTypeID, so we revert to the value obtained from the stack
      // Delete 775/5949
      // @conWebAppHtmlPagesRegionsControls_Organization#Header#ID#Active_Treeview_Node_My_Data_Type_ID#_(REF) = 775
      // @conSystemCodesTablesColumns_tblDataTypes#autoDataTypeID = 5949
      await database.database.rawQuery(
          "DELETE FROM WebAppClientKeysActive WHERE PC = 775 AND CL = 5949");

      // Insert 775/5949
      await database.database.rawQuery(
          "INSERT INTO WebAppClientKeysActive(TY, PC, CL, TI, UI) SELECT 1, 775, 5949, ${newDTID}, 0");

      // Sort Table Update - Uses AC_DK 775/5949 to update RS30_2
      await postProcessingRS_30_2(database);
    }

    // Always Returns a valid preferenceKey

    print("PFK Values");
    print(newPFK);
    return newPFK;
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
  }
}

eventTreeviewNodePrci688More(AppDatabase database, BuildContext context,
    List<RequestKeys> nodeRequestKeys) async {
  try {
    GlobalState.eventMethod = 'eventTreeviewNodePrci688More';

    // Purge RequestKeys
    database.database.rawQuery("DELETE FROM WebAppClientKeysRequestKeys");

// Put JSON NK into Request Keys
    List<WebAppClientKeysRequestKeys> requestKeys = nodeRequestKeys
        .map((e) => WebAppClientKeysRequestKeys.fromJson(e.toJson()))
        .toList();
    //PUSH REQUEST KEYS
    await database.webAppClientKeysRequestKeys
        .insertWebClientDataList(requestKeys);

    final getPIandPRIValues = await getPIandPRIfromPageTab(database, context);

    await eventCommonSteps(
        database, context, getPIandPRIValues, 212, false, {});
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
  }
}

//====================================================================================
// getTreeviewNodePrci688More	getTreeviewNodePrci688More		getTreeviewNodePrci688More
// This returns the MORE bit for PRCI#688
//====================================================================================

Future<bool> getTreeviewNodePrci688More(AppDatabase database) async {
  try {
    // Get PI & PRI to return
    List<Map> list_TreeviewMore = await database.database.rawQuery(
        "SELECT TI FROM WebAppClientKeysActive WHERE (PC = 770) AND (CL = 9312)"); // -- @conWebAppHtmlPagesRegionsControls_Organization#Header#ID#PRCI#688_More#_(REF) = 770
    // -- @conSystemCodesTablesColumns_tblAaaOrphans#blnGeneric_TrueFalse = 9312

    int TI = 0;
    if (list_TreeviewMore.length > 0) {
      TI = list_TreeviewMore.elementAt(0)['TI'];
    }

    print("getTreeViewMore");
    print(TI);
    return TI == 1;
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
    return false;
  }
}

//========================================================================================
// eventTreeviewNodeSelection	eventTreeviewNodeSelection	eventTreeviewNodeSelection
//========================================================================================

Future<void> eventTreeviewNodePrci688Refresh(
  AppDatabase database,
  BuildContext context,
  List<RequestKeys> nodeRequestKeys,
) async {
  try {
    GlobalState.eventMethod = 'eventTreeviewNodePrci688Refresh';

    // Purge RequestKeys
    database.database.rawQuery("DELETE FROM WebAppClientKeysRequestKeys");

// Put JSON NK into Request Keys
    List<WebAppClientKeysRequestKeys> requestKeys = nodeRequestKeys
        .map((e) => WebAppClientKeysRequestKeys.fromJson(e.toJson()))
        .toList();

    //PUSH REQUEST KEYS
    await database.webAppClientKeysRequestKeys
        .insertWebClientDataList(requestKeys);

    final getPIandPRIValues = await getPIandPRIfromPageTab(database, context);

    await eventCommonSteps(
        database, context, getPIandPRIValues, 211, false, {});
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
  }
}

Future<void> eventTreeviewPrci772Up(
  AppDatabase database,
  BuildContext context,
  List<RequestKeys> nodeRequestKeys,
) async {
  try {
    GlobalState.eventMethod = 'eventTreeviewPrci772Up';

    // Purge RequestKeys
    database.database.rawQuery("DELETE FROM WebAppClientKeysRequestKeys");

// Put JSON NK into Request Keys
    List<WebAppClientKeysRequestKeys> requestKeys = nodeRequestKeys
        .map((e) => WebAppClientKeysRequestKeys.fromJson(e.toJson()))
        .toList();

    //PUSH REQUEST KEYS
    await database.webAppClientKeysRequestKeys
        .insertWebClientDataList(requestKeys);

    final getPIandPRIValues = await getPIandPRIfromPageTab(database, context);

    await eventCommonSteps(
        database, context, getPIandPRIValues, 211, false, {});
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
  }
}

//==========================================================================
// eventRefresh			eventRefresh			eventRefresh
//==========================================================================
// This will use the current PI/PRI values in AC_DK System, put screen into Refreshing Mode,
// make the API call, and populate Widgets with AC_DT
Future<Null> eventRefresh(AppDatabase database, BuildContext context,
    {eventID}) async {
  try {
    GlobalState.eventMethod = 'eventRefresh';

    final getPIAndPRIValues = await getPIandPRIforRefresh(database, context);

    await eventCommonSteps(
        database, context, getPIAndPRIValues, eventID ?? 2, false, {});
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
  }
}

//=======================================================================
// eventBack			eventBack			eventBack
//=======================================================================
// This will use stack PageReturn in AC_DK System to select the proper Back to Page/Region
// make the API call, and populate Widgets with AC_DT
Future<void> eventBack(AppDatabase database, BuildContext context, int PI_CHILD,
    {List<RequestKeys> dataRequestKeys}) async {
  try {
    GlobalState.eventMethod = 'eventBack';

    final getPIAndPRIValues =
        await getPIandPRIforBack(database, context, PI_CHILD);

    // DJT This allow a Page Regsion Change to also modify Data Keys before calling SQL
    if (dataRequestKeys != null) {
      // Request Keys = Data Request Keys
      // Put JSON NK into Request Keys
      List<WebAppClientKeysRequestKeys> requestKeys = dataRequestKeys
          .map((e) => WebAppClientKeysRequestKeys.fromJson(e.toJson()))
          .toList();
      //PUSH REQUEST KEYS
      await database.webAppClientKeysRequestKeys
          .insertWebClientDataList(requestKeys);
    }

    await eventCommonSteps(database, context, getPIAndPRIValues, 2, true, {});
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
  }
}

//==============================================================================
// eventCommonSteps		eventCommonSteps		eventCommonSteps
//==============================================================================
// This is the central processing logic.  The PI & PRI values are provided depending on event
Future<bool> eventCommonSteps(
    AppDatabase database,
    BuildContext context,
    getPIAndPRIValues,
    int eventID,
    bool gotoPageRequired,
    Map<String, dynamic> bodyDataCustom) async {
  try {
    GlobalState.errorCallMsgShown = false;
    if (GlobalState.apiLoading) {
      return false;
    }
    switch (eventID) {
      case 216:
      case 217:
      case 243:
        GlobalState.apiLoading = false;
        break;
      default:
        GlobalState.apiLoading = true;
        break;
    }

    final callAPIRequired = await beforSQL(database);

    if (callAPIRequired) {
      //Before CallSQL need to Initialize the Screen
      //to do navigator stuff here
      await callSQL(
          database, context, getPIAndPRIValues, eventID, bodyDataCustom);
    }

    GlobalState.apiLoading = false;

    if (gotoPageRequired && !GlobalState.errorCallMsgShown) {
      gotoPage(database, getPIAndPRIValues, context);
    }
    return true;
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    GlobalState.apiLoading = false;
    // print(stacktrace.toString());
    throw e;
  }
}

//==============================================================================
// eventUploadFile		eventUploadFile		eventUploadFile
//==============================================================================
// This is the central processing logic.  The PI & PRI values are provided depending on event
Future<void> eventUploadFile(
    AppDatabase database, BuildContext context, int eventID, File file,
    {int imageIndex}) async {
  try {
    final getPIandPRIValues = await getPIandPRIforRefresh(database, context);

    final bytes = await file.readAsBytes();

    // file.writeAsString("This is my demo text that will be saved to : demoTextFile.txt");
    //
    Map<String, dynamic> bodyDataCustom = {
      "InputData": jsonEncode([
        {
          "PRCI": 799,
          "DT": [
            {
              "I2": await file.length(),
              "S1": "NOT USED",
              "S2": "Read this file first",
              "S3": basename(file.path)
            }
          ],
          "ND": true
        }
      ]).toString(),
      "file": await dio.MultipartFile.fromFile(file.path,
          filename: basename(file.path)),
      // "ImageIndex": imageIndex,
    };

    // await writebase64(base64.encode(bytes));
    await eventCommonSteps(
        database, context, getPIandPRIValues, eventID, false, bodyDataCustom);

    // eventRefresh(database, context, eventID: 220);
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
  }
}

//==============================================================================
// eventSave		eventSave		eventSave
//==============================================================================
// This is the central processing logic.  The PI & PRI values are provided depending on event
Future<bool> eventSave(AppDatabase database, BuildContext context, int eventID,
    Map<String, dynamic> bodyDataCustom) async {
  try {
    final getPIAndPRIValues =
        await getPIandPRIforBack(database, context, GlobalState.PI);

    // final getPIandPRIValues = await getPIandPRIforRefresh(database, context);

    // await writebase64(base64.encode(bytes));
    if (await eventCommonSteps(
        database, context, getPIAndPRIValues, eventID, true, bodyDataCustom)) {
      // if (!GlobalState.errorCallMsgShown) {
      //   await UtilMethods.eventBack(
      //       appDatabase, context, GlobalState.PI);
      // }
      return true;
    } else {
      return false;
    }
    // eventRefresh(database, context, eventID: 220);
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
    return false;
  }
}

//================================================================================
//================================================================================
// PRIMARY FUNCTION - PI/PRI, BEFORE SQL, CALL SQL, AFTER SQL
//================================================================================
//================================================================================

//==================================================================================
// getPIandPRIforRevive		getPIandPRIforRevive		getPIandPRIforRevive
//==================================================================================

Future<PIandPRI> getPIandPRIforRevive(
    AppDatabase database, BuildContext context) async {
  try {
    // Since Revive clear
    await database.database.rawQuery("DELETE FROM WebAppClientKeysCache");

    // await database.database.rawQuery("DELETE FROM WebAppClientKeysActive WHERE (CL<>1239)");

    await database.database.rawQuery(
        "DELETE FROM WebAppClientKeysActive WHERE (CL = 1136 OR CL = 2663)");

    // Purge RequestKeys (this may go away)
    database.database.rawQuery("DELETE FROM WebAppClientKeysRequestKeys");

    await database.database.rawQuery(
        "INSERT INTO WebAppClientKeysRequestKeys(TY, PC, CL, TI, UI) SELECT TY, PC, CL, TI, UI FROM WebAppClientKeysPageTab");

    return getPIandPRIfromPageTab(database, context);
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    throw e;
  }
}

//====================================================================================
// getPIandPRIforPageRegionChange			getPIandPRIforPageRegionChange
//====================================================================================
Future<PIandPRI> getPIandPRIforPageRegionChange(
    AppDatabase database, BuildContext context, int PRCI) async {
  try {
    print("========================================================");
    print("====== getPI and PRI for PageRegionChange ==============");
    print("========================================================");

    List<Map> list = await database.database.rawQuery(
        "SELECT * FROM RowSources_RS_29_41_15_6 WHERE I = " + PRCI.toString());
    // List<Map> list2 = await database.database.rawQuery(
    //     "SELECT I1, I2, I3, I4 FROM RowSources_RS_29_41_15_6 WHERE I = " +
    //         PRCI.toString());

    if (list.length == 0) {
      ErrorCall(
          database,
          context,
          "getPIandPRIforPageRegionChange: (${PRCI.toString()}) Record not found in RowSources_RS_29_41_15_6",
          623);
    }

    var PI = list.length > 0 ? list.elementAt(0)['I1'] : null;
    var PRI_HARD = list.length > 0 ? list.elementAt(0)['I2'] : null;
    var PRI_DEFAULT = list.length > 0 ? list.elementAt(0)['I3'] : null;
    var PRI_PC = list.length > 0 ? list.elementAt(0)['I4'] : null;
    var PAGE_RETURN = list.length > 0 ? list.elementAt(0)['B1'] : null;
    var PAGE_RETURN_PURGE = list.length > 0 ? list.elementAt(0)['B2'] : null;

    List<Map> listPageTab = await database.database.rawQuery(
        "SELECT TI FROM WebAppClientKeysActive WHERE (PC = " +
            PRI_PC.toString() +
            ")");

    var PRI_CURRENT =
        listPageTab.length > 0 ? listPageTab.elementAt(0)['TI'] : null;

    var PRI_GOTO;

    if (PRI_HARD == null) {
      if (PRI_CURRENT == null) {
        PRI_GOTO = PRI_DEFAULT;
      } else {
        PRI_GOTO = PRI_CURRENT;
      }
    } else {
      PRI_GOTO = PRI_HARD;
    }
    print("PRI_PC $PRI_PC");
    print("PI $PI");
    print("PRI_GOTO $PRI_GOTO");
    print("PRI_CURRENT $PRI_CURRENT");
    print("PRI_HARD $PRI_HARD");
    print("PRI_DEFAULT $PRI_DEFAULT");
    print("PAGE_RETURN $PAGE_RETURN");
    print("PAGE_RETURN PURGE $PAGE_RETURN_PURGE");

    // Save New Child with Current Page/Page Region for BACK operations
    if (PAGE_RETURN_PURGE == 1) {
      await database.database
          .rawQuery("DELETE FROM WebAppClientKeysPageReturn");
    }

    // Save New Child with Current Page/Page Region for BACK operations
    if (PAGE_RETURN == 1) {
      await database.database.rawQuery(
          "INSERT INTO WebAppClientKeysPageReturn( PI_CHILD ,TY ,PC ,CL ,TI ,UI) "
                  "SELECT " +
              PI.toString() +
              ", 5, PC, CL, TI, UI FROM WebAppClientKeysPageTab");
    }

    //new WebAppClientKeysRequestKeys(TY:2, PC:0, CL:1136, TI:PI, UI: true);

    // this tecnical should not be required - but leave in for now
    await database.database.rawQuery("DELETE FROM WebAppClientKeysRequestKeys");

    // PUSH PI/PRI to RequestKeys
    database.webAppClientKeysRequestKeys.insertWebClientData(
        new WebAppClientKeysRequestKeys(TY: 2, PC: 0, CL: 1136, TI: PI, UI: 1));
    database.webAppClientKeysRequestKeys.insertWebClientData(
        new WebAppClientKeysRequestKeys(
            TY: 2, PC: PRI_PC, CL: 2663, TI: PRI_GOTO, UI: 1));

    // CLEAR AND STORE PI/PRI in PageTab
    await database.database.rawQuery("DELETE FROM WebAppClientKeysPageTab");

    database.webAppClientKeysPageTab.insertWebClientData(
        new WebAppClientKeysPageTab(TY: 4, PC: 0, CL: 1136, TI: PI, UI: 1));
    database.webAppClientKeysPageTab.insertWebClientData(
        new WebAppClientKeysPageTab(
            TY: 4, PC: PRI_PC, CL: 2663, TI: PRI_GOTO, UI: 1));

    return getPIandPRIfromPageTab(database, context);
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    throw e;
  }
}

//===================================================================================
// getPIandPRIforRefresh	getPIandPRIforRefresh		getPIandPRIforRefresh
//===================================================================================

Future<PIandPRI> getPIandPRIforRefresh(
    AppDatabase database, BuildContext context) async {
  try {
    // Purge RequestKeys (this may go away)
    database.database.rawQuery("DELETE FROM WebAppClientKeysRequestKeys");

    // RequestKeys = PageTab (this current value - i.e. refresh)
    database.database.rawQuery(
        "INSERT INTO WebAppClientKeysRequestKeys(TY, PC, CL, TI, UI, RF) SELECT TY, PC, CL, TI, UI, 0 FROM WebAppClientKeysPageTab");

    return getPIandPRIfromPageTab(database, context);
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    throw e;
  }
}

//===================================================================================
// getPIandPRIforBack		getPIandPRIforBack		getPIandPRIforBack
//===================================================================================

Future<PIandPRI> getPIandPRIforBack(
    AppDatabase database, BuildContext context, int PI_CHILD) async {
  try {
    //get maximum pageReturnID
    List<Map> maximumPageReturnID = await database.database.rawQuery(
        "SELECT pageReturnID FROM WebAppClientKeysPageReturn WHERE (PI_CHILD = " +
            PI_CHILD.toString() +
            ") ORDER BY pageReturnID DESC");

    //get maximum pageReturnID where PI_CHILD = PI_CHILD
    List<Map> maximumPIchild = await database.database.rawQuery(
        "SELECT pageReturnID FROM WebAppClientKeysPageReturn WHERE (PI_CHILD = " +
            PI_CHILD.toString() +
            ") ORDER BY pageReturnID DESC");

    // if these two not equal create an error
    if (maximumPIchild.length > 0 && maximumPageReturnID.length > 0) {
      if (maximumPIchild[0]['pageReturnID'] !=
          maximumPageReturnID[0]['pageReturnID']) {
        ErrorCall(
            database,
            context,
            "pageReturn ID not a maximum id -- PI_CHILD : ${maximumPIchild[0]['pageReturnID']} -- MaximumReturnID : ${maximumPageReturnID[0]['pageReturnID']}",
            623);
      }
    } else {
      Map mapReturnIDs = {};
      if (maximumPIchild.length == 0) {
        mapReturnIDs['PI_CHILD'] = null;
      }
      if (maximumPageReturnID.length == 0) {
        mapReturnIDs['maximumPageReturnID'] = null;
      }
      ErrorCall(database, context,
          "Record not match in PageReturn ${mapReturnIDs.toString()}", 623);
    }

    // Purge RequestKeys (this may go away)
    database.database.rawQuery("DELETE FROM WebAppClientKeysRequestKeys");

    // RequestKeys = PageReturn WHERE PI_CHILD = PI_CHILD
    await database.database.rawQuery(
        "INSERT INTO WebAppClientKeysRequestKeys(TY, PC, CL, TI, UI) SELECT 2, PC, CL, TI, UI FROM WebAppClientKeysPageReturn WHERE PI_CHILD =" +
            PI_CHILD.toString());

    // RequestTab = PageReturn WHERE PI_CHILD = PI_CHILD
    await database.database.rawQuery("DELETE FROM WebAppClientKeysPageTab");
    await database.database.rawQuery(
        "INSERT INTO WebAppClientKeysPageTab(TY, PC, CL, TI, UI) SELECT 4, PC, CL, TI, UI FROM WebAppClientKeysPageReturn WHERE PI_CHILD =" +
            PI_CHILD.toString());

    // Pop from Stack (PageReturn)
    await database.database.rawQuery(
        "DELETE FROM WebAppClientKeysPageReturn WHERE PI_CHILD =" +
            PI_CHILD.toString());

    return getPIandPRIfromPageTab(database, context);
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    throw e;
  }
}

//====================================================================================
// getPIandPRIfromPageTab	getPIandPRIfromPageTab		getPIandPRIfromPageTab
// This is a commonly used way to extract PI/PRI from PageTab
//====================================================================================

Future<PIandPRI> getPIandPRIfromPageTab(
    AppDatabase database, BuildContext context) async {
  try {
    // Get PI & PRI to return
    List<Map> list_PI_GOTO = await database.database.rawQuery(
        "SELECT TI FROM WebAppClientKeysPageTab WHERE CL = 1136"); // -- @conSystemCodesTablesColumns_tblWebAppHtmlPages#autoWebAppHtmlPageID = 1136  (PI)
    var PI_GOTO =
        list_PI_GOTO.length > 0 ? list_PI_GOTO.elementAt(0)['TI'] : null;

    List<Map> list_PRI_GOTO = await database.database.rawQuery(
        "SELECT TI FROM WebAppClientKeysPageTab WHERE CL = 2663"); // -- @conSystemCodesTablesColumns_tblWebAppHtmlPagesRegions#autoWebAppHtmlPagesRegionID = 2663  (PRI)
    var PRI_GOTO =
        list_PRI_GOTO.length > 0 ? list_PRI_GOTO.elementAt(0)['TI'] : null;

    return PIandPRI.fromJson({'PI': PI_GOTO, 'PRI': PRI_GOTO});
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
  }
}

//================================================================================
// BEFORE SQL		BEFORE SQL		BEFORE SQL		BEFORE SQL
//================================================================================
Future<bool> beforSQL(AppDatabase database) async {
  try {
    print("=============================");
    print("=========beforSQL============");
    print("=============================");

    await database.database.rawQuery("DELETE FROM WebAppClientKeysToSql");

    // RequestKeysInitially - Snapshots the initial Request Keys in case they all exist and NO SQL CALL REQUIRED
    // They are then used to update the Active table with the Request Keys
    await database.database
        .rawQuery("DELETE FROM WebAppClientKeysRequestKeysInitially");

    await database.database.rawQuery(
        "INSERT INTO WebAppClientKeysRequestKeysInitially (TY, PC, CL, TI, UI) SELECT "
        "WebAppClientKeysRequestKeys.TY, "
        "WebAppClientKeysRequestKeys.PC, "
        "WebAppClientKeysRequestKeys.CL, "
        "WebAppClientKeysRequestKeys.TI, "
        "WebAppClientKeysRequestKeys.UI "
        "FROM WebAppClientKeysRequestKeys");

    // -- Exclude 2663 from purging so SQL gets both PI and PRI values
    await database.database.rawQuery(
        "DELETE FROM WebAppClientKeysRequestKeys WHERE id IN (SELECT WebAppClientKeysRequestKeys.id "
        "FROM WebAppClientKeysRequestKeys INNER JOIN WebAppClientKeysActive "
        "ON (WebAppClientKeysRequestKeys.PC = WebAppClientKeysActive.PC) "
        "AND (WebAppClientKeysRequestKeys.CL = WebAppClientKeysActive.CL) AND "
        "(WebAppClientKeysRequestKeys.TI = WebAppClientKeysActive.TI) AND "
        "(WebAppClientKeysRequestKeys.UI = WebAppClientKeysActive.UI) WHERE "
        "(WebAppClientKeysRequestKeys.TY = 2)"
        ")");

    await database.database.rawQuery(
        "DELETE FROM WebAppClientKeysRequestKeys WHERE id IN (SELECT WebAppClientKeysRequestKeys.id "
        "FROM WebAppClientKeysRequestKeys INNER JOIN WebAppClientKeysCache "
        "ON (WebAppClientKeysRequestKeys.PC = WebAppClientKeysCache.PC) "
        "AND (WebAppClientKeysRequestKeys.CL = WebAppClientKeysCache.CL) AND "
        "(WebAppClientKeysRequestKeys.TI = WebAppClientKeysCache.TI) AND "
        "(WebAppClientKeysRequestKeys.UI = WebAppClientKeysCache.UI) WHERE "
        "(WebAppClientKeysRequestKeys.TY = 2)"
        ")");
    // AND (WebAppClientKeysRequestKeys.PC <> 2663)

    //-- UPDATE Active Table (only if NOT still Request Keys)
    //-- BUILD ToSql Table (only if still Request Keys)
    List<Map> listRequestKeys = await database.database
        .rawQuery("SELECT 1 FROM  WebAppClientKeysRequestKeys");

    print("================================== list 6 length ==============");
    print(listRequestKeys);
    print(listRequestKeys.length == 0);

    if (listRequestKeys.length == 0) {
      print(
          "================================== listRequestKeys inside Zero ==============");
      // REMOVE from Active any records that match Request Key Intially PC, CL values
      await database.database.rawQuery(
          "DELETE FROM WebAppClientKeysActive WHERE id IN (SELECT WebAppClientKeysActive.id "
          "FROM WebAppClientKeysActive INNER JOIN WebAppClientKeysRequestKeysInitially "
          "ON (WebAppClientKeysActive.PC = WebAppClientKeysRequestKeysInitially.PC) "
          "AND (WebAppClientKeysActive.CL = WebAppClientKeysRequestKeysInitially.CL)) ");

      //-- -- Add any Request Keys of TY = 2, TY = 1 Request have already been forced into Mobile
      await database.database.rawQuery(
          "INSERT INTO WebAppClientKeysActive (TY, PC, CL, TI, UI) SELECT "
          "1, "
          "WebAppClientKeysRequestKeysInitially.PC, "
          "WebAppClientKeysRequestKeysInitially.CL, "
          "WebAppClientKeysRequestKeysInitially.TI, "
          "WebAppClientKeysRequestKeysInitially.UI "
          "FROM WebAppClientKeysRequestKeysInitially");
    }

    if (listRequestKeys.length > 0) {
      //-- -- Add any Request Keys of TY = 2, TY = 1 Request have already been forced into Mobile
      List<Map> list7 = await database.database.rawQuery(
          "INSERT INTO  WebAppClientKeysToSql (TY, PC, CL, TI, UI, RF) SELECT "
          "WebAppClientKeysActive.TY, "
          "WebAppClientKeysActive.PC, "
          "WebAppClientKeysActive.CL, "
          "WebAppClientKeysActive.TI, "
          "WebAppClientKeysActive.UI, "
          "WebAppClientKeysActive.RF "
          "FROM WebAppClientKeysActive");

      await database.database.rawQuery(
          "INSERT INTO  WebAppClientKeysToSql (TY, PC, CL, TI, UI, RF) SELECT "
          "2, " //-- NEW Hard Code 2 as is coud be 2 or 4 for TY
          "WebAppClientKeysRequestKeys.PC, "
          "WebAppClientKeysRequestKeys.CL, "
          "WebAppClientKeysRequestKeys.TI, "
          "WebAppClientKeysRequestKeys.UI, "
          "0 "

          // "1 " No need of RF 1
          "FROM WebAppClientKeysRequestKeys ");

      // print(list7.toString());

      await database.database.rawQuery(
          "INSERT INTO  WebAppClientKeysToSql (TY, PC, CL, TI, UI, RF) SELECT "
          "WebAppClientKeysCache.TY, "
          "WebAppClientKeysCache.PC, "
          "WebAppClientKeysCache.CL, "
          "WebAppClientKeysCache.TI, "
          "WebAppClientKeysCache.UI, "
          "0 FROM WebAppClientKeysCache");
    }

    return listRequestKeys.length > 0;
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    throw e;
  }
}

//=======================================================================
// GOTO PAGE			GOTO PAGE			GOTO PAGE
//=======================================================================
Future<void> gotoPage(AppDatabase database, PIandPRI valueOfPIandPRI,
    BuildContext context) async {
  try {
    print("============================================================");
    print("==============GO TO PAGE====================================");
    print("============================================================");
    print(valueOfPIandPRI.toString());

    //get the previous page PI from previous assign global state
    final int previousPagePI = GlobalState.PI;

    // now assign the GOTO page PI and PRI into global state
    GlobalState.PI = valueOfPIandPRI.PI;
    GlobalState.PRI = valueOfPIandPRI.PRI;

    if (valueOfPIandPRI.PI == null && valueOfPIandPRI.PRI == null) {
      return pushNewScreen(
        context,
        screen: NavigationCalls(),
        withNavBar: false, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: (GlobalState.eventMethod == 'eventBack'
            ? PageTransitionAnimation.slideRight
            : PageTransitionAnimation.cupertino),
      );
    }
    // // check previous page already load bottom navigation bar
    if (isBottomBarPage(previousPagePI) &&
        isBottomBarPage(valueOfPIandPRI.PI)) {
      return false;
    }

    String routeName =
        GlobalConfiguration().get(GlobalState.PI.toString()) ?? 'comingSoon';

    if (GlobalState.PRI == 215) {
      routeName = "/screens/navigation/organization/core/VideoTrimmer";
    }
    var getPageVar = getPage(database, routeName, context);

    if (GlobalState.eventMethod == "eventBack") {
      // if (Navigator.canPop(context)) {
      if (isBottomBarPage(GlobalState.PI)) {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        return pushNewScreen(
          context,
          screen: NavigationCalls(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: (GlobalState.eventMethod == 'eventBack'
              ? PageTransitionAnimation.slideRight
              : PageTransitionAnimation.cupertino),
        );
      } else {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }

        return pushNewScreen(
          context,
          screen: getPageVar['navBar']
              ? NavigationCalls(
                  page: getPageVar['class'],
                  selectedIndex: getPageVar['selectedIndex'])
              : getPageVar['class'],
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: (GlobalState.eventMethod == 'eventBack'
              ? PageTransitionAnimation.slideRight
              : PageTransitionAnimation.cupertino),
        );
      }
    } else if (GlobalState.eventMethod == 'eventRevive') {
      Navigator.pop(context);
    }

    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
    // or it is no need of bottom navigation screen directly go to particular page
    return navigationToNewPage(database, routeName, context,
        getPageVar: getPageVar);
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    throw e;
  }
}

navigationToNewPage(database, routeName, context, {getPageVar}) async {
  print("navigationToNewPage");
  if (getPageVar == null) {
    getPageVar = getPage(database, routeName, context);
  }
  try {
    return pushNewScreen(
      context,
      screen: getPageVar['class'],
      withNavBar: getPageVar['navBar'], // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: (GlobalState.eventMethod == 'eventBack'
          ? PageTransitionAnimation.slideRight
          : PageTransitionAnimation.cupertino),
    );
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
  }
}

isBottomBarPage(PI) {
  switch (PI) {
    case 30:
      return true;
      break;
    case 31:
      return true;
      break;
    case 32:
      return true;
      break;
    case 33:
      return true;
      break;
    case 34:
      return true;
      break;
    default:
      return false;
      break;
  }
}

//==============================================================================
// CALL SQL		CALL SQL		CALL SQL		CALL SQL
//==============================================================================
Future<void> callSQL(
    AppDatabase database,
    BuildContext context,
    PIandPRI valueOfPIandPRI,
    int eventID,
    Map<String, dynamic> bodyDataCustom) async {
  try {
    List<WebAppClientKeysToSql> toSQLKeys =
        await database.webAppClientKeysToSql.findAllWebAppClientDataKeys();

    for (WebAppClientKeysToSql value in toSQLKeys) {
      if (value.SV == null) {
        value.SV = false;
      }
      if (value.RF == null) {
        value.RF = false;
      }
    }

    // debugPrint(jsonEncode(toSQLKeys).toString(), wrapWidth: 2028);

    Map<String, dynamic> bodyDataHeader = {
      'CrmUserID': await Preference.getItem("userID"),
      'DataKeys': jsonEncode(toSQLKeys).toString(),
      'MmlAccountID': await Preference.getItem("MmlAccountID"),
      'WebAppSessionID': await Preference.getItem('WebAppSessionID'),
      'IsBrowserRefresh': true,
      'IsMobile': true,
      'EventId': eventID
    };

    Map<String, dynamic> bodyData = {};

    bodyData.addAll(bodyDataHeader);
    bodyData.addAll(bodyDataCustom);

    String apiURL = APIConstants.POST_REFERSH;

    switch (eventID) {
      case 216:
      case 217:
      case 243:
        apiURL = APIConstants.UPLOAD_FILE;
        break;
    }

    var documentDirectory = await getApplicationSupportDirectory();
    print(documentDirectory.path);
    await new File(documentDirectory.path + '/postParams.txt')
        .writeAsString(bodyData.toString());

    Map<dynamic, dynamic> userDetailValue;
    if (apiURL == APIConstants.UPLOAD_FILE) {
      userDetailValue =
          await ApiBaseHelper().fileUploadPost(apiURL, bodyData, context);
    } else {
      userDetailValue = await ApiBaseHelper()
          .post(apiURL, jsonEncode(bodyData).toString(), context);
    }

    await new File(documentDirectory.path + '/receiveParams.txt')
        .writeAsString(userDetailValue.toString());
    var userDetails = ResponseBody.fromJson(userDetailValue);

    APIConstants.responseBody = userDetails;

    database.webAppClientKeysFromSql.deleteAllWebAppClientDataKeys();

    database.webAppClientKeysFromSql
        .insertWebClientDataList(userDetails.jsonOutput_WebAppClientDataKeys);

    await afterSQL(database);

    if (errorCheckResponse(
        database, userDetails.jsonOutput_StandardHeader, context)) {
      await postProcessingSQL(database, eventID);

      await setRowSources(database, userDetails.jsonOutput_RowSources);
      await eventRowSourcesInsert(database, userDetails.jsonOutput_RowSources);

      await setControllerParam(database, context, valueOfPIandPRI,
          userDetails.jsonOutput_WebAppClientData, eventID);
    }
  } on FetchDataException catch (e, stack) {
    print('error caught: $e');
    print(stack);
  } on UnauthorisedException catch (e, stack) {
    print('error caught: $e');
    print(stack);
  } on Exception catch (e, stacktrace) {
    print(stacktrace.toString());
    print(stacktrace.toString());
    throw e;
  }
}

// setRowSources()
// ERROR CHECK RESPONSE
errorCheckResponse(AppDatabase database,
    StandardHeader jsonOutput_StandardHeader, BuildContext context) {
  try {
    GlobalState.errorCallMsgShown = false;
    print("************Check Response************");
    print(jsonOutput_StandardHeader.ER_ID);
    switch (jsonOutput_StandardHeader.ER_ID) {
      case 13:
        VoidCallback callback = () async {
          await eventLogout(context);
        };
        GlobalState.errorCallMsgShown = true;
        errorAlertDialog(context, "Session Expired",
            "Your session was logged out", callback);
        return false;
        break;
      case 0:
        return true;
        break;

      default:
        print("Error Message");
        GlobalState.errorCallMsgShown = true;
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: Text("Alert"),
              content: Text(
                  "SQL (${jsonOutput_StandardHeader.ER_ID}): ${jsonOutput_StandardHeader.ER}"),
              actions: [
                FlatButton(
                  child: Text("OK"),
                  onPressed: () async {
                    if (GlobalState.eventMethod == "eventRevive") {
                      await eventLogout(context);
                    } else {
                      Navigator.of(dialogContext).pop();
                    }
                    // await eventBack(appDatabase, context, GlobalState.PI);
                  },
                ),
              ],
            );
          },
        );
        return false;
        break;
    }
  } catch (e) {
    print("Testing Error Header");
    throw e;
  }
}

//ERROR ALERT DIALOG
errorAlertDialog(
    BuildContext context, String title, String message, VoidCallback callback) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: callback,
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("${title}"),
    content: Text("${message}"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return alert;
    },
  );
}

// POST PRECESSING SQL

Future<void> postProcessingSQL(AppDatabase database, int eventID) async {
  try {
    switch (eventID) {
      case 211:
        await postProcessingRS_30_2(database);
        await postProcessingPrci688StackPush(database);
        break;
      case 2:
        APIConstants.uploadingfilmStripImages.clear();
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

//===============================================================================
// AFTER SQL		AFTER SQL		AFTER SQL		AFTER SQL
//===============================================================================
Future<void> afterSQL(AppDatabase database) async {
  try {
    print("=============================");
    print("=========afterSQL============");
    print("=============================");

    // -- Clear RF Value Each Time
    List<Map> list4 = await database.database
        .rawQuery("UPDATE  WebAppClientKeysActive SET RF = NULL");

    // --1. TEMP TABLE: ITEMS FOR CHACHING
    List<Map> list6 = await database.database
        .rawQuery("DELETE FROM WebAppClientKeysTemporary");

    List<Map> list7 = await database.database.rawQuery(
        "INSERT INTO WebAppClientKeysTemporary (TY, PC, CL, TI, UI) SELECT "
        "WebAppClientKeysFromSql.TY, "
        "WebAppClientKeysFromSql.PC, "
        "WebAppClientKeysFromSql.CL, "
        "WebAppClientKeysFromSql.TI, "
        "WebAppClientKeysFromSql.UI "
        "FROM WebAppClientKeysFromSql "
        "WHERE "
        "(WebAppClientKeysFromSql.TY = 1) AND (WebAppClientKeysFromSql.SV = 1)");

    //--2. INSERT INTO CACHE IF NOT EXISTING  (If Existing - Do not need to do anything)

    await database.database.rawQuery(
        "INSERT INTO WebAppClientKeysCache (TY, PC, CL, TI, UI) SELECT "
        "3, "
        "WebAppClientKeysTemporary.PC, "
        "WebAppClientKeysTemporary.CL, "
        "WebAppClientKeysTemporary.TI, "
        "WebAppClientKeysTemporary.UI "
        "FROM WebAppClientKeysTemporary LEFT JOIN WebAppClientKeysCache ON "
        "(WebAppClientKeysTemporary.PC= WebAppClientKeysCache.PC) AND "
        "(WebAppClientKeysTemporary.CL = WebAppClientKeysCache.CL) AND "
        "(WebAppClientKeysTemporary.TI = WebAppClientKeysCache.TI) AND "
        "(WebAppClientKeysTemporary.UI = WebAppClientKeysCache.UI) WHERE "
        "WebAppClientKeysCache.id IS NULL");

    //-- 3. INSERT TY = 1 FROM SQL - INTO MOBILE

    await database.database.rawQuery("DELETE FROM WebAppClientKeysActive");

    await database.database.rawQuery(
        "INSERT INTO WebAppClientKeysActive (TY, PC, CL, TI, UI, RF) SELECT "
        "WebAppClientKeysFromSql.TY, "
        "WebAppClientKeysFromSql.PC, "
        "WebAppClientKeysFromSql.CL, "
        "WebAppClientKeysFromSql.TI, "
        "WebAppClientKeysFromSql.UI, "
        "0 "
        "FROM WebAppClientKeysFromSql");

    await database.database.rawQuery("DELETE FROM WebAppClientKeysRequestKeys");
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    throw e;
  }
}

// setPreferenceOutputClientData(int PI, int PRI,
//     dynamic jsonOutputWebAppClientData, dynamic jsonOutputRowSources) async {
//   if (jsonOutputRowSources.length > 0) {
//     await Preference.setItem(
//         "jsonOutput_RowSources", jsonEncode(jsonOutputRowSources).toString());
//   }
// }

// //===============================================================================
// // WEB CLIENT DATA		WEB CLIENT DATA			WEB CLIENT DATA
// //===============================================================================
// setWebClientData(
//   AppDatabase database,
//   List jsonOutput_WebAppClientData,
//   PIandPRI valueOfPIandPRI,
// ) async {
//   if (jsonOutput_WebAppClientData.length > 0) {
//     for (NavigationObject value in jsonOutput_WebAppClientData) {
//       await database.navigationObject.insertWebAppClientData(
//           new WebAppClientData.fromJson(value.toJson()));
//       if (value.DT != null && !value.DT.toString().contains('Text')) {
//         for (Map<String, dynamic> pageValue in value.DT) {
//           setControllerParam(
//               database, valueOfPIandPRI, jsonOutput_WebAppClientData);
//         }
//       }
//     }
//   }
// }

//================================================================================
//================================================================================
// SECONDARY FUNCTION - Lower Level Modularized function for support and misc.
//================================================================================
//================================================================================
Future<void> setControllerParam(database, context, valueOfPIandPRI,
    jsonOutput_WebAppClientData, eventID) async {
  try {
    GlobalState.pageDataLoaded = false;
    switch (valueOfPIandPRI.PRI) {
      case 127:
        {
          await setRecentsPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 187:
        {
          await setSettingsPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;

      case 130:
        {
          await setOrganizationPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;

      case 203:
        {
          await setAccountPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 204:
        {
          await setCompaniesPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 205:
        {
          await setSitesPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 206:
        {
          await setUsersPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 207:
        {
          await setThingsPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 208:
        {
          await setLocationsPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 210:
        {
          await setThingsImagePageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 211:
        {
          await setThingsEditPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 212:
        {
          await setThingsImagesEditPageItems(database, context, valueOfPIandPRI,
              jsonOutput_WebAppClientData, eventID);
        }
        break;
      case 213:
        {
          // print("sadfadsfadsfadsfadsfasdfadsfadsfadsfasdfadsfadsfadsfadsfadsfadsfasdfasfadsfadsfadsfadsfadsfadsfadsfadsfadsfasdf");
          await setImageViewEditPageItems(database, context, valueOfPIandPRI,
              jsonOutput_WebAppClientData, eventID);
        }
        break;
      case 214:
        {
          // print("sadfadsfadsfadsfadsfasdfadsfadsfadsfasdfadsfadsfadsfadsfadsfadsfasdfasfadsfadsfadsfadsfadsfadsfadsfadsfadsfasdf");
          await setThingsDescriptionEditPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 215:
        {
          await setVideoEditPageItems(database, context, valueOfPIandPRI,
              jsonOutput_WebAppClientData, eventID);
        }
        break;
      case 217:
        {
          await setAccountPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 218:
        {
          await setCompaniesPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 219:
        {
          await setSitesEditPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 220:
        {
          await setUserEditPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 221:
        {
          await setLocationEditPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 222:
        {
          await setAccountEditDescriptionPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 223:
        {
          await setCompaniesDescriptionPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 224:
        {
          await setSiteDescriptionEditPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 225:
        {
          await setUsersDescriptionPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
      case 228:
        {
          await setSiteAddressEditPageItems(
              database, context, valueOfPIandPRI, jsonOutput_WebAppClientData);
        }
        break;
    }

    GlobalState.pageDataLoaded = true;
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    throw e;
  }
}

//=================================================================================
//==================================================================================
// SET RECENT PAGE DATA ITEMS  SET RECENT PAGE DATA ITEMS SET RECENT PAGE DATA ITEMS
//==================================================================================
//==================================================================================

Future<void> setRecentsPageItems(database, BuildContext context,
    valueOfPIandPRI, List jsonOutput_WebAppClientData) async {
  try {
    GlobalState.pageDataLoaded = false;
    if (jsonOutput_WebAppClientData.length > 0) {
      APIConstants.pi_30_PRI_127_PRCI_656_Items.clear();
      await database.database.rawQuery("DELETE FROM WebAppClientData");
      bool bln656Serviced = false;

      for (NavigationObject value in jsonOutput_WebAppClientData) {
        print("NavigationObjectValue");
        print(value.toString());
        await database.navigationObject.insertWebAppClientData(
            new WebAppClientData.fromJson(value.toJson()));

        switch (value.PRCI) {
          case 656:
            bln656Serviced = true;
            for (Map<String, dynamic> pageValue in value.DT) {
              var pageValueD = PI_30_PRI_127_PRCI_656_Items.fromJson(pageValue);
              APIConstants.pi_30_PRI_127_PRCI_656_Items.add(pageValueD);
            }
            break;
        }
      }

      if (!bln656Serviced) {
        // errorAlertDialog(context, title, message, () { })

        ErrorCall(database, context, "PRCI 656 not serviced", 623,
            blnshowToast: true);
      }

      APIConstants.rowSource_RS_12_2 = await eventGetRowSourceRS_12_2(database);
      APIConstants.rowSource_RS_29_41_15_6 =
          await eventGetRowSourceRS_29_41_15_6(database);
      APIConstants.rowSource_RS_1_10_2 =
          await eventGetRowSourceRS_1_10_2(database);
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    throw e;
  }
}

//==============================================================
//==============================================================
// SET SETTINGS PAGE DATA ITEMS  SET SETTINGS PAGE DATA ITEMS
//==============================================================
//==============================================================

Future<void> setSettingsPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      APIConstants.pi_30_PRI_187_PRCI_716_Items.clear();
      bool bln716Serviced = false;
      // await database.database.rawQuery("DELETE FROM WebAppClientData");
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        // await database.navigationObject.insertWebAppClientData(
        //     new WebAppClientData.fromJson(value.toJson()));
        // if (value.DT != null && !value.DT.toString().contains('Text')) {
        switch (value.PRCI) {
          case 716:
            bln716Serviced = true;
            for (Map<String, dynamic> pageValue in value.DT) {
              var pageValueD = PI_30_PRI_187_PRCI_716_Items.fromJson(pageValue);
              APIConstants.pi_30_PRI_187_PRCI_716_Items.add(pageValueD);
            }
            break;
        }
      }

      if (!bln716Serviced) {
        ErrorCall(database, context, "PRCI 716 not serviced", 623,
            blnshowToast: true);
      }
      GlobalState.pageDataLoaded = true;
    }
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    throw e;
  }
}

//======================================================================
//======================================================================
// SET ORGANIZATION PAGE DATA ITEMS  SET ORGANIZATION PAGE DATA ITEMS
//======================================================================
//======================================================================
Future<void> setOrganizationPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      APIConstants.pi_33_PRI_130_PRCI_688_Children.clear();
      bool bln688Serviced = false;
      // bool bln722Serviced = false;
      bool bln714Serviced = true;
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        // These are PRCI with DT - JSON value (has no 'Text')
        if (value.DT != null && !value.DT.toString().contains('Text')) {
          // This looks through the JSON array for each pageValue
          for (Map<String, dynamic> pageValue in value.DT) {
            switch (value.PRCI) {
              case 772:
                // bln722Serviced = true;
                APIConstants.pi_33_PRI_130_PRCI_772_NodeKey =
                    RequestKeys.fromJson(pageValue);
                break;
              case 688:
                bln688Serviced = true;
                APIConstants.pi_33_PRI_130_PRCI_688_Parent =
                    PI_33_PRI_130_PRCI_688_Parent.fromJson(
                        pageValue['PARENT'][0]);
                APIConstants
                    .pi_33_PRI_130_PRCI_688_TreePath = pageValue['TREEPATH'] !=
                        null
                    ? (pageValue['TREEPATH'] as List)
                        .map((e) => PI_33_PRI_130_PRCI_688_TreePath.fromJson(e))
                        .toList()
                    : null;
                if (await Preference.getItem(
                        'PG_33_PRCI_688_${APIConstants.pi_33_PRI_130_PRCI_688_Parent.TIR.toString()}') ==
                    "") {
                  await Preference.setItem(
                      'PG_33_PRCI_688_${APIConstants.pi_33_PRI_130_PRCI_688_Parent.TIR.toString()}',
                      jsonEncode(pageValue).toString());
                }
                for (Map<String, dynamic> childrenValue
                    in pageValue['CHILDREN']) {
                  var pageValueChild =
                      PI_33_PRI_130_PRCI_688_Children.fromJson(childrenValue);
                  APIConstants.pi_33_PRI_130_PRCI_688_Children
                      .add(pageValueChild);
                }
                break;
            }
          }
        } else if (value.PRCI == 714) {
          bln714Serviced = true;
          APIConstants.pi_33_PRI_130_PRCI_714_RefreshTime =
              value.DT['Text'].toString();
        }
      }

      if (!bln714Serviced) {
        ErrorCall(database, context, "PRCI 714 not serviced", 623,
            blnshowToast: true);
      }
      // if (!bln722Serviced) {
      //   ErrorCall(database, context, "PRCI 722 not serviced", 623,
      //       blnshowToast: true);
      // }
      if (!bln688Serviced) {
        ErrorCall(database, context, "PRCI 688 not serviced", 623,
            blnshowToast: true);
      }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

//==============================================================
//==============================================================
// SET THINGS PAGE DATA ITEMS  SET THINGS PAGE DATA ITEMS
//==============================================================
//==============================================================

Future<void> setThingsPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      bool bln785Serviced = false;
      bool bln786Serviced = false;
      APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
      APIConstants.page_PRCI_786_Items.clear();
      // await database.database.rawQuery("DELETE FROM WebAppClientData");
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        if (value.DT != null && !value.DT.toString().contains('Text')) {
          switch (value.PRCI) {
            case 785:
              bln785Serviced = true;
              for (Map<String, dynamic> pageValue in value.DT) {
                var pageValueD =
                    PI_89_PRI_207_PRCI_785_Items.fromJson(pageValue);
                APIConstants.pi_89_PRI_207_PRCI_785_Items.add(pageValueD);
              }
              break;
            case 786:
              bln786Serviced = true;
              var pageValueD = PRCI_786_Items.fromJson(value.DT);
              APIConstants.page_PRCI_786_Items.add(pageValueD);
              break;
          }
        }
      }

      if (APIConstants.pi_89_PRI_207_PRCI_785_Items.length > 0) {
        APIConstants.pi_89_PRI_207_PRCI_785_Items[0].CHILDREN
            .sort((a, b) => a.INDEX1.compareTo(b.INDEX1));
      }
      if (!bln785Serviced) {
        ErrorCall(database, context, "PRCI 785 not serviced", 623,
            blnshowToast: true);
      }
      if (!bln786Serviced) {
        ErrorCall(database, context, "PRCI 786 not serviced", 623,
            blnshowToast: true);
      }
      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

//==============================================================
//==============================================================
// SET THINGS PAGE DATA ITEMS  SET THINGS PAGE DATA ITEMS
//==============================================================
//==============================================================

Future<void> setThingsImagesEditPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData, eventID) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      // switch (eventID) {
      // case 220:
      // case 2:
      APIConstants.filmStripImages.clear();
      APIConstants.pi_94_PRI_212_PRCI_796_Items.clear();
      bool bln785Serviced = false;
      // await database.database.rawQuery("DELETE FROM WebAppClientData");
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        switch (value.PRCI) {
          case 785:
            bln785Serviced = true;
            for (Map<String, dynamic> pageValue in value.DT) {
              var pageValueD = PI_94_PRI_212_PRCI_796_Items.fromJson(pageValue);
              APIConstants.pi_94_PRI_212_PRCI_796_Items.add(pageValueD);
              APIConstants.filmStripImages.addAll(
                  pageValueD.CHILDREN.map((e) => e.URL_STRIP_VIEW).toList());
            }
            break;
        }
      }
      // break;
      // }
      if (!bln785Serviced) {
        ErrorCall(database, context, "PRCI 796 not serviced", 623,
            blnshowToast: true);
      }
      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

Future<void> setThingsImagePageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      bool bln785Serviced = false;
      APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
      APIConstants.pi_92_PRI_210_PRCI_787_Items.clear();
      // await database.database.rawQuery("DELETE FROM WebAppClientData");
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        switch (value.PRCI) {
          case 787:
            bln785Serviced = true;
            for (Map<String, dynamic> pageValue in value.DT) {
              var pageValueD = PI_92_PRI_210_PRCI_787_Items.fromJson(pageValue);
              APIConstants.pi_92_PRI_210_PRCI_787_Items.add(pageValueD);
            }
            break;
        }
      }
      if (!bln785Serviced) {
        ErrorCall(database, context, "PRCI 787 not serviced", 623,
            blnshowToast: true);
      }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

Future<void> setImageViewEditPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData, int eventID) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      APIConstants.pi_95_PRI_213_PRCI_805_Items.clear();
      bool bln805Serviced = false;
      // await database.database.rawQuery("DELETE FROM WebAppClientData");
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        switch (value.PRCI) {
          case 805:
            bln805Serviced = true;
            for (Map<String, dynamic> pageValue in value.DT) {
              var pageValueD = PI_95_PRI_213_PRCI_805_Items.fromJson(pageValue);
              APIConstants.pi_95_PRI_213_PRCI_805_Items.add(pageValueD);
            }
            break;
        }
      }

      if (APIConstants.pi_95_PRI_213_PRCI_805_Items.length > 0 &&
          eventID != 243) {
        APIConstants.pi_95_PRI_213_PRCI_805_ImageResponse =
            await networkURLResponse(
                APIConstants.pi_95_PRI_213_PRCI_805_Items[0].URLD5);
      }
      if (!bln805Serviced) {
        ErrorCall(database, context, "PRCI 805 not serviced", 623,
            blnshowToast: true);
      }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

Future<void> setThingsEditPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      APIConstants.page_PRCI_786_Items.clear();
      APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
      bool bln785Serviced = false;
      bool bln786Serviced = false;
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        if (value.DT != null && !value.DT.toString().contains('Text')) {
          switch (value.PRCI) {
            case 785:
              bln785Serviced = true;
              for (Map<String, dynamic> pageValue in value.DT) {
                var pageValueD =
                    PI_89_PRI_207_PRCI_785_Items.fromJson(pageValue);
                APIConstants.pi_89_PRI_207_PRCI_785_Items.add(pageValueD);
              }
              break;
            case 786:
              bln786Serviced = true;
              print("789 ITems... Calls");
              var pageValueD = PRCI_786_Items.fromJson(value.DT);
              APIConstants.page_PRCI_786_Items.add(pageValueD);
              break;
          }
        }
      }
      if (!bln786Serviced) {
        ErrorCall(database, context, "PRCI 786 Serviced", 623,
            blnshowToast: true);
      }
      if (!bln785Serviced) {
        ErrorCall(database, context, "PRCI 785 Serviced", 623,
            blnshowToast: true);
      }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

Future<void> setThingsDescriptionEditPageItems(database, context,
    valueOfPIandPRI, List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      APIConstants.page_PRCI_786_Items.clear();
      // APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
      // bool bln785Serviced = false;
      bool bln786Serviced = false;
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        if (value.DT != null && !value.DT.toString().contains('Text')) {
          switch (value.PRCI) {
            case 786:
              bln786Serviced = true;
              print("786 ITems... Calls");
              var pageValueD = PRCI_786_Items.fromJson(value.DT);
              APIConstants.page_PRCI_786_Items.add(pageValueD);
              break;
          }
        }
      }
      if (!bln786Serviced) {
        ErrorCall(database, context, "PRCI 786 Serviced", 623,
            blnshowToast: true);
      }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

Future<void> setSiteDescriptionEditPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      APIConstants.pi_87_PRI_205_PRCI_817_Items.clear();
      bool bln817Serviced = false;
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        if (value.DT != null && !value.DT.toString().contains('Text')) {
          switch (value.PRCI) {
            case 817:
              bln817Serviced = true;
              print("817 ITems... Calls");
              var pageValueD = PI_87_PRI_205_PRCI_817_Items.fromJson(value.DT);
              APIConstants.pi_87_PRI_205_PRCI_817_Items.add(pageValueD);
              break;
          }
        }
      }
      if (!bln817Serviced) {
        ErrorCall(database, context, "PRCI 817 Serviced", 623,
            blnshowToast: true);
      }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

Future<void> setSiteAddressEditPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      APIConstants.pi_87_PRI_205_PRCI_817_Items.clear();
      bool bln817Serviced = false;
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        if (value.DT != null && !value.DT.toString().contains('Text')) {
          switch (value.PRCI) {
            case 817:
              bln817Serviced = true;
              print("817 ITems... Calls");
              var pageValueD = PI_87_PRI_205_PRCI_817_Items.fromJson(value.DT);
              APIConstants.pi_87_PRI_205_PRCI_817_Items.add(pageValueD);
              break;
          }
        }
      }
      if (!bln817Serviced) {
        ErrorCall(database, context, "PRCI 817 Serviced", 623,
            blnshowToast: true);
      }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

Future<void> setAccountPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      APIConstants.pi_85_PRI_203_PRCI_815_Items.clear();
      APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
      bool bln815Serviced = false;
      bool bln785Serviced = false;
      // bool bln788Serviced = false;
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        // if (value.DT != null && !value.DT.toString().contains('Text')) {
        switch (value.PRCI) {
          case 785:
            bln785Serviced = true;
            for (Map<String, dynamic> pageValue in value.DT) {
              var pageValueD = PI_89_PRI_207_PRCI_785_Items.fromJson(pageValue);
              APIConstants.pi_89_PRI_207_PRCI_785_Items.add(pageValueD);
            }
            break;
          case 815:
            bln815Serviced = true;

            var pageValueD = PI_85_PRI_203_PRCI_815_Items.fromJson(value.DT);
            APIConstants.pi_85_PRI_203_PRCI_815_Items.add(pageValueD);

            break;
        }
      }

      if (!bln815Serviced) {
        ErrorCall(database, context, "PRCI 815 Serviced", 623,
            blnshowToast: true);
      }
      if (!bln785Serviced) {
        ErrorCall(database, context, "PRCI 785 Serviced", 623,
            blnshowToast: true);
      }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

Future<void> setAccountEditDescriptionPageItems(database, context,
    valueOfPIandPRI, List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      APIConstants.pi_85_PRI_203_PRCI_815_Items.clear();

      bool bln815Serviced = false;
      bool bln785Serviced = false;
      // bool bln788Serviced = false;
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        // if (value.DT != null && !value.DT.toString().contains('Text')) {
        switch (value.PRCI) {
          case 815:
            bln815Serviced = true;
            var pageValueD = PI_85_PRI_203_PRCI_815_Items.fromJson(value.DT);
            APIConstants.pi_85_PRI_203_PRCI_815_Items.add(pageValueD);

            break;
        }
      }

      if (!bln815Serviced) {
        ErrorCall(database, context, "PRCI 815 Serviced", 623,
            blnshowToast: true);
      }
      // if (!bln785Serviced) {
      //   ErrorCall(database, context, "PRCI 785 Serviced", 623,
      //       blnshowToast: true);
      // }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

// Future<void> setCompanyEditPageItems(database, context, valueOfPIandPRI,
//     List jsonOutput_WebAppClientData) async {
//   try {
//     if (jsonOutput_WebAppClientData.length > 0) {
//       GlobalState.pageDataLoaded = false;
//       // APIConstants.pi_99_PRI_217_PRCI_821_Items.clear();
//       APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
//       // bool bln821Serviced = false;
//       bool bln785Serviced = false;
//       // bool bln788Serviced = false;
//       for (NavigationObject value in jsonOutput_WebAppClientData) {
//         // if (value.DT != null && !value.DT.toString().contains('Text')) {
//         switch (value.PRCI) {
//           case 785:
//             bln785Serviced = true;
//             for (Map<String, dynamic> pageValue in value.DT) {
//               var pageValueD = PI_89_PRI_207_PRCI_785_Items.fromJson(pageValue);
//               APIConstants.pi_89_PRI_207_PRCI_785_Items.add(pageValueD);
//             }
//             break;
//           // case 821:
//           //   bln821Serviced = true;
//           //
//           //   var pageValueD = PI_99_PRI_217_PRCI_821_Items.fromJson(value.DT);
//           //   APIConstants.pi_99_PRI_217_PRCI_821_Items.add(pageValueD);
//           //
//           //   break;
//         }
//       }
//
//       // if (!bln821Serviced) {
//       //   ErrorCall(database, context, "PRCI 821 Serviced", 623,
//       //       blnshowToast: true);
//       // }
//       if (!bln785Serviced) {
//         ErrorCall(database, context, "PRCI 785 Serviced", 623,
//             blnshowToast: true);
//       }
//
//       GlobalState.pageDataLoaded = true;
//     } else {
//       ErrorCall(database, context, "Web app client data is missing", 623,
//           blnshowToast: true);
//     }
//   } catch (e, stacktrace) {
//     print('Exception: ' + e.toString());
//     print('Stacktrace: ' + stacktrace.toString());
//     throw e;
//   }
// }

// Future<void> setCompanyDescriptionEditPageItems(database, context,
//     valueOfPIandPRI, List jsonOutput_WebAppClientData) async {
//   try {
//     if (jsonOutput_WebAppClientData.length > 0) {
//       GlobalState.pageDataLoaded = false;
//       // APIConstants.pi_99_PRI_217_PRCI_821_Items.clear();
//       APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
//       // bool bln821Serviced = false;
//       bool bln785Serviced = false;
//       // bool bln788Serviced = false;
//       for (NavigationObject value in jsonOutput_WebAppClientData) {
//         // if (value.DT != null && !value.DT.toString().contains('Text')) {
//         switch (value.PRCI) {
//           case 785:
//             bln785Serviced = true;
//             for (Map<String, dynamic> pageValue in value.DT) {
//               var pageValueD = PI_89_PRI_207_PRCI_785_Items.fromJson(pageValue);
//               APIConstants.pi_89_PRI_207_PRCI_785_Items.add(pageValueD);
//             }
//             break;
//           // case 821:
//           //   bln821Serviced = true;
//           //
//           //   var pageValueD = PI_99_PRI_217_PRCI_821_Items.fromJson(value.DT);
//           //   APIConstants.pi_99_PRI_217_PRCI_821_Items.add(pageValueD);
//           //
//           //   break;
//         }
//       }
//
//       // if (!bln821Serviced) {
//       //   ErrorCall(database, context, "PRCI 821 Serviced", 623,
//       //       blnshowToast: true);
//       // }
//       if (!bln785Serviced) {
//         ErrorCall(database, context, "PRCI 785 Serviced", 623,
//             blnshowToast: true);
//       }
//
//       GlobalState.pageDataLoaded = true;
//     } else {
//       ErrorCall(database, context, "Web app client data is missing", 623,
//           blnshowToast: true);
//     }
//   } catch (e, stacktrace) {
//     print('Exception: ' + e.toString());
//     print('Stacktrace: ' + stacktrace.toString());
//     throw e;
//   }
// }

Future<void> setSitesEditPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      // APIConstants.pi_99_PRI_217_PRCI_821_Items.clear();
      APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
      APIConstants.pi_87_PRI_205_PRCI_817_Items.clear();
      // bool bln821Serviced = false;
      bool bln785Serviced = false;
      bool bln817Serviced = false;
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        // if (value.DT != null && !value.DT.toString().contains('Text')) {
        switch (value.PRCI) {
          case 785:
            bln785Serviced = true;
            for (Map<String, dynamic> pageValue in value.DT) {
              var pageValueD = PI_89_PRI_207_PRCI_785_Items.fromJson(pageValue);
              APIConstants.pi_89_PRI_207_PRCI_785_Items.add(pageValueD);
            }
            break;
          case 817:
            bln817Serviced = true;

            var pageValueD = PI_87_PRI_205_PRCI_817_Items.fromJson(value.DT);
            APIConstants.pi_87_PRI_205_PRCI_817_Items.add(pageValueD);

            break;
        }
      }

      // if (!bln821Serviced) {
      //   ErrorCall(database, context, "PRCI 821 Serviced", 623,
      //       blnshowToast: true);
      // }
      if (!bln785Serviced) {
        ErrorCall(database, context, "PRCI 785 Serviced", 623,
            blnshowToast: true);
      }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

Future<void> setLocationEditPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      // APIConstants.pi_99_PRI_217_PRCI_821_Items.clear();
      APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
      // bool bln821Serviced = false;
      bool bln785Serviced = false;
      // bool bln788Serviced = false;
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        // if (value.DT != null && !value.DT.toString().contains('Text')) {
        switch (value.PRCI) {
          case 785:
            bln785Serviced = true;
            for (Map<String, dynamic> pageValue in value.DT) {
              var pageValueD = PI_89_PRI_207_PRCI_785_Items.fromJson(pageValue);
              APIConstants.pi_89_PRI_207_PRCI_785_Items.add(pageValueD);
            }
            break;
          // case 821:
          //   bln821Serviced = true;
          //
          //   var pageValueD = PI_99_PRI_217_PRCI_821_Items.fromJson(value.DT);
          //   APIConstants.pi_99_PRI_217_PRCI_821_Items.add(pageValueD);
          //
          //   break;
        }
      }

      // if (!bln821Serviced) {
      //   ErrorCall(database, context, "PRCI 821 Serviced", 623,
      //       blnshowToast: true);
      // }
      if (!bln785Serviced) {
        ErrorCall(database, context, "PRCI 785 Serviced", 623,
            blnshowToast: true);
      }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

Future<void> setUserEditPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      // APIConstants.pi_99_PRI_217_PRCI_821_Items.clear();
      APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
      APIConstants.pi_88_PRI_206_PRCI_818_Items.clear();
      // bool bln821Serviced = false;
      bool bln785Serviced = false;
      bool bln818Serviced = false;
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        // if (value.DT != null && !value.DT.toString().contains('Text')) {
        switch (value.PRCI) {
          case 785:
            bln785Serviced = true;
            for (Map<String, dynamic> pageValue in value.DT) {
              var pageValueD = PI_89_PRI_207_PRCI_785_Items.fromJson(pageValue);
              APIConstants.pi_89_PRI_207_PRCI_785_Items.add(pageValueD);
            }
            break;
          case 818:
            bln818Serviced = true;
            // for (Map<String, dynamic> pageValue in value.DT) {
            var pageValueD = PI_88_PRI_206_PRCI_818_Items.fromJson(value.DT);
            APIConstants.pi_88_PRI_206_PRCI_818_Items.add(pageValueD);
            // }
            break;
        }
      }

      if (!bln818Serviced) {
        ErrorCall(database, context, "PRCI 818 not Serviced", 623,
            blnshowToast: true);
      }
      if (!bln785Serviced) {
        ErrorCall(database, context, "PRCI 785 not Serviced", 623,
            blnshowToast: true);
      }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

//==============================================================
//==============================================================
// SET Companies PAGE DATA ITEMS  SET Companies PAGE DATA ITEMS
//==============================================================
//==============================================================

Future<void> setCompaniesPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
      APIConstants.pi_86_PRI_204_PRCI_816_Items.clear();
      bool bln785Serviced = false;
      bool bln816Serviced = false;
      // await database.database.rawQuery("DELETE FROM WebAppClientData");
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        switch (value.PRCI) {
          case 785:
            bln785Serviced = true;
            for (Map<String, dynamic> pageValue in value.DT) {
              var pageValueD = PI_89_PRI_207_PRCI_785_Items.fromJson(pageValue);
              APIConstants.pi_89_PRI_207_PRCI_785_Items.add(pageValueD);
            }
            break;
          case 816:
            bln816Serviced = true;
            // for (Map<String, dynamic> pageValue in value.DT) {
            var pageValueD = PI_86_PRI_204_PRCI_816_Items.fromJson(value.DT);
            APIConstants.pi_86_PRI_204_PRCI_816_Items.add(pageValueD);
            // }
            break;
        }
      }

      if (!bln816Serviced) {
        ErrorCall(database, context, "PRCI 816 not serviced", 623);
      }
      if (!bln785Serviced) {
        ErrorCall(database, context, "PRCI 785 not serviced", 623);
      }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

Future<void> setCompaniesDescriptionPageItems(database, context,
    valueOfPIandPRI, List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      // APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
      APIConstants.pi_86_PRI_204_PRCI_816_Items.clear();
      // bool bln785Serviced = false;
      bool bln816Serviced = false;
      // await database.database.rawQuery("DELETE FROM WebAppClientData");
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        switch (value.PRCI) {
          // case 785:
          //   bln785Serviced = true;
          //   for (Map<String, dynamic> pageValue in value.DT) {
          //     var pageValueD = PI_89_PRI_207_PRCI_785_Items.fromJson(pageValue);
          //     APIConstants.pi_89_PRI_207_PRCI_785_Items.add(pageValueD);
          //   }
          //   break;
          case 816:
            bln816Serviced = true;
            // for (Map<String, dynamic> pageValue in value.DT) {
            var pageValueD = PI_86_PRI_204_PRCI_816_Items.fromJson(value.DT);
            APIConstants.pi_86_PRI_204_PRCI_816_Items.add(pageValueD);
            // }
            break;
        }
      }

      if (!bln816Serviced) {
        ErrorCall(database, context, "PRCI 816 not serviced", 623);
      }
      // if (!bln785Serviced) {
      //   ErrorCall(database, context, "PRCI 785 not serviced", 623);
      // }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

//==============================================================
//==============================================================
// SET Locations PAGE DATA ITEMS  SET Locations PAGE DATA ITEMS
//==============================================================
//==============================================================

Future<void> setLocationsPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
      APIConstants.pi_90_PRI_208_PRCI_819_Items.clear();
      bool bln785Serviced = false;
      bool bln819Serviced = false;
      // await database.database.rawQuery("DELETE FROM WebAppClientData");
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        switch (value.PRCI) {
          case 785:
            bln785Serviced = true;
            for (Map<String, dynamic> pageValue in value.DT) {
              var pageValueD = PI_89_PRI_207_PRCI_785_Items.fromJson(pageValue);
              APIConstants.pi_89_PRI_207_PRCI_785_Items.add(pageValueD);
            }
            break;
          case 819:
            bln819Serviced = true;
            // for (Map<String, dynamic> pageValue in value.DT) {
            var pageValueD = PI_90_PRI_208_PRCI_819_Items.fromJson(value.DT);
            APIConstants.pi_90_PRI_208_PRCI_819_Items.add(pageValueD);
            // }
            break;
        }
      }

      if (!bln819Serviced) {
        ErrorCall(database, context, "PRCI 819 not serviced", 623);
      }
      if (!bln785Serviced) {
        ErrorCall(database, context, "PRCI 785 not serviced", 623);
      }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

//==============================================================
//==============================================================
// SET Users PAGE DATA ITEMS  SET Users PAGE DATA ITEMS
//==============================================================
//==============================================================

Future<void> setUsersPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
      APIConstants.pi_88_PRI_206_PRCI_818_Items.clear();
      bool bln785Serviced = false;
      bool bln818Serviced = false;
      // await database.database.rawQuery("DELETE FROM WebAppClientData");
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        switch (value.PRCI) {
          case 785:
            bln785Serviced = true;
            for (Map<String, dynamic> pageValue in value.DT) {
              var pageValueD = PI_89_PRI_207_PRCI_785_Items.fromJson(pageValue);
              APIConstants.pi_89_PRI_207_PRCI_785_Items.add(pageValueD);
            }
            break;
          case 818:
            bln818Serviced = true;
            // for (Map<String, dynamic> pageValue in value.DT) {
            var pageValueD = PI_88_PRI_206_PRCI_818_Items.fromJson(value.DT);
            APIConstants.pi_88_PRI_206_PRCI_818_Items.add(pageValueD);
            // }
            break;
        }
      }

      if (!bln818Serviced) {
        ErrorCall(database, context, "PRCI 818 not serviced", 623);
      }
      if (!bln785Serviced) {
        ErrorCall(database, context, "PRCI 785 not serviced", 623);
      }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

Future<void> setUsersDescriptionPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      APIConstants.pi_88_PRI_206_PRCI_818_Items.clear();
      bool bln818Serviced = false;

      for (NavigationObject value in jsonOutput_WebAppClientData) {
        switch (value.PRCI) {
          case 818:
            bln818Serviced = true;

            var pageValueD = PI_88_PRI_206_PRCI_818_Items.fromJson(value.DT);
            APIConstants.pi_88_PRI_206_PRCI_818_Items.add(pageValueD);

            break;
        }
      }

      if (!bln818Serviced) {
        ErrorCall(database, context, "PRCI 818 not serviced", 623);
      }
      // if (!bln785Serviced) {
      //   ErrorCall(database, context, "PRCI 785 not serviced", 623);
      // }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

//==============================================================
//==============================================================
// SET Places PAGE DATA ITEMS  SET Places PAGE DATA ITEMS
//==============================================================
//==============================================================

Future<void> setSitesPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      APIConstants.pi_89_PRI_207_PRCI_785_Items.clear();
      APIConstants.pi_87_PRI_205_PRCI_817_Items.clear();
      bool bln785Serviced = false;
      bool bln817Serviced = false;
      // await database.database.rawQuery("DELETE FROM WebAppClientData");
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        switch (value.PRCI) {
          case 785:
            bln785Serviced = true;
            for (Map<String, dynamic> pageValue in value.DT) {
              var pageValueD = PI_89_PRI_207_PRCI_785_Items.fromJson(pageValue);
              APIConstants.pi_89_PRI_207_PRCI_785_Items.add(pageValueD);
            }
            break;
          case 817:
            bln817Serviced = true;
            var pageValueD = PI_87_PRI_205_PRCI_817_Items.fromJson(value.DT);
            APIConstants.pi_87_PRI_205_PRCI_817_Items.add(pageValueD);
            break;
        }
      }

      if (!bln817Serviced) {
        ErrorCall(database, context, "PRCI 817 not serviced", 623);
      }
      if (!bln785Serviced) {
        ErrorCall(database, context, "PRCI 785 not serviced", 623);
      }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

//==============================================================
//==============================================================
// SET Places PAGE DATA ITEMS  SET Places PAGE DATA ITEMS
//==============================================================
//==============================================================

Future<void> setVideoEditPageItems(database, context, valueOfPIandPRI,
    List jsonOutput_WebAppClientData, eventID) async {
  try {
    if (jsonOutput_WebAppClientData.length > 0) {
      GlobalState.pageDataLoaded = false;
      bool bln807Serviced = false;
      APIConstants.pi_97_PRI_215_PRCI_807_Items.clear();
      // await database.database.rawQuery("DELETE FROM WebAppClientData");
      for (NavigationObject value in jsonOutput_WebAppClientData) {
        // await database.navigationObject.insertWebAppClientData(
        //     new WebAppClientData.fromJson(value.toJson()));
        switch (value.PRCI) {
          case 807:
            bln807Serviced = true;
            var pageValueD = PI_97_PRI_215_PRCI_807_Items.fromJson(value.DT);
            APIConstants.pi_97_PRI_215_PRCI_807_Items.add(pageValueD);
            break;
        }
      }

      if (!bln807Serviced) {
        ErrorCall(database, context, "PRCI 807 not serviced", 623,
            blnshowToast: true);
      }

      GlobalState.pageDataLoaded = true;
    } else {
      ErrorCall(database, context, "Web app client data is missing", 623,
          blnshowToast: true);
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

Future<Map<String, String>> loadEnvFile(String path) async {
  DotEnv instance = DotEnv();
  await instance.load(path);
  await Preference.setItem("BASEURL", instance.env["API_URL"]);
  await Preference.setItem("IMAGECONTAINER", instance.env['IMAGE_CONTAINER']);
  return instance.env;
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

void showToast(String msg, {int duration, int gravity, context, color}) {
  Toast.show(msg, context,
      duration: duration,
      gravity: gravity,
      backgroundColor: color ?? Colors.grey);
}

String getURL(List<RowSources_RS_12_2> listOfRow, int UFX) {
  for (RowSources_RS_12_2 value in listOfRow) {
    if (value.I == UFX) return value.D;
  }
  return "";
}

String getUPXBasedImage(database, String textValue, int UPX) {
  try {
    if (UPX == 1) {
      print(textValue);
      return GlobalConfiguration().get(textValue.split("?")[0]) == null
          ? GlobalConfiguration().get('1595')
          : GlobalConfiguration().get(textValue.split("?")[0]);
    } else {
      return textValue;
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
  }
}

void purgDB(AppDatabase database) async {
  try {
    await database.database.rawQuery("DELETE FROM RowSources_RS_1_10_2");
    await database.database.rawQuery("DELETE FROM RowSources_RS_12_2");
    await database.database.rawQuery("DELETE FROM RowSources_RS_30_2");
    await database.database.rawQuery("DELETE FROM RowSources_RS_29_41_15_6");

    await database.database.rawQuery("DELETE FROM WebAppClientKeysActive");
    await database.database.rawQuery("DELETE FROM WebAppClientKeysCache");
    await database.database.rawQuery("DELETE FROM WebAppClientKeysRequestKeys");
    await database.database
        .rawQuery("DELETE FROM WebAppClientKeysRequestKeysInitially");
    await database.database.rawQuery("DELETE FROM WebAppClientKeysToSql");
    await database.database.rawQuery("DELETE FROM WebAppClientKeysFromSql");
    await database.database.rawQuery("DELETE FROM WebAppClientKeysTemporary");
    await database.database.rawQuery("DELETE FROM WebAppClientKeysPageTab");
    await database.database.rawQuery("DELETE FROM WebAppClientKeysPageReturn");
    await database.database.rawQuery("DELETE FROM WebAppClientData");
    await database.database.rawQuery("DELETE FROM Prci688Stack");
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
  }
}

//==========================================================================
// PURGE TREE VIEW CACHE			PURGE TREE VIEW CACHE		PURGE TREE VIEW CACHE
//==========================================================================

Future<void> purgePrci688CacheExceeded(AppDatabase appDatabase) async {
  try {
    List<Map> countList = await appDatabase.database
        .rawQuery("SELECT SUM(CCT) as COUNT FROM Prci688Stack");
    if (countList.length > 0) {
      final cacheKeyCount = countList.elementAt(0)['COUNT'];
      if (cacheKeyCount >= APIConstants.maximumCacheCountTreeView) {
        List<Map> list = await appDatabase.database.rawQuery(
            "SELECT * FROM Prci688Stack ORDER BY CCT DESC, DATE ASC LIMIT 1");
        if (list.length > 0) {
          Preference.removeKey(list[0]['PFK'].toString());
          await appDatabase.database
              .rawQuery("DELETE FROM Prci688Stack WHERE id =${list[0]['id']}");
        }
        // await appDatabase.database.rawQuery(
        //     "to Getting functionality very slow what about that function");
      }
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    ErrorCall(appDatabase, context, e.toString(), ErrorCodes.eventRevive);
  }
}

//====================================================================================
// EVENT GET ROWSOURCE_RS_30_2 EVENT GET ROWSOURCE_RS_30_2 EVENT GET ROWSOURCE_RS_30_2
//====================================================================================
Future<List<RowSources_RS_30_2>> eventGetRowSourceRS_30_2(
    AppDatabase database, bool isMatching) async {
  try {
    return await isMatching
        ? database.rowSourcesRS_30_2Values.findMatchingRowSources()
        : database.rowSourcesRS_30_2Values.findAllRowSources();
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
  }
}

//==========================================================================================
// EVENT GET ROWSOURCE_RS_1_10_2 EVENT GET ROWSOURCE_RS_1_10_2 EVENT GET ROWSOURCE_RS_1_10_2
//==========================================================================================
Future<List<RowSources_RS_1_10_2>> eventGetRowSourceRS_1_10_2(
    AppDatabase database) async {
  try {
    return await database.rowSourcesRS_1_10_2Values.findAllRowSources();
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    ErrorCall(database, context, e.toString(), ErrorCodes.eventRevive);
  }
}

//====================================================================================
// EVENT GET ROWSOURCE_RS_12_2 EVENT GET ROWSOURCE_RS_12_2 EVENT GET ROWSOURCE_RS_12_2
//====================================================================================
Future<List<RowSources_RS_12_2>> eventGetRowSourceRS_12_2(
    AppDatabase database) async {
  try {
    return await database.rowSourcesRS_12_2Values.findAllRowSources();
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

//====================================================================================
// EVENT GET ROWSOURCE_RS_29_41_15_6 EVENT GET ROWSOURCE_RS_29_41_15_6 EVENT GET ROWSOURCE_RS_29_41_15_6
//====================================================================================
Future<List<RowSources_RS_29_41_15_6>> eventGetRowSourceRS_29_41_15_6(
    AppDatabase database) async {
  try {
    return await database.rowSourcesRS_29_41_15_6Values.findAllRowSources();
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

//====================================================================================
// EVENT INSERT ALL PAGES ROW SOURCES HERE....
//====================================================================================
Future<void> eventRowSourcesInsert(
    AppDatabase database, List<RowSources> jsonOutput_RowSources) async {
  try {
    if (jsonOutput_RowSources != null) {
      if (jsonOutput_RowSources.length > 0) {
        //loop the row sources
        for (RowSources rowSource in jsonOutput_RowSources) {
          if (rowSource.RS_1_10_2 != null) {
            await database.rowSourcesRS_1_10_2Values.deleteAllRowSources();
            for (RowSources_RS_1_10_2 value in rowSource.RS_1_10_2) {
              database.rowSourcesRS_1_10_2Values.insertRowSource(value);
            }
          }

          if (rowSource.RS_12_2 != null) {
            await database.rowSourcesRS_12_2Values.deleteAllRowSources();
            for (RowSources_RS_12_2 value in rowSource.RS_12_2) {
              database.rowSourcesRS_12_2Values.insertRowSource(value);
            }
          }
          if (rowSource.RS_29_41_15_6 != null) {
            await database.rowSourcesRS_29_41_15_6Values.deleteAllRowSources();
            for (RowSources_RS_29_41_15_6 value in rowSource.RS_29_41_15_6) {
              await database.rowSourcesRS_29_41_15_6Values
                  .insertRowSource(value);
            }
          }

          if (rowSource.RS_30_2 != null) {
            await database.rowSourcesRS_30_2Values.deleteAllRowSources();
            for (RowSources_RS_30_2 value in rowSource.RS_30_2) {
              await database.rowSourcesRS_30_2Values.insertRowSource(value);
            }
          }

          if (rowSource.RS_31_42_2_6 != null) {
            await database.rowSourcesRS_31_42_2_6Values.deleteAllRowSources();
            for (RowSources_RS_31_42_2_6 value in rowSource.RS_31_42_2_6) {
              await database.rowSourcesRS_31_42_2_6Values
                  .insertRowSource(value);
            }
          }
          // if (rowSource.RS_13_23_6_2 != null) {
          //   await database.rowSourcesRS_13_23_6_2Values.deleteAllRowSources();
          //   for (RowSources_RS_13_23_6_2 value in rowSource.RS_13_23_6_2) {
          //     await database.rowSourcesRS_13_23_6_2Values
          //         .insertRowSource(value);
          //   }
          // }
        }
      }
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    print("========###.....#####");
    print(e);
    throw e;
  }
}

Future<void> setRowSources(
    AppDatabase database, List<RowSources> jsonOutput_RowSources) async {
  try {
    if (jsonOutput_RowSources != null) {
      if (jsonOutput_RowSources.length > 0) {
        //loop the row sources
        for (RowSources rowSource in jsonOutput_RowSources) {
          if (rowSource.RS_1_10_2 != null) {
            APIConstants.rowSource_RS_1_10_2 = rowSource.RS_1_10_2;
            // await database.rowSourcesRS_1_10_2Values.deleteAllRowSources();
            // for (RowSources_RS_1_10_2 value in rowSource.RS_1_10_2) {
            //   database.rowSourcesRS_1_10_2Values.insertRowSource(value);
            // }
          }

          if (rowSource.RS_12_2 != null) {
            // await database.rowSourcesRS_12_2Values.deleteAllRowSources();
            APIConstants.rowSource_RS_12_2 = rowSource.RS_12_2;
            // for (RowSources_RS_12_2 value in rowSource.RS_12_2) {
            //   database.rowSourcesRS_12_2Values.insertRowSource(value);
            // }
          }
          if (rowSource.RS_29_41_15_6 != null) {
            APIConstants.rowSource_RS_29_41_15_6 = rowSource.RS_29_41_15_6;
            // await database.rowSourcesRS_29_41_15_6Values.deleteAllRowSources();
            // for (RowSources_RS_29_41_15_6 value in rowSource.RS_29_41_15_6) {
            //   await database.rowSourcesRS_29_41_15_6Values
            //       .insertRowSource(value);
            // }
          }

          if (rowSource.RS_30_2 != null) {
            APIConstants.rowSource_Rs_30_2 = rowSource.RS_30_2;
            // await database.rowSourcesRS_30_2Values.deleteAllRowSources();
            // for (RowSources_RS_30_2 value in rowSource.RS_30_2) {
            //   await database.rowSourcesRS_30_2Values.insertRowSource(value);
            // }
          }

          if (rowSource.RS_31_42_2_6 != null) {
            // APIConstants.rowSource_RS_
            // await database.rowSourcesRS_31_42_2_6Values.deleteAllRowSources();
            // for (RowSources_RS_31_42_2_6 value in rowSource.RS_31_42_2_6) {
            //   await database.rowSourcesRS_31_42_2_6Values
            //       .insertRowSource(value);
            // }
          }
          if (rowSource.RS_13_23_6_2 != null) {
            APIConstants.rowSource_RS_13_23_6_2 = rowSource.RS_13_23_6_2;
          }
          if (rowSource.RS_13_25_6_2 != null) {
            APIConstants.rowSource_RS_13_25_6_2 = rowSource.RS_13_25_6_2;
          }
          if (rowSource.RS_13_22_6_2 != null) {
            APIConstants.rowSource_RS_13_22_6_2 = rowSource.RS_13_22_6_2;
          }
          if(rowSource.RS_13_24_6_2 != null) {
            APIConstants.rowSource_RS_13_24_6_2 = rowSource.RS_13_24_6_2;
          }
          //   await database.rowSourcesRS_13_23_6_2Values.deleteAllRowSources();
          //   for (RowSources_RS_13_23_6_2 value in rowSource.RS_13_23_6_2) {
          //     await database.rowSourcesRS_13_23_6_2Values
          //         .insertRowSource(value);
          //   }
          // }
        }
      }
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    print("========###.....#####");
    print(e);
    throw e;
  }
}

Future<List<RowSources_RS_30_2>> postProcessingRS_30_2(
    AppDatabase database) async {
  try {
    int intDataTypeID = 0;

    int intGroup1_DataTypeID = 0;

    // Get intDataTypeID
    List<Map> list_intDataTypeID = await database.database.rawQuery(
        "SELECT TI FROM WebAppClientKeysActive WHERE (PC = 775) AND (CL = 5949)");
    // -- @conWebAppHtmlPagesRegionsControls_Organization#Header#ID#Active_Treeview_Node_My_Data_Type_ID#_(REF) = 775
    // -- @conSystemCodesTablesColumns_tblDataTypes#autoDataTypeID = 5949

    print("post processing triggered RS30_2");
    print(list_intDataTypeID);
    if (list_intDataTypeID.length > 0) {
      intDataTypeID = list_intDataTypeID.elementAt(0)['TI'];
    }

    // Get intGroup1_DataTypeID
    List<Map> list_intGroup1DataTypeID = await database.database.rawQuery(
        "SELECT intGroup1DataTypeID  FROM RowSources_RS_31_42_2_6 WHERE intDataTypeID = ${intDataTypeID}");
    // -- @conWebAppHtmlPagesRegionsControls_Organization#Header#ID#Active_Treeview_Node_My_Data_Type_ID#_(REF) = 775
    // -- @conSystemCodesTablesColumns_tblDataTypes#autoDataTypeID = 5949
    print(list_intGroup1DataTypeID);
    if (list_intGroup1DataTypeID.length > 0) {
      intGroup1_DataTypeID =
          list_intGroup1DataTypeID.elementAt(0)['intGroup1DataTypeID'];
    }

    //clear all matching items
    database.database.rawQuery("UPDATE RowSources_RS_30_2 SET blnMatching = 0");

    //machine items if intDataTypeID = 0 or same as input
    database.database.rawQuery(
        "UPDATE RowSources_RS_30_2 SET blnMatching = 1 WHERE (intDataTypeID = 0) OR (intDataTypeID = $intGroup1_DataTypeID)");

    //blnSelected to be initialized
    database.database.rawQuery(
        "UPDATE RowSources_RS_30_2 SET blnSelected = 0 WHERE (blnSelected = NULL)");

    //Clear Default - this allows a previous selected item to still be selected
    database.database.rawQuery(
        "UPDATE RowSources_RS_30_2 SET blnSelected = 0 WHERE (blnDefaultOn = 1)");

    // If within the Matching set there is not one item selected, use the blnDefaultOn item
    List<Map> listRS_30_2 = await database.database.rawQuery(
        "SELECT 1 FROM RowSources_RS_30_2 WHERE (blnMatching = 1) AND (blnSelected = 1)");

    if (listRS_30_2.length == 0) {
      await database.database.rawQuery(
          "UPDATE RowSources_RS_30_2 SET blnSelected = 1 WHERE (blnMatching = 1) AND (blnDefaultOn = 1)");
    }

    List blnMatchingList = await database.database
        .rawQuery("SELECT * FROM RowSources_RS_30_2 WHERE blnMatching = 1");
    if (blnMatchingList.length > 0) {
      return blnMatchingList.map((e) {
        return RowSources_RS_30_2.fromJson(e);
      }).toList();
    } else {
      return [];
    }
  } catch (e, stacktrace) {
    print(stacktrace.toString());
    throw e;
  }
}

Future<void> eventSelectedRS_30_2(
    AppDatabase database, int intWebAppTreeviewSortID) async {
  try {
    //De-Select all from Matching Records
    await database.database.rawQuery(
        "UPDATE RowSources_RS_30_2 SET blnSelected = 0 WHERE (blnMatching = 1)");
    //Select the one the user has requested
    await database.database.rawQuery(
        "UPDATE RowSources_RS_30_2 SET blnSelected = 1 WHERE (intWebAppTreeviewSortID = $intWebAppTreeviewSortID)");
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

Future<void> postProcessingPrci688StackPush(AppDatabase database) async {
  try {
// DJT says maybe this should all be coming from the PARENT jDT JSON CK Json OR SQL should provide Data Keys for all values - let's talk
    print("postProcessingPrci688 Triggered");
// NAMES have been changed  755_7822 -> PTIR

    // -- @conWebAppHtmlPagesRegionsControls_Organization#Header#ID#Active_Treeview_Node_Record_ID#_(REF) = 755
    //-- @conSystemCodesTablesColumns_tblWebAppTreeviewControls_19#autoWebAppTreeviewControlID = 7822
    List PTIRList = await database.database.rawQuery(
        "SELECT TI FROM WebAppClientKeysActive WHERE (PC = 755) AND (CL = 7822)");

    //-- @conWebAppHtmlPagesRegionsControls_Organization#Header#ID#PRCI#688_Stack_Child_Count#_(REF) = 784
    //-- intDataKey_SystemCodesTablesColumnID		-- -- @conSystemCodesTablesColumns_tblAaaOrphans#intChildrenCountForStack = 10349
    List CCTList = await database.database.rawQuery(
        "SELECT TI FROM WebAppClientKeysActive WHERE (PC = 784) AND (CL = 10349)");

// int775_5949 -> DTID
    //-- @conWebAppHtmlPagesRegionsControls_Organization#Header#ID#Active_Treeview_Node_My_Data_Type_ID#_(REF) = 775
    //-- @conSystemCodesTablesColumns_tblDataTypes#autoDataTypeID = 5949
    List DTIDList = await database.database.rawQuery(
        "SELECT TI FROM WebAppClientKeysActive WHERE (PC = 775) AND (CL = 5949)");

    if (PTIRList.length > 0 && DTIDList.length > 0 && CCTList.length > 0) {
      final PFKString =
          "PG_33_PRCI_688_${PTIRList.elementAt(0)['TI'].toString()}";
      final dateTimeNow = DateTime.now();
      await database.database.rawQuery(
          "INSERT INTO Prci688Stack(PTIR,DTID,PFK,DATE,CCT) VALUES (${PTIRList.elementAt(0)['TI']}, ${DTIDList.elementAt(0)['TI']}, '${PFKString}','${dateTimeNow}',${CCTList.elementAt(0)['TI']})");
    }
  } catch (e, stacktrace) {
    print('Exception: ' + e.toString());
    print('Stacktrace: ' + stacktrace.toString());
    throw e;
  }
}

// ERROR CALL API
Future<void> ErrorCall(database, context, message, errorCode,
    {bool blnshowToast}) async {
  if (blnshowToast != null) {
    GlobalState.errorCallMsgShown = true;
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text("Something went wrong. Please try again later."),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                // await eventBack(appDatabase, context, GlobalState.PI);
              },
            ),
            // FlatButton(
            //   child: Text("CANCEL"),
            //   onPressed: () async {
            //     // Navigator.of(context).pop();
            //     // if (Navigator.canPop(dialogContext)) {
            //     Navigator.of(dialogContext).pop();
            //     // }
            //   },
            // )
          ],
        );
      },
    );
  } else {
    GlobalState.errorCallMsgShown = false;
  }
  var previousAPIResponse = APIConstants.responseBody;
  if (previousAPIResponse != null) {
    Map<String, dynamic> bodyData = {
      'CrmUserID': await Preference.getItem("userID"),
      'DataKeys':
          jsonEncode(previousAPIResponse.jsonOutput_WebAppClientDataKeys)
              .toString(),
      'MmlAccountID': await Preference.getItem("MmlAccountID"),
      'WebAppSessionID': await Preference.getItem('WebAppSessionID'),
      'IsMobile': true,
      'EventId': 203,
      "ErrorCode": errorCode ?? 623,
      "Error": message,
    };
    await ApiBaseHelper().post(
        APIConstants.SEND_ERROR_CODE, jsonEncode(bodyData).toString(), context);
  }
}

Future<String> eventNetworkURLCheck(database, context, {URL, sasToken}) async {
  print(URL + sasToken);
  try {
    final response = await http.get(URL + sasToken);
    if (response.statusCode != 200) {
      ErrorCall(database, context, "${response.body.toString()}", 623);
    }
  } catch (e) {
    ErrorCall(database, context, e.toString(), 623);
  }
  return URL;
}

//EVENT LOGOUT
Future<void> eventLogout(BuildContext context) async {
  var getLogout = new List.from([
    new Rkeys(P: 0, C: 1239, I: 1, U: true),
    new Rkeys(P: 0, C: 1136, I: 3, U: true)
  ]);

  var body = jsonEncode(<String, dynamic>{
    'CrmUserID': await Preference.getItem("userID"),
    'MmlAccountID': await Preference.getItem("MmlAccountID"),
    'WebAppSessionID': await Preference.getItem("WebAppSessionID"),
    'ActiveDataKeys': jsonEncode(getLogout),
  });

  await ApiBaseHelper().post(APIConstants.GET_LOGOUT_DETAILS, body, context);
  Preference.removeKey('IsLoggedIn');
  Preference.clearAll();
  GlobalState.PI = 0;
  GlobalState.PRI = 0;
  APIConstants.initialize();
  return pushNewScreen(
    context,
    screen: SplashScreen(),
    withNavBar: false, // OPTIONAL VALUE. True by default.
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}

void evictImage(String url) {
  final NetworkImage provider = NetworkImage(url);
  provider.evict().then<void>((bool success) {
    if (success) debugPrint('removed image!');
  });
}

Future<http.Response> networkURLResponse(String URL) async {
  try {
    print("networkURLResponse");
    GlobalState.pageDataLoaded = false;
    String sasToken = await Preference.getItem('SAS_Token');
    final url = URL + sasToken;
    final responseAPI = await http.get((url));
    GlobalState.pageDataLoaded = true;
    return responseAPI;
  } catch (e) {
    throw (e);
  }
}

// Future<void> gotoPage(AppDatabase database, PIandPRI valueOfPIandPRI,
//     BuildContext context) async {
//   try {
//     print("============================================================");
//     print("==============GO TO PAGE====================================");
//     print("============================================================");
//     print(valueOfPIandPRI.toString());
//
//     //get the previous page PI from previous assign global state
//     final int previousPagePI = GlobalState.PI;
//
//     // now assign the GOTO page PI and PRI into global state
//     GlobalState.PI = valueOfPIandPRI.PI;
//     GlobalState.PRI = valueOfPIandPRI.PRI;
//
//     if (valueOfPIandPRI.PI == null && valueOfPIandPRI.PRI == null) {
//       return pushNewScreen(
//         context,
//         screen: NavigationCalls(),
//         withNavBar: false, // OPTIONAL VALUE. True by default.
//         pageTransitionAnimation: (GlobalState.eventMethod == 'eventBack'
//             ? PageTransitionAnimation.slideRight
//             : PageTransitionAnimation.cupertino),
//       );
//     }
//     // // check previous page already load bottom navigation bar
//     if (isBottomBarPage(previousPagePI) &&
//         isBottomBarPage(valueOfPIandPRI.PI)) {
//       return false;
//     }
//
//     String routeName =
//         GlobalConfiguration().get(GlobalState.PI.toString()) ?? 'comingSoon';
//
//     if (GlobalState.eventMethod == "eventBack") {
//
//
//     } else if (GlobalState.eventMethod == 'eventRevive') {
//       Navigator.pop(context);
//       if (!isBottomBarPage(GlobalState.PI)) {
//         pushNewScreen(
//           context,
//           screen: NavigationCalls(page: getPage(database,routeName,context)),
//           withNavBar: false, // OPTIONAL VALUE. True by default.
//           pageTransitionAnimation: (GlobalState.eventMethod == 'eventBack'
//               ? PageTransitionAnimation.slideRight
//               : PageTransitionAnimation.cupertino),
//         );
//         return;
//       }else{
//         pushNewScreen(
//           context,
//           screen: NavigationCalls(),
//           withNavBar: false, // OPTIONAL VALUE. True by default.
//           pageTransitionAnimation: (GlobalState.eventMethod == 'eventBack'
//               ? PageTransitionAnimation.slideRight
//               : PageTransitionAnimation.cupertino),
//         );
//         return;
//       }
//     }
//
//     // or it is no need of bottom navigation screen directly go to particular page
//     return navigationToNewPage(database, routeName, context);
//   } catch (e, stacktrace) {
//     print(stacktrace.toString());
//     throw e;
//   }
// }
//
//
getPage(database, routeName, context) {
  print(routeName);
  var cls = null;
  bool navBar = true;
  int selectedIndex = 0;
  switch (routeName) {
    case "/screens/LoginScreen":
      cls = LoginScreenV();
      break;
    case "/screens/HomeScreen":
      cls = NavigationCalls();
      break;
    case "/screens/SplashScreen":
      cls = SplashScreen();
      break;
    case '/screens/navigation/home/Settings':
      cls = SettingsTabScreen();
      selectedIndex = 0;
      break;
    case '/screens/navigation/settings/ChangePassword':
      cls = ChangePassword();
      selectedIndex = 0;
      break;
    case '/screens/navigation/settings/Notification':
      cls = NotificationSettings();
      selectedIndex = 0;
      break;
    case '/screens/navigation/settings/About':
      cls = About();
      selectedIndex = 0;
      break;
    case '/screens/navigation/settings/Debug':
      cls = Debug();
      selectedIndex = 0;
      break;
    case '/screens/navigation/organization/core/Things':
      cls = ThingScreen();
      selectedIndex = 3;
      break;
    case '/screens/navigation/organization/core/locations':
      cls = LocationScreen();
      selectedIndex = 3;

      break;
    case '/screens/navigation/organization/core/companies':
      cls = CompanyScreen();
      selectedIndex = 3;
      break;
    case '/screens/navigation/organization/core/places':
      cls = SiteScreen();
      selectedIndex = 3;
      break;
    case '/screens/navigation/organization/core/users':
      cls = UserScreen();
      selectedIndex = 3;
      break;
    case '/screens/navigation/organization/core/account':
      cls = AccountScreen();
      selectedIndex = 3;
      break;
    case '/customwidgets/ImageView':
      cls = ImageView();

      navBar = false;
      break;
    case '/screens/navigation/organization/core/ThingsEdit':
      cls = ThingsEdit();
      selectedIndex = 3;
      break;
    case '/screens/navigation/organization/core/ThingsImageEdit':
      cls = ThingsImageEdit();
      selectedIndex = 3;

      break;
    case '/customwidgets/EditMedia':
      cls = ImageViewEdit();
      navBar = false;
      break;
    case '/screens/navigation/organization/core/VideoTrimmer':
      cls = EditVideo();
      navBar = false;
      break;
    case '/screens/navigation/organization/core/ThingContentEdit':
      cls = ThingDescriptionEdit();
      selectedIndex = 3;
      break;
    case '/screens/navigation/organization/core/AccountEdit':
      cls = AccountEdit();
      selectedIndex = 3;
      break;
    case '/screens/navigation/organization/core/AccountDescriptionEdit':
      cls = AccountDescriptionEdit();
      selectedIndex = 3;
      break;
    case '/screens/navigation/organization/core/companyEdit':
      cls = CompanyEdit();
      break;
    case '/screens/navigation/organization/core/userEdit':
      cls = UserEdit();
      break;
    case '/screens/navigation/organization/core/placeEdit':
      cls = PlaceEdit();
      break;
    case '/screens/navigation/organization/core/locationEdit':
      cls = LocationEdit();
      break;
    case "/screens/navigation/organization/core/placeDescriptionEdit":
      cls = SiteDescriptionEdit();
      break;
    case "/screens/navigation/organization/core/SiteAddressList":
      cls = SiteAddressList();
      break;
    case "/screens/navigation/organization/core/SiteAddressEdit":
      cls = SiteAddressEdit();
      break;
    case '/screens/navigation/organization/core/CompanyDescriptionEdit':
      cls = CompanyDescriptionEdit();
      selectedIndex = 3;
      break;
    case '/screens/navigation/organization/core/UserDescriptionEdit':
      cls = UserDescriptionEdit();
      selectedIndex = 3;
      break;
    case 'comingSoon':
      cls = NavigationCalls();

      break;
    default:
      cls = null;
      break;
  }

  return {"class": cls, "navBar": navBar, "selectedIndex": selectedIndex};
}

getStatusIcon(statusID) {
  switch (statusID) {
    case 1:
      return 1772.toString();
    case 2:
      return 1782.toString();
    case 3:
      return 1790.toString();
  }
}
