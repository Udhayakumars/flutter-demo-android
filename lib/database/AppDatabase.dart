// database.dart

// required package imports

import 'package:MMLMobile/databasedaos/Prci688StackDao.dart';
import 'package:MMLMobile/databasedaos/RKDao.dart';
import 'package:MMLMobile/databasedaos/RowSourcesDao.dart';
import 'package:MMLMobile/databasedaos/RowSources_RS_12_2Dao.dart';
import 'package:MMLMobile/databasedaos/RowSources_RS_13_23_6_2Dao.dart';
import 'package:MMLMobile/databasedaos/RowSources_RS_1_10_2Dao.dart';
import 'package:MMLMobile/databasedaos/RowSources_RS_29_41_15_6Dao.dart';
import 'package:MMLMobile/databasedaos/RowSources_RS_30_2Dao.dart';
import 'package:MMLMobile/databasedaos/RowSources_RS_31_42_2_6Dao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientDataKeyDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientDataDao.dart';
import 'package:MMLMobile/databasedaos/StandardHeaderModelDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientKeysCacheDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientKeysFromSqlDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientKeysActiveDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientKeysPageReturnDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientKeysPageTabDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientKeysRequestKeysDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientKeysRequestKeysInitiallyDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientKeysTemporaryDao.dart';
import 'package:MMLMobile/databasedaos/WebAppClientKeysToSqlDao.dart';
import 'package:MMLMobile/databasemodels/Prci688Stack.dart';

import 'package:MMLMobile/databasemodels/RK.dart';
import 'package:MMLMobile/databasemodels/RowSources.dart';
import 'package:MMLMobile/databasemodels/RowSources_30_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_12_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_13_23_6_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_1_10_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_29_41_15_6.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_31_42_2_6.dart';
import 'package:MMLMobile/databasemodels/WebAppClientDataKeys.dart';
import 'package:MMLMobile/databasemodels/WebAppClientData.dart';
import 'package:MMLMobile/databasemodels/StandardHeader.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysCache.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysFromSql.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysActive.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysPageReturn.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysPageTab.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysRequestKeys.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysRequestKeysInitially.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysTemporary.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysToSql.dart';
import 'package:MMLMobile/utils/DateTimeConverter.dart';
import 'package:floor/floor.dart';

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'AppDatabase.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [
  WebAppClientData,
  StandardHeader,
  WebAppClientDataKeys,
  WebAppClientKeysFromSql,
  WebAppClientKeysActive,
  WebAppClientKeysCache,
  WebAppClientKeysToSql,
  WebAppClientKeysRequestKeys,
  WebAppClientKeysRequestKeysInitially,
  WebAppClientKeysTemporary,
  WebAppClientKeysPageTab,
  WebAppClientKeysPageReturn,
  RowSources,
  RowSources_RS_1_10_2,
  RowSources_RS_12_2,
  RowSources_RS_29_41_15_6,
  RowSources_RS_30_2,
  RowSources_RS_31_42_2_6,
  RowSources_RS_13_23_6_2,
  RK,
  Prci688Stack,

])
abstract class AppDatabase extends FloorDatabase {
  WebAppClientDataDao get navigationObject;
  StandardHeaderModelDao get standardHeader;
  WebAppClientDataKeyDao get webAppClientDataKeys;
  WebAppClientKeysRequestKeysDao get webAppClientKeysRequestKeys;
  WebAppClientKeysRequestKeysInitiallyDao
      get webAppClientKeysRequestKeysInitially;
  WebAppClientKeysActiveDao get webAppClientKeysActive;
  WebAppClientKeysCacheDao get webAppClientKeysCache;
  WebAppClientKeysToSqlDao get webAppClientKeysToSql;
  WebAppClientKeysFromSqlDao get webAppClientKeysFromSql;
  WebAppClientKeysTemporaryDao get webAppClientKeysTemporary;
  WebAppClientKeysPageTabDao get webAppClientKeysPageTab;
  WebAppClientKeysPageReturnDao get webAppClientKeysPageReturn;
  RKDao get rkValues;
  RowSourcesDao get rowSourcesValues;
  RowSources_RS_12_2Dao get rowSourcesRS_12_2Values;
  RowSources_RS_1_10_2Dao get rowSourcesRS_1_10_2Values;
  RowSources_RS_29_41_15_6Dao get rowSourcesRS_29_41_15_6Values;
  RowSources_RS_30_2Dao get rowSourcesRS_30_2Values;
  RowSources_RS_13_23_6_2Dao get rowSourcesRS_13_23_6_2Values;
  RowSources_RS_31_42_2_6Dao get rowSourcesRS_31_42_2_6Values;
  Prci688StackDao get prci688StackValues;

}
