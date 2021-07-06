import 'package:MMLMobile/databasemodels/RowSourceDropdown.dart';
import 'package:MMLMobile/databasemodels/RowSources_30_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_12_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_13_23_6_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_1_10_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_29_41_15_6.dart';
import 'package:MMLMobile/models/PageDirectionObject.dart';
import 'package:MMLMobile/models/RequestKeys.dart';
import 'package:MMLMobile/models/NavigationObject.dart';
import 'package:MMLMobile/models/ResponseBody.dart';
import 'package:MMLMobile/models/RowSources.dart';
import 'package:MMLMobile/models/organization/PI_33_PRI_130_PRCI_688_Children.dart';
import 'package:MMLMobile/models/organization/PI_33_PRI_130_PRCI_688_Parent.dart';
import 'package:MMLMobile/models/organization/PI_33_PRI_130_PRCI_688_TreePath.dart';
import 'package:MMLMobile/models/organization/PI_85_PRI_203_PRCI_815_Items.dart';
import 'package:MMLMobile/models/organization/PI_86_PRI_204_PRCI_816_Items.dart';
import 'package:MMLMobile/models/organization/PI_87_PRI_205_PRCI_817_Items.dart';
import 'package:MMLMobile/models/organization/PI_88_PRI_206_PRCI_818_Items.dart';
import 'package:MMLMobile/models/organization/PI_89_PRI_207_PRCI_785_Items.dart';
import 'package:MMLMobile/models/organization/PI_90_PRI_208_PRCI_819_Items.dart';
import 'package:MMLMobile/models/organization/PI_92_PRI_210_PRCI_787_Items.dart';
import 'package:MMLMobile/models/organization/PI_94_PRI_212_PRCI_796_Items.dart';
import 'package:MMLMobile/models/organization/PI_95_PRI_213_PRCI_805_Items.dart';
import 'package:MMLMobile/models/organization/PI_97_PRI_215_PRCI_807_Items.dart';
import 'package:MMLMobile/models/organization/PI_99_PRI_217_PRCI_821_Items.dart';
import 'package:MMLMobile/models/organization/PRCI_786_Items.dart';
import 'package:MMLMobile/models/organization/ThingsPageTextItems.dart';
import 'package:MMLMobile/models/recents/PI_30_PRI_127_PRCI_656_Items.dart';
import 'package:MMLMobile/models/settings/PI_30_PRI_187_PRCI_716_Items.dart';
import 'package:http/http.dart';

const String ENV_FILE = "assets/env/.env_staging";
const String APP_NAME = "MML";
const String BASE_URL =
    "http://mymaintenancelibraryservicesit.azurewebsites.net/api/Account/Login";
const String BASE_LOGIN = "/api/Account/Login";
const String GET_LOGIN_DETAILS = "/api/Account/GetLoginJson";
const String GET_LOGOUT_DETAILS = "/api/Account/GetLogoutJson";
const String SEND_ERROR_CODE = "/api/Account/SendErrorCode";
const String GET_FORGOT_DETAILS = "/api/Account/SendActivateMail";
const String POST_REFERSH = "/api/Account/NodeClick";
const String GET_SAS_TOKEN = "/api/Equipment/GetSasToken?Container=";
const String UPLOAD_FILE = "/api/Equipment/UploadMobileFiles";

ResponseBody responseBody;

List<RowSources_RS_12_2> rowSource_RS_12_2;
List<RowSources_RS_1_10_2> rowSource_RS_1_10_2;
List<RowSources_RS_29_41_15_6> rowSource_RS_29_41_15_6;
List<RowSources_RS_30_2> rowSource_Rs_30_2;
List<RowsourceDropDown> rowSource_RS_13_23_6_2;
List<RowsourceDropDown> rowSource_RS_13_25_6_2;
List<RowsourceDropDown> rowSource_RS_13_22_6_2;
List<RowsourceDropDown> rowSource_RS_13_24_6_2;

//RecentTab Items
NavigationObject pi_30_PRI_127_PRCI_680_Text;
NavigationObject pi_30_PRI_127_PRCI_679_Image;
String pi_30_PRI_127_PRCI_711_RefreshTime;

String sasToken;

// organization items
String pi_33_PRI_130_PRCI_714_RefreshTime;
List<PI_30_PRI_127_PRCI_656_Items> pi_30_PRI_127_PRCI_656_Items;

List<PI_33_PRI_130_PRCI_688_Children> pi_33_PRI_130_PRCI_688_Children;

PI_33_PRI_130_PRCI_688_Parent pi_33_PRI_130_PRCI_688_Parent;

List<PI_33_PRI_130_PRCI_688_TreePath> pi_33_PRI_130_PRCI_688_TreePath;

RequestKeys pi_33_PRI_130_PRCI_772_NodeKey;

//Settings Items
List<PI_30_PRI_187_PRCI_716_Items> pi_30_PRI_187_PRCI_716_Items;

//Things Items
List<PI_89_PRI_207_PRCI_785_Items> pi_89_PRI_207_PRCI_785_Items;
List<PRCI_786_Items> page_PRCI_786_Items;
List<PI_92_PRI_210_PRCI_787_Items> pi_92_PRI_210_PRCI_787_Items;
List<ThingsPageTextItems> pi_93_PRI_211_PRCI_788_Items;
List<PI_94_PRI_212_PRCI_796_Items> pi_94_PRI_212_PRCI_796_Items;
List<PI_95_PRI_213_PRCI_805_Items> pi_95_PRI_213_PRCI_805_Items;
List<PI_97_PRI_215_PRCI_807_Items> pi_97_PRI_215_PRCI_807_Items;

//Accounts Items
List<PI_85_PRI_203_PRCI_815_Items> pi_85_PRI_203_PRCI_815_Items;
List<PI_99_PRI_217_PRCI_821_Items> pi_99_PRI_217_PRCI_821_Items;

//companies Items
List<PI_86_PRI_204_PRCI_816_Items> pi_86_PRI_204_PRCI_816_Items;

dynamic pi_95_PRI_213_PRCI_805_ImageResponse;

List filmStripImages;
List uploadingfilmStripImages;

//Users Items
List<PI_88_PRI_206_PRCI_818_Items> pi_88_PRI_206_PRCI_818_Items;

//Locations Items
List<PI_90_PRI_208_PRCI_819_Items> pi_90_PRI_208_PRCI_819_Items;

//Places Items
List<PI_87_PRI_205_PRCI_817_Items> pi_87_PRI_205_PRCI_817_Items;

//Companies Items
List<PageDirectionObject> companiesItems;

//back button events track
int backPI;
int backPRI;

int maximumCacheCountTreeView = 20;

// List<PI_33_PRCI_688_Children_Object> pi_33_PRCI_688_Children = [];
//
// PageDirectionObject pi_33_PRCI_688_Parent;
//
// List pi_33_PRCI_688_TreePath;
// RequestKeys pi_33_PRCI_772;

void initialize() {
  responseBody = null;

  rowSource_RS_12_2 = [];
  rowSource_RS_1_10_2 = [];
  rowSource_RS_29_41_15_6 = [];
  rowSource_Rs_30_2 = [];
  rowSource_RS_13_23_6_2 = [];
  rowSource_RS_13_25_6_2 = [];
  rowSource_RS_13_22_6_2 = [];
  rowSource_RS_13_24_6_2 = [];

//RecentTab Items
  pi_30_PRI_127_PRCI_680_Text = null;
  pi_30_PRI_127_PRCI_679_Image = null;
  pi_30_PRI_127_PRCI_711_RefreshTime = "";
  sasToken = "";
  pi_30_PRI_127_PRCI_656_Items = [];

  pi_33_PRI_130_PRCI_714_RefreshTime = "";

  pi_33_PRI_130_PRCI_688_Children = [];

  pi_33_PRI_130_PRCI_688_Parent;

  pi_33_PRI_130_PRCI_688_TreePath = [];
  pi_33_PRI_130_PRCI_772_NodeKey = null;

//Settings Items
  pi_30_PRI_187_PRCI_716_Items = [];

//Things Items
  pi_89_PRI_207_PRCI_785_Items = [];
  page_PRCI_786_Items = [];
  pi_92_PRI_210_PRCI_787_Items = [];
  pi_93_PRI_211_PRCI_788_Items = [];
  pi_94_PRI_212_PRCI_796_Items = [];
  pi_95_PRI_213_PRCI_805_Items = [];
  pi_97_PRI_215_PRCI_807_Items = [];
  pi_95_PRI_213_PRCI_805_ImageResponse;

  filmStripImages = [];
  uploadingfilmStripImages = [];

  //Account Items
  pi_85_PRI_203_PRCI_815_Items = [];
  pi_99_PRI_217_PRCI_821_Items = [];

//Users Items
  pi_88_PRI_206_PRCI_818_Items = [];

//Locations Items
  pi_90_PRI_208_PRCI_819_Items = [];

//Places Items
  pi_87_PRI_205_PRCI_817_Items = [];

//Companies Items
  pi_86_PRI_204_PRCI_816_Items = [];
}
