// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WebAppClientDataDao _navigationObjectInstance;

  StandardHeaderModelDao _standardHeaderInstance;

  WebAppClientDataKeyDao _webAppClientDataKeysInstance;

  WebAppClientKeysRequestKeysDao _webAppClientKeysRequestKeysInstance;

  WebAppClientKeysRequestKeysInitiallyDao
      _webAppClientKeysRequestKeysInitiallyInstance;

  WebAppClientKeysActiveDao _webAppClientKeysActiveInstance;

  WebAppClientKeysCacheDao _webAppClientKeysCacheInstance;

  WebAppClientKeysToSqlDao _webAppClientKeysToSqlInstance;

  WebAppClientKeysFromSqlDao _webAppClientKeysFromSqlInstance;

  WebAppClientKeysTemporaryDao _webAppClientKeysTemporaryInstance;

  WebAppClientKeysPageTabDao _webAppClientKeysPageTabInstance;

  WebAppClientKeysPageReturnDao _webAppClientKeysPageReturnInstance;

  RKDao _rkValuesInstance;

  RowSourcesDao _rowSourcesValuesInstance;

  RowSources_RS_12_2Dao _rowSourcesRS_12_2ValuesInstance;

  RowSources_RS_1_10_2Dao _rowSourcesRS_1_10_2ValuesInstance;

  RowSources_RS_29_41_15_6Dao _rowSourcesRS_29_41_15_6ValuesInstance;

  RowSources_RS_30_2Dao _rowSourcesRS_30_2ValuesInstance;

  RowSources_RS_13_23_6_2Dao _rowSourcesRS_13_23_6_2ValuesInstance;

  RowSources_RS_31_42_2_6Dao _rowSourcesRS_31_42_2_6ValuesInstance;

  Prci688StackDao _prci688StackValuesInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WebAppClientData` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `PI` INTEGER, `PRI` INTEGER, `RI` INTEGER, `PRCI` INTEGER, `CI` INTEGER, `SV` INTEGER, `DC` INTEGER, `D1` INTEGER, `CNV` INTEGER, `CNR` INTEGER, `ND` INTEGER, `ARR` INTEGER, `BH` INTEGER, `LF` INTEGER, `RK_PI` INTEGER, `RK_PTI` INTEGER, `RKP` INTEGER, `TRK` TEXT, `GT` INTEGER, `UPX` INTEGER, `RSS` TEXT, `RDI` INTEGER, `RFE` INTEGER, `RFM` INTEGER, `RLL` INTEGER, `TEMI` INTEGER, `X1` INTEGER, `EI` INTEGER, `ETI` INTEGER, `ED` TEXT, `EM1` INTEGER, `EM2` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `StandardHeader` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `VER` TEXT, `ER_ID` INTEGER, `ER` TEXT, `RS_ID` INTEGER, `RS` TEXT, `M1` TEXT, `M2` TEXT, `OK2X` INTEGER, `SD` INTEGER, `BG` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WebAppClientDataKeys` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `TY` INTEGER, `PC` INTEGER, `CL` INTEGER, `TI` INTEGER, `UI` INTEGER, `RF` INTEGER, `SV` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WebAppClientKeysFromSql` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `TY` INTEGER, `PC` INTEGER, `CL` INTEGER, `TI` INTEGER, `UI` INTEGER, `RF` INTEGER, `SV` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WebAppClientKeysActive` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `TY` INTEGER, `PC` INTEGER, `CL` INTEGER, `TI` INTEGER, `UI` INTEGER, `RF` INTEGER, `SV` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WebAppClientKeysCache` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `TY` INTEGER, `PC` INTEGER, `CL` INTEGER, `TI` INTEGER, `UI` INTEGER, `RF` INTEGER, `SV` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WebAppClientKeysToSql` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `TY` INTEGER, `PC` INTEGER, `CL` INTEGER, `TI` INTEGER, `UI` INTEGER, `RF` INTEGER, `SV` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WebAppClientKeysRequestKeys` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `TY` INTEGER, `PC` INTEGER, `CL` INTEGER, `TI` INTEGER, `UI` INTEGER, `RF` INTEGER, `SV` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WebAppClientKeysRequestKeysInitially` (`RequestKeysInitiallyID` INTEGER PRIMARY KEY AUTOINCREMENT, `TY` INTEGER, `PC` INTEGER, `CL` INTEGER, `TI` INTEGER, `UI` INTEGER, `RF` INTEGER, `SV` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WebAppClientKeysTemporary` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `TY` INTEGER, `PC` INTEGER, `CL` INTEGER, `TI` INTEGER, `UI` INTEGER, `RF` INTEGER, `SV` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WebAppClientKeysPageTab` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `TY` INTEGER, `PC` INTEGER, `CL` INTEGER, `TI` INTEGER, `UI` INTEGER, `RF` INTEGER, `SV` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WebAppClientKeysPageReturn` (`PageReturnID` INTEGER PRIMARY KEY AUTOINCREMENT, `PI_CHILD` INTEGER, `TY` INTEGER, `PC` INTEGER, `CL` INTEGER, `TI` INTEGER, `UI` INTEGER, `RF` INTEGER, `SV` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RowSources` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `KeyValue` TEXT, `I` INTEGER, `D` TEXT, `IA` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RowSources_RS_1_10_2` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `I` INTEGER, `RK` TEXT, `IA` TEXT, `D` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RowSources_RS_12_2` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `I` INTEGER, `D` TEXT, `S1` TEXT, `B1` INTEGER, `B2` INTEGER, `B3` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RowSources_RS_29_41_15_6` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `I` INTEGER, `RK` TEXT, `D` TEXT, `S1` TEXT, `I1` INTEGER, `I2` INTEGER, `I3` INTEGER, `I4` INTEGER, `B1` INTEGER, `B2` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RowSources_RS_30_2` (`intWebAppTreeviewSortID` INTEGER PRIMARY KEY AUTOINCREMENT, `strRowSource` TEXT, `intDataTypeID` INTEGER, `intIndex1` INTEGER, `blnDefaultOn` INTEGER, `blnSelected` INTEGER, `blnMatching` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RowSources_RS_31_42_2_6` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `intDataTypeID` INTEGER, `intGroup1DataTypeID` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RowSources_RS_13_23_6_2` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `i` INTEGER, `d` TEXT, `iA` TEXT, `rK` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RK` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `rowsource_id` INTEGER, `P` INTEGER, `C` INTEGER, `I` INTEGER, `U` INTEGER, FOREIGN KEY (`rowsource_id`) REFERENCES `RowSources` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Prci688Stack` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `PTIR` INTEGER, `DTID` INTEGER, `PFK` TEXT, `DATE` INTEGER, `CCT` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WebAppClientDataDao get navigationObject {
    return _navigationObjectInstance ??=
        _$WebAppClientDataDao(database, changeListener);
  }

  @override
  StandardHeaderModelDao get standardHeader {
    return _standardHeaderInstance ??=
        _$StandardHeaderModelDao(database, changeListener);
  }

  @override
  WebAppClientDataKeyDao get webAppClientDataKeys {
    return _webAppClientDataKeysInstance ??=
        _$WebAppClientDataKeyDao(database, changeListener);
  }

  @override
  WebAppClientKeysRequestKeysDao get webAppClientKeysRequestKeys {
    return _webAppClientKeysRequestKeysInstance ??=
        _$WebAppClientKeysRequestKeysDao(database, changeListener);
  }

  @override
  WebAppClientKeysRequestKeysInitiallyDao
      get webAppClientKeysRequestKeysInitially {
    return _webAppClientKeysRequestKeysInitiallyInstance ??=
        _$WebAppClientKeysRequestKeysInitiallyDao(database, changeListener);
  }

  @override
  WebAppClientKeysActiveDao get webAppClientKeysActive {
    return _webAppClientKeysActiveInstance ??=
        _$WebAppClientKeysActiveDao(database, changeListener);
  }

  @override
  WebAppClientKeysCacheDao get webAppClientKeysCache {
    return _webAppClientKeysCacheInstance ??=
        _$WebAppClientKeysCacheDao(database, changeListener);
  }

  @override
  WebAppClientKeysToSqlDao get webAppClientKeysToSql {
    return _webAppClientKeysToSqlInstance ??=
        _$WebAppClientKeysToSqlDao(database, changeListener);
  }

  @override
  WebAppClientKeysFromSqlDao get webAppClientKeysFromSql {
    return _webAppClientKeysFromSqlInstance ??=
        _$WebAppClientKeysFromSqlDao(database, changeListener);
  }

  @override
  WebAppClientKeysTemporaryDao get webAppClientKeysTemporary {
    return _webAppClientKeysTemporaryInstance ??=
        _$WebAppClientKeysTemporaryDao(database, changeListener);
  }

  @override
  WebAppClientKeysPageTabDao get webAppClientKeysPageTab {
    return _webAppClientKeysPageTabInstance ??=
        _$WebAppClientKeysPageTabDao(database, changeListener);
  }

  @override
  WebAppClientKeysPageReturnDao get webAppClientKeysPageReturn {
    return _webAppClientKeysPageReturnInstance ??=
        _$WebAppClientKeysPageReturnDao(database, changeListener);
  }

  @override
  RKDao get rkValues {
    return _rkValuesInstance ??= _$RKDao(database, changeListener);
  }

  @override
  RowSourcesDao get rowSourcesValues {
    return _rowSourcesValuesInstance ??=
        _$RowSourcesDao(database, changeListener);
  }

  @override
  RowSources_RS_12_2Dao get rowSourcesRS_12_2Values {
    return _rowSourcesRS_12_2ValuesInstance ??=
        _$RowSources_RS_12_2Dao(database, changeListener);
  }

  @override
  RowSources_RS_1_10_2Dao get rowSourcesRS_1_10_2Values {
    return _rowSourcesRS_1_10_2ValuesInstance ??=
        _$RowSources_RS_1_10_2Dao(database, changeListener);
  }

  @override
  RowSources_RS_29_41_15_6Dao get rowSourcesRS_29_41_15_6Values {
    return _rowSourcesRS_29_41_15_6ValuesInstance ??=
        _$RowSources_RS_29_41_15_6Dao(database, changeListener);
  }

  @override
  RowSources_RS_30_2Dao get rowSourcesRS_30_2Values {
    return _rowSourcesRS_30_2ValuesInstance ??=
        _$RowSources_RS_30_2Dao(database, changeListener);
  }

  @override
  RowSources_RS_13_23_6_2Dao get rowSourcesRS_13_23_6_2Values {
    return _rowSourcesRS_13_23_6_2ValuesInstance ??=
        _$RowSources_RS_13_23_6_2Dao(database, changeListener);
  }

  @override
  RowSources_RS_31_42_2_6Dao get rowSourcesRS_31_42_2_6Values {
    return _rowSourcesRS_31_42_2_6ValuesInstance ??=
        _$RowSources_RS_31_42_2_6Dao(database, changeListener);
  }

  @override
  Prci688StackDao get prci688StackValues {
    return _prci688StackValuesInstance ??=
        _$Prci688StackDao(database, changeListener);
  }
}

class _$WebAppClientDataDao extends WebAppClientDataDao {
  _$WebAppClientDataDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _webAppClientDataInsertionAdapter = InsertionAdapter(
            database,
            'WebAppClientData',
            (WebAppClientData item) => <String, dynamic>{
                  'id': item.id,
                  'PI': item.PI,
                  'PRI': item.PRI,
                  'RI': item.RI,
                  'PRCI': item.PRCI,
                  'CI': item.CI,
                  'SV': item.SV == null ? null : (item.SV ? 1 : 0),
                  'DC': item.DC,
                  'D1': _dateTimeConverter.encode(item.D1),
                  'CNV': item.CNV == null ? null : (item.CNV ? 1 : 0),
                  'CNR': item.CNR == null ? null : (item.CNR ? 1 : 0),
                  'ND': item.ND == null ? null : (item.ND ? 1 : 0),
                  'ARR': item.ARR == null ? null : (item.ARR ? 1 : 0),
                  'BH': item.BH,
                  'LF': item.LF,
                  'RK_PI': item.RK_PI,
                  'RK_PTI': item.RK_PTI,
                  'RKP': item.RKP,
                  'TRK': item.TRK,
                  'GT': item.GT,
                  'UPX': item.UPX,
                  'RSS': item.RSS,
                  'RDI': item.RDI,
                  'RFE': item.RFE,
                  'RFM': item.RFM,
                  'RLL': item.RLL == null ? null : (item.RLL ? 1 : 0),
                  'TEMI': item.TEMI,
                  'X1': item.X1,
                  'EI': item.EI,
                  'ETI': item.ETI,
                  'ED': item.ED,
                  'EM1': item.EM1 == null ? null : (item.EM1 ? 1 : 0),
                  'EM2': item.EM2 == null ? null : (item.EM2 ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WebAppClientData> _webAppClientDataInsertionAdapter;

  @override
  Future<List<WebAppClientData>> findAllWebAppClientData() async {
    return _queryAdapter.queryList('SELECT * FROM WebAppClientData',
        mapper: (Map<String, dynamic> row) => WebAppClientData(
            id: row['id'] as int,
            PI: row['PI'] as int,
            PRI: row['PRI'] as int,
            RI: row['RI'] as int,
            PRCI: row['PRCI'] as int,
            CI: row['CI'] as int,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0,
            DC: row['DC'] as int,
            D1: _dateTimeConverter.decode(row['D1'] as int),
            CNV: row['CNV'] == null ? null : (row['CNV'] as int) != 0,
            CNR: row['CNR'] == null ? null : (row['CNR'] as int) != 0,
            RSS: row['RSS'] as String,
            RLL: row['RLL'] == null ? null : (row['RLL'] as int) != 0,
            UPX: row['UPX'] as int,
            X1: row['X1'] as int,
            ND: row['ND'] == null ? null : (row['ND'] as int) != 0,
            ARR: row['ARR'] == null ? null : (row['ARR'] as int) != 0,
            BH: row['BH'] as int,
            LF: row['LF'] as int,
            RK_PI: row['RK_PI'] as int,
            RK_PTI: row['RK_PTI'] as int,
            RKP: row['RKP'] as int,
            TRK: row['TRK'] as String,
            GT: row['GT'] as int,
            RDI: row['RDI'] as int,
            RFE: row['RFE'] as int,
            RFM: row['RFM'] as int,
            TEMI: row['TEMI'] as int,
            EI: row['EI'] as int,
            ETI: row['ETI'] as int,
            ED: row['ED'] as String,
            EM1: row['EM1'] == null ? null : (row['EM1'] as int) != 0,
            EM2: row['EM2'] == null ? null : (row['EM2'] as int) != 0));
  }

  @override
  Future<WebAppClientData> findWebAppClientDataById(int id) async {
    return _queryAdapter.query('SELECT * FROM WebAppClientData WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => WebAppClientData(
            id: row['id'] as int,
            PI: row['PI'] as int,
            PRI: row['PRI'] as int,
            RI: row['RI'] as int,
            PRCI: row['PRCI'] as int,
            CI: row['CI'] as int,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0,
            DC: row['DC'] as int,
            D1: _dateTimeConverter.decode(row['D1'] as int),
            CNV: row['CNV'] == null ? null : (row['CNV'] as int) != 0,
            CNR: row['CNR'] == null ? null : (row['CNR'] as int) != 0,
            RSS: row['RSS'] as String,
            RLL: row['RLL'] == null ? null : (row['RLL'] as int) != 0,
            UPX: row['UPX'] as int,
            X1: row['X1'] as int,
            ND: row['ND'] == null ? null : (row['ND'] as int) != 0,
            ARR: row['ARR'] == null ? null : (row['ARR'] as int) != 0,
            BH: row['BH'] as int,
            LF: row['LF'] as int,
            RK_PI: row['RK_PI'] as int,
            RK_PTI: row['RK_PTI'] as int,
            RKP: row['RKP'] as int,
            TRK: row['TRK'] as String,
            GT: row['GT'] as int,
            RDI: row['RDI'] as int,
            RFE: row['RFE'] as int,
            RFM: row['RFM'] as int,
            TEMI: row['TEMI'] as int,
            EI: row['EI'] as int,
            ETI: row['ETI'] as int,
            ED: row['ED'] as String,
            EM1: row['EM1'] == null ? null : (row['EM1'] as int) != 0,
            EM2: row['EM2'] == null ? null : (row['EM2'] as int) != 0));
  }

  @override
  Stream<List<WebAppClientData>> findAllJsonWebClientDataAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM WebAppClientData',
        queryableName: 'WebAppClientData',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientData(
            id: row['id'] as int,
            PI: row['PI'] as int,
            PRI: row['PRI'] as int,
            RI: row['RI'] as int,
            PRCI: row['PRCI'] as int,
            CI: row['CI'] as int,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0,
            DC: row['DC'] as int,
            D1: _dateTimeConverter.decode(row['D1'] as int),
            CNV: row['CNV'] == null ? null : (row['CNV'] as int) != 0,
            CNR: row['CNR'] == null ? null : (row['CNR'] as int) != 0,
            RSS: row['RSS'] as String,
            RLL: row['RLL'] == null ? null : (row['RLL'] as int) != 0,
            UPX: row['UPX'] as int,
            X1: row['X1'] as int,
            ND: row['ND'] == null ? null : (row['ND'] as int) != 0,
            ARR: row['ARR'] == null ? null : (row['ARR'] as int) != 0,
            BH: row['BH'] as int,
            LF: row['LF'] as int,
            RK_PI: row['RK_PI'] as int,
            RK_PTI: row['RK_PTI'] as int,
            RKP: row['RKP'] as int,
            TRK: row['TRK'] as String,
            GT: row['GT'] as int,
            RDI: row['RDI'] as int,
            RFE: row['RFE'] as int,
            RFM: row['RFM'] as int,
            TEMI: row['TEMI'] as int,
            EI: row['EI'] as int,
            ETI: row['ETI'] as int,
            ED: row['ED'] as String,
            EM1: row['EM1'] == null ? null : (row['EM1'] as int) != 0,
            EM2: row['EM2'] == null ? null : (row['EM2'] as int) != 0));
  }

  @override
  Future<void> deleteAllWebAppClientData() async {
    await _queryAdapter.queryNoReturn('DELETE FROM WebAppClientData');
  }

  @override
  Future<int> insertWebAppClientData(WebAppClientData jsonWebClientData) {
    return _webAppClientDataInsertionAdapter.insertAndReturnId(
        jsonWebClientData, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertWebAppClientDataList(
      List<WebAppClientData> WebClientData) {
    return _webAppClientDataInsertionAdapter.insertListAndReturnIds(
        WebClientData, OnConflictStrategy.abort);
  }

  @override
  Future<void> replaceWebClientData(
      List<WebAppClientData> WebAppClientData) async {
    if (database is sqflite.Transaction) {
      await super.replaceWebClientData(WebAppClientData);
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.navigationObject
            .replaceWebClientData(WebAppClientData);
      });
    }
  }
}

class _$StandardHeaderModelDao extends StandardHeaderModelDao {
  _$StandardHeaderModelDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _standardHeaderInsertionAdapter = InsertionAdapter(
            database,
            'StandardHeader',
            (StandardHeader item) => <String, dynamic>{
                  'id': item.id,
                  'VER': item.VER,
                  'ER_ID': item.ER_ID,
                  'ER': item.ER,
                  'RS_ID': item.RS_ID,
                  'RS': item.RS,
                  'M1': item.M1,
                  'M2': item.M2,
                  'OK2X': item.OK2X == null ? null : (item.OK2X ? 1 : 0),
                  'SD': item.SD == null ? null : (item.SD ? 1 : 0),
                  'BG': item.BG
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<StandardHeader> _standardHeaderInsertionAdapter;

  @override
  Future<List<StandardHeader>> findAllStandardHeader() async {
    return _queryAdapter.queryList('SELECT * FROM StandardHeader',
        mapper: (Map<String, dynamic> row) => StandardHeader(
            id: row['id'] as int,
            VER: row['VER'] as String,
            ER_ID: row['ER_ID'] as int,
            ER: row['ER'] as String,
            RS_ID: row['RS_ID'] as int,
            RS: row['RS'] as String,
            M1: row['M1'] as String,
            M2: row['M2'] as String,
            OK2X: row['OK2X'] == null ? null : (row['OK2X'] as int) != 0,
            SD: row['SD'] == null ? null : (row['SD'] as int) != 0,
            BG: row['BG'] as String));
  }

  @override
  Stream<List<StandardHeader>> findAllStandardHeadersAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM StandardHeader',
        queryableName: 'StandardHeader',
        isView: false,
        mapper: (Map<String, dynamic> row) => StandardHeader(
            id: row['id'] as int,
            VER: row['VER'] as String,
            ER_ID: row['ER_ID'] as int,
            ER: row['ER'] as String,
            RS_ID: row['RS_ID'] as int,
            RS: row['RS'] as String,
            M1: row['M1'] as String,
            M2: row['M2'] as String,
            OK2X: row['OK2X'] == null ? null : (row['OK2X'] as int) != 0,
            SD: row['SD'] == null ? null : (row['SD'] as int) != 0,
            BG: row['BG'] as String));
  }

  @override
  Future<void> deleteAllStandardHeaders() async {
    await _queryAdapter.queryNoReturn('DELETE FROM StandardHeader');
  }

  @override
  Future<void> insertStandardHeader(StandardHeader standardHeader) async {
    await _standardHeaderInsertionAdapter.insert(
        standardHeader, OnConflictStrategy.abort);
  }
}

class _$WebAppClientDataKeyDao extends WebAppClientDataKeyDao {
  _$WebAppClientDataKeyDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _webAppClientDataKeysInsertionAdapter = InsertionAdapter(
            database,
            'WebAppClientDataKeys',
            (WebAppClientDataKeys item) => <String, dynamic>{
                  'id': item.id,
                  'TY': item.TY,
                  'PC': item.PC,
                  'CL': item.CL,
                  'TI': item.TI,
                  'UI': item.UI == null ? null : (item.UI ? 1 : 0),
                  'RF': item.RF == null ? null : (item.RF ? 1 : 0),
                  'SV': item.SV == null ? null : (item.SV ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WebAppClientDataKeys>
      _webAppClientDataKeysInsertionAdapter;

  @override
  Future<List<WebAppClientDataKeys>> findAllWebAppClientDataKeys() async {
    return _queryAdapter.queryList('SELECT * FROM WebAppClientDataKeys',
        mapper: (Map<String, dynamic> row) => WebAppClientDataKeys(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] == null ? null : (row['UI'] as int) != 0,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientDataKeys> findWebAppClientDataKeyById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientDataKeys WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'WebAppClientDataKeys',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientDataKeys(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] == null ? null : (row['UI'] as int) != 0,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientDataKeys> findWebAppClientDataKeyByTYandCL(
      int TY, int CL) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientDataKeys WHERE TY = ? and CL = ?',
        arguments: <dynamic>[TY, CL],
        queryableName: 'WebAppClientDataKeys',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientDataKeys(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] == null ? null : (row['UI'] as int) != 0,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<List<WebAppClientDataKeys>> findAllWebAppClientDataKeysAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM WebAppClientDataKeys',
        queryableName: 'WebAppClientDataKeys',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientDataKeys(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] == null ? null : (row['UI'] as int) != 0,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Future<void> deleteAllWebAppClientDataKeys() async {
    await _queryAdapter.queryNoReturn('DELETE FROM WebAppClientDataKeys');
  }

  @override
  Future<int> insertWebClientData(WebAppClientDataKeys webAppClientDataKeys) {
    return _webAppClientDataKeysInsertionAdapter.insertAndReturnId(
        webAppClientDataKeys, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertWebClientDataList(
      List<WebAppClientDataKeys> WebClientData) {
    return _webAppClientDataKeysInsertionAdapter.insertListAndReturnIds(
        WebClientData, OnConflictStrategy.abort);
  }
}

class _$WebAppClientKeysRequestKeysDao extends WebAppClientKeysRequestKeysDao {
  _$WebAppClientKeysRequestKeysDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _webAppClientKeysRequestKeysInsertionAdapter = InsertionAdapter(
            database,
            'WebAppClientKeysRequestKeys',
            (WebAppClientKeysRequestKeys item) => <String, dynamic>{
                  'id': item.id,
                  'TY': item.TY,
                  'PC': item.PC,
                  'CL': item.CL,
                  'TI': item.TI,
                  'UI': item.UI,
                  'RF': item.RF == null ? null : (item.RF ? 1 : 0),
                  'SV': item.SV == null ? null : (item.SV ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WebAppClientKeysRequestKeys>
      _webAppClientKeysRequestKeysInsertionAdapter;

  @override
  Future<List<WebAppClientKeysRequestKeys>>
      findAllWebAppClientDataKeys() async {
    return _queryAdapter.queryList('SELECT * FROM WebAppClientKeysRequestKeys',
        mapper: (Map<String, dynamic> row) => WebAppClientKeysRequestKeys(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysRequestKeys> findWebAppClientDataKeyById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysRequestKeys WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'WebAppClientKeysRequestKeys',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysRequestKeys(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysRequestKeys> findWebAppClientDataKeyByTYandCL(
      int TY, int CL) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysRequestKeys WHERE TY = ? and CL = ?',
        arguments: <dynamic>[TY, CL],
        queryableName: 'WebAppClientKeysRequestKeys',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysRequestKeys(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<List<WebAppClientKeysRequestKeys>>
      findAllWebAppClientDataKeysAsStream() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM WebAppClientKeysRequestKeys',
        queryableName: 'WebAppClientKeysRequestKeys',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysRequestKeys(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Future<void> deleteAllWebAppClientDataKeys() async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM WebAppClientKeysRequestKeys');
  }

  @override
  Future<int> insertWebClientData(
      WebAppClientKeysRequestKeys webAppClientDataKeys) {
    return _webAppClientKeysRequestKeysInsertionAdapter.insertAndReturnId(
        webAppClientDataKeys, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertWebClientDataList(
      List<WebAppClientKeysRequestKeys> WebClientData) {
    return _webAppClientKeysRequestKeysInsertionAdapter.insertListAndReturnIds(
        WebClientData, OnConflictStrategy.abort);
  }
}

class _$WebAppClientKeysRequestKeysInitiallyDao
    extends WebAppClientKeysRequestKeysInitiallyDao {
  _$WebAppClientKeysRequestKeysInitiallyDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _webAppClientKeysRequestKeysInitiallyInsertionAdapter =
            InsertionAdapter(
                database,
                'WebAppClientKeysRequestKeysInitially',
                (WebAppClientKeysRequestKeysInitially item) =>
                    <String, dynamic>{
                      'RequestKeysInitiallyID': item.RequestKeysInitiallyID,
                      'TY': item.TY,
                      'PC': item.PC,
                      'CL': item.CL,
                      'TI': item.TI,
                      'UI': item.UI,
                      'RF': item.RF == null ? null : (item.RF ? 1 : 0),
                      'SV': item.SV == null ? null : (item.SV ? 1 : 0)
                    },
                changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WebAppClientKeysRequestKeysInitially>
      _webAppClientKeysRequestKeysInitiallyInsertionAdapter;

  @override
  Future<List<WebAppClientKeysRequestKeysInitially>>
      findAllWebAppClientDataKeys() async {
    return _queryAdapter.queryList(
        'SELECT * FROM WebAppClientKeysRequestKeysInitially',
        mapper: (Map<String, dynamic> row) =>
            WebAppClientKeysRequestKeysInitially(
                RequestKeysInitiallyID: row['RequestKeysInitiallyID'] as int,
                TY: row['TY'] as int,
                PC: row['PC'] as int,
                CL: row['CL'] as int,
                TI: row['TI'] as int,
                UI: row['UI'] as int,
                RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
                SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysRequestKeysInitially> findWebAppClientDataKeyById(
      int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysRequestKeysInitially WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'WebAppClientKeysRequestKeysInitially',
        isView: false,
        mapper: (Map<String, dynamic> row) =>
            WebAppClientKeysRequestKeysInitially(
                RequestKeysInitiallyID: row['RequestKeysInitiallyID'] as int,
                TY: row['TY'] as int,
                PC: row['PC'] as int,
                CL: row['CL'] as int,
                TI: row['TI'] as int,
                UI: row['UI'] as int,
                RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
                SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysRequestKeysInitially> findWebAppClientDataKeyByTYandCL(
      int TY, int CL) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysRequestKeysInitially WHERE TY = ? and CL = ?',
        arguments: <dynamic>[TY, CL],
        queryableName: 'WebAppClientKeysRequestKeysInitially',
        isView: false,
        mapper: (Map<String, dynamic> row) =>
            WebAppClientKeysRequestKeysInitially(
                RequestKeysInitiallyID: row['RequestKeysInitiallyID'] as int,
                TY: row['TY'] as int,
                PC: row['PC'] as int,
                CL: row['CL'] as int,
                TI: row['TI'] as int,
                UI: row['UI'] as int,
                RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
                SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<List<WebAppClientKeysRequestKeysInitially>>
      findAllWebAppClientDataKeysAsStream() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM WebAppClientKeysRequestKeysInitially',
        queryableName: 'WebAppClientKeysRequestKeysInitially',
        isView: false,
        mapper: (Map<String, dynamic> row) =>
            WebAppClientKeysRequestKeysInitially(
                RequestKeysInitiallyID: row['RequestKeysInitiallyID'] as int,
                TY: row['TY'] as int,
                PC: row['PC'] as int,
                CL: row['CL'] as int,
                TI: row['TI'] as int,
                UI: row['UI'] as int,
                RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
                SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Future<void> deleteAllWebAppClientDataKeys() async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM WebAppClientKeysRequestKeysInitially');
  }

  @override
  Future<int> insertWebClientData(
      WebAppClientKeysRequestKeysInitially webAppClientDataKeys) {
    return _webAppClientKeysRequestKeysInitiallyInsertionAdapter
        .insertAndReturnId(webAppClientDataKeys, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertWebClientDataList(
      List<WebAppClientKeysRequestKeysInitially> WebClientData) {
    return _webAppClientKeysRequestKeysInitiallyInsertionAdapter
        .insertListAndReturnIds(WebClientData, OnConflictStrategy.abort);
  }
}

class _$WebAppClientKeysActiveDao extends WebAppClientKeysActiveDao {
  _$WebAppClientKeysActiveDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _webAppClientKeysActiveInsertionAdapter = InsertionAdapter(
            database,
            'WebAppClientKeysActive',
            (WebAppClientKeysActive item) => <String, dynamic>{
                  'id': item.id,
                  'TY': item.TY,
                  'PC': item.PC,
                  'CL': item.CL,
                  'TI': item.TI,
                  'UI': item.UI,
                  'RF': item.RF == null ? null : (item.RF ? 1 : 0),
                  'SV': item.SV == null ? null : (item.SV ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WebAppClientKeysActive>
      _webAppClientKeysActiveInsertionAdapter;

  @override
  Future<List<WebAppClientKeysActive>> findAllWebAppClientDataKeys() async {
    return _queryAdapter.queryList('SELECT * FROM WebAppClientKeysActive',
        mapper: (Map<String, dynamic> row) => WebAppClientKeysActive(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysActive> findWebAppClientDataKeyById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysActive WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'WebAppClientKeysActive',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysActive(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysActive> findWebAppClientDataKeyByTYandCL(
      int TY, int CL) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysActive WHERE TY = ? and CL = ?',
        arguments: <dynamic>[TY, CL],
        queryableName: 'WebAppClientKeysActive',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysActive(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<List<WebAppClientKeysActive>> findAllWebAppClientDataKeysAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM WebAppClientKeysActive',
        queryableName: 'WebAppClientKeysActive',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysActive(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Future<void> deleteAllWebAppClientDataKeys() async {
    await _queryAdapter.queryNoReturn('DELETE FROM WebAppClientKeysActive');
  }

  @override
  Future<int> insertWebClientData(WebAppClientKeysActive webAppClientDataKeys) {
    return _webAppClientKeysActiveInsertionAdapter.insertAndReturnId(
        webAppClientDataKeys, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertWebClientDataList(
      List<WebAppClientKeysActive> WebClientData) {
    return _webAppClientKeysActiveInsertionAdapter.insertListAndReturnIds(
        WebClientData, OnConflictStrategy.abort);
  }
}

class _$WebAppClientKeysCacheDao extends WebAppClientKeysCacheDao {
  _$WebAppClientKeysCacheDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _webAppClientKeysCacheInsertionAdapter = InsertionAdapter(
            database,
            'WebAppClientKeysCache',
            (WebAppClientKeysCache item) => <String, dynamic>{
                  'id': item.id,
                  'TY': item.TY,
                  'PC': item.PC,
                  'CL': item.CL,
                  'TI': item.TI,
                  'UI': item.UI,
                  'RF': item.RF == null ? null : (item.RF ? 1 : 0),
                  'SV': item.SV == null ? null : (item.SV ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WebAppClientKeysCache>
      _webAppClientKeysCacheInsertionAdapter;

  @override
  Future<List<WebAppClientKeysCache>> findAllWebAppClientDataKeys() async {
    return _queryAdapter.queryList('SELECT * FROM WebAppClientKeysCache',
        mapper: (Map<String, dynamic> row) => WebAppClientKeysCache(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysCache> findWebAppClientDataKeyById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysCache WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'WebAppClientKeysCache',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysCache(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysCache> findWebAppClientDataKeyByTYandCL(
      int TY, int CL) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysCache WHERE TY = ? and CL = ?',
        arguments: <dynamic>[TY, CL],
        queryableName: 'WebAppClientKeysCache',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysCache(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<List<WebAppClientKeysCache>> findAllWebAppClientDataKeysAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM WebAppClientKeysCache',
        queryableName: 'WebAppClientKeysCache',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysCache(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Future<void> deleteAllWebAppClientDataKeys() async {
    await _queryAdapter.queryNoReturn('DELETE FROM WebAppClientKeysCache');
  }

  @override
  Future<int> insertWebClientData(WebAppClientKeysCache webAppClientDataKeys) {
    return _webAppClientKeysCacheInsertionAdapter.insertAndReturnId(
        webAppClientDataKeys, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertWebClientDataList(
      List<WebAppClientKeysCache> WebClientData) {
    return _webAppClientKeysCacheInsertionAdapter.insertListAndReturnIds(
        WebClientData, OnConflictStrategy.abort);
  }
}

class _$WebAppClientKeysToSqlDao extends WebAppClientKeysToSqlDao {
  _$WebAppClientKeysToSqlDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _webAppClientKeysToSqlInsertionAdapter = InsertionAdapter(
            database,
            'WebAppClientKeysToSql',
            (WebAppClientKeysToSql item) => <String, dynamic>{
                  'id': item.id,
                  'TY': item.TY,
                  'PC': item.PC,
                  'CL': item.CL,
                  'TI': item.TI,
                  'UI': item.UI,
                  'RF': item.RF == null ? null : (item.RF ? 1 : 0),
                  'SV': item.SV == null ? null : (item.SV ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WebAppClientKeysToSql>
      _webAppClientKeysToSqlInsertionAdapter;

  @override
  Future<List<WebAppClientKeysToSql>> findAllWebAppClientDataKeys() async {
    return _queryAdapter.queryList('SELECT * FROM WebAppClientKeysToSql',
        mapper: (Map<String, dynamic> row) => WebAppClientKeysToSql(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysToSql> findWebAppClientDataKeyById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysToSql WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'WebAppClientKeysToSql',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysToSql(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysToSql> findWebAppClientDataKeyByTYandCL(
      int TY, int CL) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysToSql WHERE TY = ? and CL = ?',
        arguments: <dynamic>[TY, CL],
        queryableName: 'WebAppClientKeysToSql',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysToSql(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<List<WebAppClientKeysToSql>> findAllWebAppClientDataKeysAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM WebAppClientKeysToSql',
        queryableName: 'WebAppClientKeysToSql',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysToSql(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Future<void> deleteAllWebAppClientDataKeys() async {
    await _queryAdapter.queryNoReturn('DELETE FROM WebAppClientKeysToSql');
  }

  @override
  Future<int> insertWebClientData(WebAppClientKeysToSql webAppClientDataKeys) {
    return _webAppClientKeysToSqlInsertionAdapter.insertAndReturnId(
        webAppClientDataKeys, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertWebClientDataList(
      List<WebAppClientKeysToSql> WebClientData) {
    return _webAppClientKeysToSqlInsertionAdapter.insertListAndReturnIds(
        WebClientData, OnConflictStrategy.abort);
  }
}

class _$WebAppClientKeysFromSqlDao extends WebAppClientKeysFromSqlDao {
  _$WebAppClientKeysFromSqlDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _webAppClientKeysFromSqlInsertionAdapter = InsertionAdapter(
            database,
            'WebAppClientKeysFromSql',
            (WebAppClientKeysFromSql item) => <String, dynamic>{
                  'id': item.id,
                  'TY': item.TY,
                  'PC': item.PC,
                  'CL': item.CL,
                  'TI': item.TI,
                  'UI': item.UI,
                  'RF': item.RF == null ? null : (item.RF ? 1 : 0),
                  'SV': item.SV == null ? null : (item.SV ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WebAppClientKeysFromSql>
      _webAppClientKeysFromSqlInsertionAdapter;

  @override
  Future<List<WebAppClientKeysFromSql>> findAllWebAppClientDataKeys() async {
    return _queryAdapter.queryList('SELECT * FROM WebAppClientKeysFromSql',
        mapper: (Map<String, dynamic> row) => WebAppClientKeysFromSql(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysFromSql> findWebAppClientDataKeyById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysFromSql WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'WebAppClientKeysFromSql',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysFromSql(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysFromSql> findWebAppClientDataKeyByTYandCL(
      int TY, int CL) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysFromSql WHERE TY = ? and CL = ?',
        arguments: <dynamic>[TY, CL],
        queryableName: 'WebAppClientKeysFromSql',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysFromSql(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<List<WebAppClientKeysFromSql>> findAllWebAppClientDataKeysAsStream() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM WebAppClientKeysFromSql',
        queryableName: 'WebAppClientKeysFromSql',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysFromSql(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Future<void> deleteAllWebAppClientDataKeys() async {
    await _queryAdapter.queryNoReturn('DELETE FROM WebAppClientKeysFromSql');
  }

  @override
  Future<int> insertWebClientData(
      WebAppClientKeysFromSql webAppClientDataKeys) {
    return _webAppClientKeysFromSqlInsertionAdapter.insertAndReturnId(
        webAppClientDataKeys, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertWebClientDataList(
      List<WebAppClientKeysFromSql> WebClientData) {
    return _webAppClientKeysFromSqlInsertionAdapter.insertListAndReturnIds(
        WebClientData, OnConflictStrategy.abort);
  }
}

class _$WebAppClientKeysTemporaryDao extends WebAppClientKeysTemporaryDao {
  _$WebAppClientKeysTemporaryDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _webAppClientKeysTemporaryInsertionAdapter = InsertionAdapter(
            database,
            'WebAppClientKeysTemporary',
            (WebAppClientKeysTemporary item) => <String, dynamic>{
                  'id': item.id,
                  'TY': item.TY,
                  'PC': item.PC,
                  'CL': item.CL,
                  'TI': item.TI,
                  'UI': item.UI,
                  'RF': item.RF == null ? null : (item.RF ? 1 : 0),
                  'SV': item.SV == null ? null : (item.SV ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WebAppClientKeysTemporary>
      _webAppClientKeysTemporaryInsertionAdapter;

  @override
  Future<List<WebAppClientKeysTemporary>> findAllWebAppClientDataKeys() async {
    return _queryAdapter.queryList('SELECT * FROM WebAppClientKeysTemporary',
        mapper: (Map<String, dynamic> row) => WebAppClientKeysTemporary(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysTemporary> findWebAppClientDataKeyById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysTemporary WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'WebAppClientKeysTemporary',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysTemporary(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysTemporary> findWebAppClientDataKeyByTYandCL(
      int TY, int CL) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysTemporary WHERE TY = ? and CL = ?',
        arguments: <dynamic>[TY, CL],
        queryableName: 'WebAppClientKeysTemporary',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysTemporary(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<List<WebAppClientKeysTemporary>>
      findAllWebAppClientDataKeysAsStream() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM WebAppClientKeysTemporary',
        queryableName: 'WebAppClientKeysTemporary',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysTemporary(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Future<void> deleteAllWebAppClientDataKeys() async {
    await _queryAdapter.queryNoReturn('DELETE FROM WebAppClientKeysTemporary');
  }

  @override
  Future<int> insertWebClientData(
      WebAppClientKeysTemporary webAppClientDataKeys) {
    return _webAppClientKeysTemporaryInsertionAdapter.insertAndReturnId(
        webAppClientDataKeys, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertWebClientDataList(
      List<WebAppClientKeysTemporary> WebClientData) {
    return _webAppClientKeysTemporaryInsertionAdapter.insertListAndReturnIds(
        WebClientData, OnConflictStrategy.abort);
  }
}

class _$WebAppClientKeysPageTabDao extends WebAppClientKeysPageTabDao {
  _$WebAppClientKeysPageTabDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _webAppClientKeysPageTabInsertionAdapter = InsertionAdapter(
            database,
            'WebAppClientKeysPageTab',
            (WebAppClientKeysPageTab item) => <String, dynamic>{
                  'id': item.id,
                  'TY': item.TY,
                  'PC': item.PC,
                  'CL': item.CL,
                  'TI': item.TI,
                  'UI': item.UI,
                  'RF': item.RF == null ? null : (item.RF ? 1 : 0),
                  'SV': item.SV == null ? null : (item.SV ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WebAppClientKeysPageTab>
      _webAppClientKeysPageTabInsertionAdapter;

  @override
  Future<List<WebAppClientKeysPageTab>> findAllWebAppClientDataKeys() async {
    return _queryAdapter.queryList('SELECT * FROM WebAppClientKeysPageTab',
        mapper: (Map<String, dynamic> row) => WebAppClientKeysPageTab(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysPageTab> findWebAppClientDataKeyById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysPageTab WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'WebAppClientKeysPageTab',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysPageTab(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysPageTab> findWebAppClientDataKeyByTYandCL(
      int TY, int CL) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysPageTab WHERE TY = ? and CL = ?',
        arguments: <dynamic>[TY, CL],
        queryableName: 'WebAppClientKeysPageTab',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysPageTab(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<List<WebAppClientKeysToSql>> findAllWebAppClientDataKeysAsStream() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM WebAppClientKeysPageTab',
        queryableName: 'WebAppClientKeysToSql',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysToSql(
            id: row['id'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] as int,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Future<void> deleteAllWebAppClientDataKeys() async {
    await _queryAdapter.queryNoReturn('DELETE FROM WebAppClientKeysPageTab');
  }

  @override
  Future<int> insertWebClientData(
      WebAppClientKeysPageTab webAppClientDataKeys) {
    return _webAppClientKeysPageTabInsertionAdapter.insertAndReturnId(
        webAppClientDataKeys, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertWebClientDataList(
      List<WebAppClientKeysPageTab> WebClientData) {
    return _webAppClientKeysPageTabInsertionAdapter.insertListAndReturnIds(
        WebClientData, OnConflictStrategy.abort);
  }
}

class _$WebAppClientKeysPageReturnDao extends WebAppClientKeysPageReturnDao {
  _$WebAppClientKeysPageReturnDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  @override
  Future<List<WebAppClientKeysPageReturn>>
      findAllWebAppClientKeysPageReturn() async {
    return _queryAdapter.queryList('SELECT * FROM WebAppClientKeysPageReturn',
        mapper: (Map<String, dynamic> row) => WebAppClientKeysPageReturn(
            PageReturnID: row['PageReturnID'] as int,
            PI_CHILD: row['PI_CHILD'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] == null ? null : (row['UI'] as int) != 0,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysPageReturn> findWebAppClientKeysPageReturnById(
      int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysPageReturn WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'WebAppClientKeysPageReturn',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysPageReturn(
            PageReturnID: row['PageReturnID'] as int,
            PI_CHILD: row['PI_CHILD'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] == null ? null : (row['UI'] as int) != 0,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Stream<WebAppClientKeysPageReturn> findWebAppClientKeysPageReturnByTYandCL(
      int TY, int CL) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WebAppClientKeysPageReturn WHERE TY = ? and CL = ?',
        arguments: <dynamic>[TY, CL],
        queryableName: 'WebAppClientKeysPageReturn',
        isView: false,
        mapper: (Map<String, dynamic> row) => WebAppClientKeysPageReturn(
            PageReturnID: row['PageReturnID'] as int,
            PI_CHILD: row['PI_CHILD'] as int,
            TY: row['TY'] as int,
            PC: row['PC'] as int,
            CL: row['CL'] as int,
            TI: row['TI'] as int,
            UI: row['UI'] == null ? null : (row['UI'] as int) != 0,
            RF: row['RF'] == null ? null : (row['RF'] as int) != 0,
            SV: row['SV'] == null ? null : (row['SV'] as int) != 0));
  }

  @override
  Future<void> deleteAllWebAppClientKeysPageReturn() async {
    await _queryAdapter.queryNoReturn('DELETE FROM WebAppClientKeysPageReturn');
  }
}

class _$RKDao extends RKDao {
  _$RKDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _rKInsertionAdapter = InsertionAdapter(
            database,
            'RK',
            (RK item) => <String, dynamic>{
                  'id': item.id,
                  'rowsource_id': item.rowsource_id,
                  'P': item.P,
                  'C': item.C,
                  'I': item.I,
                  'U': item.U == null ? null : (item.U ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RK> _rKInsertionAdapter;

  @override
  Future<List<RK>> findAllWebAppClientDataKeys() async {
    return _queryAdapter.queryList('SELECT * FROM RK',
        mapper: (Map<String, dynamic> row) => RK(
            id: row['id'] as int,
            rowsource_id: row['rowsource_id'] as int,
            P: row['P'] as int,
            C: row['C'] as int,
            I: row['I'] as int,
            U: row['U'] == null ? null : (row['U'] as int) != 0));
  }

  @override
  Stream<RK> findWebAppClientDataKeyById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM RK WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'RK',
        isView: false,
        mapper: (Map<String, dynamic> row) => RK(
            id: row['id'] as int,
            rowsource_id: row['rowsource_id'] as int,
            P: row['P'] as int,
            C: row['C'] as int,
            I: row['I'] as int,
            U: row['U'] == null ? null : (row['U'] as int) != 0));
  }

  @override
  Stream<List<RK>> findAllRKsAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM WebAppClientDataKeys',
        queryableName: 'RK',
        isView: false,
        mapper: (Map<String, dynamic> row) => RK(
            id: row['id'] as int,
            rowsource_id: row['rowsource_id'] as int,
            P: row['P'] as int,
            C: row['C'] as int,
            I: row['I'] as int,
            U: row['U'] == null ? null : (row['U'] as int) != 0));
  }

  @override
  Future<void> deleteAllRKs() async {
    await _queryAdapter.queryNoReturn('DELETE FROM RK');
  }

  @override
  Future<int> insertRK(RK rk) {
    return _rKInsertionAdapter.insertAndReturnId(rk, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertRKList(List<RK> rkList) {
    return _rKInsertionAdapter.insertListAndReturnIds(
        rkList, OnConflictStrategy.abort);
  }
}

class _$RowSourcesDao extends RowSourcesDao {
  _$RowSourcesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _rowSourcesInsertionAdapter = InsertionAdapter(
            database,
            'RowSources',
            (RowSources item) => <String, dynamic>{
                  'id': item.id,
                  'KeyValue': item.KeyValue,
                  'I': item.I,
                  'D': item.D,
                  'IA': item.IA
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RowSources> _rowSourcesInsertionAdapter;

  @override
  Future<List<RowSources>> findAllRowSourcesKeys() async {
    return _queryAdapter.queryList('SELECT * FROM RowSources',
        mapper: (Map<String, dynamic> row) => RowSources(
            id: row['id'] as int,
            KeyValue: row['KeyValue'] as String,
            I: row['I'] as int,
            D: row['D'] as String,
            IA: row['IA'] as String));
  }

  @override
  Stream<RowSources> findRowSourcesById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM RowSources WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'RowSources',
        isView: false,
        mapper: (Map<String, dynamic> row) => RowSources(
            id: row['id'] as int,
            KeyValue: row['KeyValue'] as String,
            I: row['I'] as int,
            D: row['D'] as String,
            IA: row['IA'] as String));
  }

  @override
  Stream<List<RowSources>> findAllRowSourcesAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM RowSources',
        queryableName: 'RowSources',
        isView: false,
        mapper: (Map<String, dynamic> row) => RowSources(
            id: row['id'] as int,
            KeyValue: row['KeyValue'] as String,
            I: row['I'] as int,
            D: row['D'] as String,
            IA: row['IA'] as String));
  }

  @override
  Future<void> deleteAllRowSources() async {
    await _queryAdapter.queryNoReturn('DELETE FROM RowSources');
  }

  @override
  Future<int> insertRowSource(RowSources rawSource) {
    return _rowSourcesInsertionAdapter.insertAndReturnId(
        rawSource, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertRowSourcesList(List<RowSources> rkList) {
    return _rowSourcesInsertionAdapter.insertListAndReturnIds(
        rkList, OnConflictStrategy.abort);
  }
}

class _$RowSources_RS_12_2Dao extends RowSources_RS_12_2Dao {
  _$RowSources_RS_12_2Dao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _rowSources_RS_12_2InsertionAdapter = InsertionAdapter(
            database,
            'RowSources_RS_12_2',
            (RowSources_RS_12_2 item) => <String, dynamic>{
                  'id': item.id,
                  'I': item.I,
                  'D': item.D,
                  'S1': item.S1,
                  'B1': item.B1 == null ? null : (item.B1 ? 1 : 0),
                  'B2': item.B2 == null ? null : (item.B2 ? 1 : 0),
                  'B3': item.B3 == null ? null : (item.B3 ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RowSources_RS_12_2>
      _rowSources_RS_12_2InsertionAdapter;

  @override
  Future<List<RowSources_RS_12_2>> findAllRowSources() async {
    return _queryAdapter.queryList('SELECT * FROM RowSources_RS_12_2',
        mapper: (Map<String, dynamic> row) => RowSources_RS_12_2(
            S1: row['S1'] as String,
            B1: row['B1'] == null ? null : (row['B1'] as int) != 0,
            B2: row['B2'] == null ? null : (row['B2'] as int) != 0,
            B3: row['B3'] == null ? null : (row['B3'] as int) != 0,
            id: row['id'] as int,
            I: row['I'] as int,
            D: row['D'] as String));
  }

  @override
  Stream<RowSources_RS_12_2> findRowSourcesById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM RowSources_RS_12_2 WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'RowSources_RS_12_2',
        isView: false,
        mapper: (Map<String, dynamic> row) => RowSources_RS_12_2(
            S1: row['S1'] as String,
            B1: row['B1'] == null ? null : (row['B1'] as int) != 0,
            B2: row['B2'] == null ? null : (row['B2'] as int) != 0,
            B3: row['B3'] == null ? null : (row['B3'] as int) != 0,
            id: row['id'] as int,
            I: row['I'] as int,
            D: row['D'] as String));
  }

  @override
  Stream<List<RowSources_RS_12_2>> findAllRowSourcesAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM RowSources_RS_12_2',
        queryableName: 'RowSources_RS_12_2',
        isView: false,
        mapper: (Map<String, dynamic> row) => RowSources_RS_12_2(
            S1: row['S1'] as String,
            B1: row['B1'] == null ? null : (row['B1'] as int) != 0,
            B2: row['B2'] == null ? null : (row['B2'] as int) != 0,
            B3: row['B3'] == null ? null : (row['B3'] as int) != 0,
            id: row['id'] as int,
            I: row['I'] as int,
            D: row['D'] as String));
  }

  @override
  Future<void> deleteAllRowSources() async {
    await _queryAdapter.queryNoReturn('DELETE FROM RowSources_RS_12_2');
  }

  @override
  Future<int> insertRowSource(RowSources_RS_12_2 rawSource) {
    return _rowSources_RS_12_2InsertionAdapter.insertAndReturnId(
        rawSource, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertRowSourcesList(List<RowSources_RS_12_2> rkList) {
    return _rowSources_RS_12_2InsertionAdapter.insertListAndReturnIds(
        rkList, OnConflictStrategy.abort);
  }
}

class _$RowSources_RS_1_10_2Dao extends RowSources_RS_1_10_2Dao {
  _$RowSources_RS_1_10_2Dao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _rowSources_RS_1_10_2InsertionAdapter = InsertionAdapter(
            database,
            'RowSources_RS_1_10_2',
            (RowSources_RS_1_10_2 item) => <String, dynamic>{
                  'id': item.id,
                  'I': item.I,
                  'RK': item.RK,
                  'IA': item.IA,
                  'D': item.D
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RowSources_RS_1_10_2>
      _rowSources_RS_1_10_2InsertionAdapter;

  @override
  Future<List<RowSources_RS_1_10_2>> findAllRowSources() async {
    return _queryAdapter.queryList('SELECT * FROM RowSources_RS_1_10_2',
        mapper: (Map<String, dynamic> row) => RowSources_RS_1_10_2(
            id: row['id'] as int,
            RK: row['RK'] as String,
            I: row['I'] as int,
            IA: row['IA'] as String,
            D: row['D'] as String));
  }

  @override
  Stream<RowSources_RS_1_10_2> findRowSourcesById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM RowSources_RS_1_10_2 WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'RowSources_RS_1_10_2',
        isView: false,
        mapper: (Map<String, dynamic> row) => RowSources_RS_1_10_2(
            id: row['id'] as int,
            RK: row['RK'] as String,
            I: row['I'] as int,
            IA: row['IA'] as String,
            D: row['D'] as String));
  }

  @override
  Stream<List<RowSources_RS_1_10_2>> findAllRowSourcesAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM RowSources_RS_1_10_2',
        queryableName: 'RowSources_RS_1_10_2',
        isView: false,
        mapper: (Map<String, dynamic> row) => RowSources_RS_1_10_2(
            id: row['id'] as int,
            RK: row['RK'] as String,
            I: row['I'] as int,
            IA: row['IA'] as String,
            D: row['D'] as String));
  }

  @override
  Future<void> deleteAllRowSources() async {
    await _queryAdapter.queryNoReturn('DELETE FROM RowSources_RS_1_10_2');
  }

  @override
  Future<int> insertRowSource(RowSources_RS_1_10_2 rawSource) {
    return _rowSources_RS_1_10_2InsertionAdapter.insertAndReturnId(
        rawSource, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertRowSourcesList(List<RowSources_RS_1_10_2> rkList) {
    return _rowSources_RS_1_10_2InsertionAdapter.insertListAndReturnIds(
        rkList, OnConflictStrategy.abort);
  }
}

class _$RowSources_RS_29_41_15_6Dao extends RowSources_RS_29_41_15_6Dao {
  _$RowSources_RS_29_41_15_6Dao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _rowSources_RS_29_41_15_6InsertionAdapter = InsertionAdapter(
            database,
            'RowSources_RS_29_41_15_6',
            (RowSources_RS_29_41_15_6 item) => <String, dynamic>{
                  'id': item.id,
                  'I': item.I,
                  'RK': item.RK,
                  'D': item.D,
                  'S1': item.S1,
                  'I1': item.I1,
                  'I2': item.I2,
                  'I3': item.I3,
                  'I4': item.I4,
                  'B1': item.B1 == null ? null : (item.B1 ? 1 : 0),
                  'B2': item.B2 == null ? null : (item.B2 ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RowSources_RS_29_41_15_6>
      _rowSources_RS_29_41_15_6InsertionAdapter;

  @override
  Future<List<RowSources_RS_29_41_15_6>> findAllRowSources() async {
    return _queryAdapter.queryList('SELECT * FROM RowSources_RS_29_41_15_6',
        mapper: (Map<String, dynamic> row) => RowSources_RS_29_41_15_6(
            RK: row['RK'] as String,
            S1: row['S1'] as String,
            I1: row['I1'] as int,
            I2: row['I2'] as int,
            I3: row['I3'] as int,
            I4: row['I4'] as int,
            id: row['id'] as int,
            I: row['I'] as int,
            D: row['D'] as String,
            B1: row['B1'] == null ? null : (row['B1'] as int) != 0,
            B2: row['B2'] == null ? null : (row['B2'] as int) != 0));
  }

  @override
  Stream<RowSources_RS_29_41_15_6> findRowSourcesById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM RowSources_RS_29_41_15_6 WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'RowSources_RS_29_41_15_6',
        isView: false,
        mapper: (Map<String, dynamic> row) => RowSources_RS_29_41_15_6(
            RK: row['RK'] as String,
            S1: row['S1'] as String,
            I1: row['I1'] as int,
            I2: row['I2'] as int,
            I3: row['I3'] as int,
            I4: row['I4'] as int,
            id: row['id'] as int,
            I: row['I'] as int,
            D: row['D'] as String,
            B1: row['B1'] == null ? null : (row['B1'] as int) != 0,
            B2: row['B2'] == null ? null : (row['B2'] as int) != 0));
  }

  @override
  Stream<List<RowSources_RS_29_41_15_6>> findAllRowSourcesAsStream() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM RowSources_RS_29_41_15_6',
        queryableName: 'RowSources_RS_29_41_15_6',
        isView: false,
        mapper: (Map<String, dynamic> row) => RowSources_RS_29_41_15_6(
            RK: row['RK'] as String,
            S1: row['S1'] as String,
            I1: row['I1'] as int,
            I2: row['I2'] as int,
            I3: row['I3'] as int,
            I4: row['I4'] as int,
            id: row['id'] as int,
            I: row['I'] as int,
            D: row['D'] as String,
            B1: row['B1'] == null ? null : (row['B1'] as int) != 0,
            B2: row['B2'] == null ? null : (row['B2'] as int) != 0));
  }

  @override
  Future<void> deleteAllRowSources() async {
    await _queryAdapter.queryNoReturn('DELETE FROM RowSources_RS_29_41_15_6');
  }

  @override
  Future<int> insertRowSource(RowSources_RS_29_41_15_6 rawSource) {
    return _rowSources_RS_29_41_15_6InsertionAdapter.insertAndReturnId(
        rawSource, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertRowSourcesList(
      List<RowSources_RS_29_41_15_6> rkList) {
    return _rowSources_RS_29_41_15_6InsertionAdapter.insertListAndReturnIds(
        rkList, OnConflictStrategy.abort);
  }
}

class _$RowSources_RS_30_2Dao extends RowSources_RS_30_2Dao {
  _$RowSources_RS_30_2Dao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _rowSources_RS_30_2InsertionAdapter = InsertionAdapter(
            database,
            'RowSources_RS_30_2',
            (RowSources_RS_30_2 item) => <String, dynamic>{
                  'intWebAppTreeviewSortID': item.intWebAppTreeviewSortID,
                  'strRowSource': item.strRowSource,
                  'intDataTypeID': item.intDataTypeID,
                  'intIndex1': item.intIndex1,
                  'blnDefaultOn': item.blnDefaultOn == null
                      ? null
                      : (item.blnDefaultOn ? 1 : 0),
                  'blnSelected': item.blnSelected == null
                      ? null
                      : (item.blnSelected ? 1 : 0),
                  'blnMatching': item.blnMatching == null
                      ? null
                      : (item.blnMatching ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RowSources_RS_30_2>
      _rowSources_RS_30_2InsertionAdapter;

  @override
  Future<List<RowSources_RS_30_2>> findAllRowSources() async {
    return _queryAdapter.queryList('SELECT * FROM RowSources_RS_30_2',
        mapper: (Map<String, dynamic> row) => RowSources_RS_30_2(
            intWebAppTreeviewSortID: row['intWebAppTreeviewSortID'] as int,
            strRowSource: row['strRowSource'] as String,
            intDataTypeID: row['intDataTypeID'] as int,
            intIndex1: row['intIndex1'] as int,
            blnDefaultOn: row['blnDefaultOn'] == null
                ? null
                : (row['blnDefaultOn'] as int) != 0,
            blnSelected: row['blnSelected'] == null
                ? null
                : (row['blnSelected'] as int) != 0,
            blnMatching: row['blnMatching'] == null
                ? null
                : (row['blnMatching'] as int) != 0));
  }

  @override
  Future<List<RowSources_RS_30_2>> findMatchingRowSources() async {
    return _queryAdapter.queryList(
        'SELECT * FROM RowSources_RS_30_2 where blnMatching = 1',
        mapper: (Map<String, dynamic> row) => RowSources_RS_30_2(
            intWebAppTreeviewSortID: row['intWebAppTreeviewSortID'] as int,
            strRowSource: row['strRowSource'] as String,
            intDataTypeID: row['intDataTypeID'] as int,
            intIndex1: row['intIndex1'] as int,
            blnDefaultOn: row['blnDefaultOn'] == null
                ? null
                : (row['blnDefaultOn'] as int) != 0,
            blnSelected: row['blnSelected'] == null
                ? null
                : (row['blnSelected'] as int) != 0,
            blnMatching: row['blnMatching'] == null
                ? null
                : (row['blnMatching'] as int) != 0));
  }

  @override
  Stream<RowSources_RS_30_2> findRowSourcesById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM RowSources_RS_30_2 WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'RowSources_RS_30_2',
        isView: false,
        mapper: (Map<String, dynamic> row) => RowSources_RS_30_2(
            intWebAppTreeviewSortID: row['intWebAppTreeviewSortID'] as int,
            strRowSource: row['strRowSource'] as String,
            intDataTypeID: row['intDataTypeID'] as int,
            intIndex1: row['intIndex1'] as int,
            blnDefaultOn: row['blnDefaultOn'] == null
                ? null
                : (row['blnDefaultOn'] as int) != 0,
            blnSelected: row['blnSelected'] == null
                ? null
                : (row['blnSelected'] as int) != 0,
            blnMatching: row['blnMatching'] == null
                ? null
                : (row['blnMatching'] as int) != 0));
  }

  @override
  Stream<List<RowSources_RS_30_2>> findAllRowSourcesAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM RowSources_RS_30_2',
        queryableName: 'RowSources_RS_30_2',
        isView: false,
        mapper: (Map<String, dynamic> row) => RowSources_RS_30_2(
            intWebAppTreeviewSortID: row['intWebAppTreeviewSortID'] as int,
            strRowSource: row['strRowSource'] as String,
            intDataTypeID: row['intDataTypeID'] as int,
            intIndex1: row['intIndex1'] as int,
            blnDefaultOn: row['blnDefaultOn'] == null
                ? null
                : (row['blnDefaultOn'] as int) != 0,
            blnSelected: row['blnSelected'] == null
                ? null
                : (row['blnSelected'] as int) != 0,
            blnMatching: row['blnMatching'] == null
                ? null
                : (row['blnMatching'] as int) != 0));
  }

  @override
  Future<void> deleteAllRowSources() async {
    await _queryAdapter.queryNoReturn('DELETE FROM RowSources_RS_30_2');
  }

  @override
  Future<int> insertRowSource(RowSources_RS_30_2 rawSource) {
    return _rowSources_RS_30_2InsertionAdapter.insertAndReturnId(
        rawSource, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertRowSourcesList(List<RowSources_RS_30_2> rkList) {
    return _rowSources_RS_30_2InsertionAdapter.insertListAndReturnIds(
        rkList, OnConflictStrategy.abort);
  }
}

class _$RowSources_RS_13_23_6_2Dao extends RowSources_RS_13_23_6_2Dao {
  _$RowSources_RS_13_23_6_2Dao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _rowSources_RS_13_23_6_2InsertionAdapter = InsertionAdapter(
            database,
            'RowSources_RS_13_23_6_2',
            (RowSources_RS_13_23_6_2 item) => <String, dynamic>{
                  'id': item.id,
                  'i': item.i,
                  'd': item.d,
                  'iA': item.iA,
                  'rK': item.rK
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RowSources_RS_13_23_6_2>
      _rowSources_RS_13_23_6_2InsertionAdapter;

  @override
  Future<List<RowSources_RS_13_23_6_2>> findAllRowSources() async {
    return _queryAdapter.queryList('SELECT * FROM RowSources_RS_13_23_6_2',
        mapper: (Map<String, dynamic> row) => RowSources_RS_13_23_6_2(
            id: row['id'] as int,
            i: row['i'] as int,
            d: row['d'] as String,
            iA: row['iA'] as String,
            rK: row['rK'] as String));
  }

  @override
  Stream<RowSources_RS_13_23_6_2> findRowSourcesById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM RowSources_RS_13_23_6_2 WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'RowSources_RS_13_23_6_2',
        isView: false,
        mapper: (Map<String, dynamic> row) => RowSources_RS_13_23_6_2(
            id: row['id'] as int,
            i: row['i'] as int,
            d: row['d'] as String,
            iA: row['iA'] as String,
            rK: row['rK'] as String));
  }

  @override
  Stream<List<RowSources_RS_13_23_6_2>> findAllRowSourcesAsStream() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM RowSources_RS_13_23_6_2',
        queryableName: 'RowSources_RS_13_23_6_2',
        isView: false,
        mapper: (Map<String, dynamic> row) => RowSources_RS_13_23_6_2(
            id: row['id'] as int,
            i: row['i'] as int,
            d: row['d'] as String,
            iA: row['iA'] as String,
            rK: row['rK'] as String));
  }

  @override
  Future<void> deleteAllRowSources() async {
    await _queryAdapter.queryNoReturn('DELETE FROM RowSources_RS_13_23_6_2');
  }

  @override
  Future<int> insertRowSource(RowSources_RS_13_23_6_2 rowSource) {
    return _rowSources_RS_13_23_6_2InsertionAdapter.insertAndReturnId(
        rowSource, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertRowSourcesList(List<RowSources_RS_13_23_6_2> rkList) {
    return _rowSources_RS_13_23_6_2InsertionAdapter.insertListAndReturnIds(
        rkList, OnConflictStrategy.abort);
  }
}

class _$RowSources_RS_31_42_2_6Dao extends RowSources_RS_31_42_2_6Dao {
  _$RowSources_RS_31_42_2_6Dao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _rowSources_RS_31_42_2_6InsertionAdapter = InsertionAdapter(
            database,
            'RowSources_RS_31_42_2_6',
            (RowSources_RS_31_42_2_6 item) => <String, dynamic>{
                  'id': item.id,
                  'intDataTypeID': item.intDataTypeID,
                  'intGroup1DataTypeID': item.intGroup1DataTypeID
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RowSources_RS_31_42_2_6>
      _rowSources_RS_31_42_2_6InsertionAdapter;

  @override
  Future<List<RowSources_RS_31_42_2_6>> findAllRowSources() async {
    return _queryAdapter.queryList('SELECT * FROM RowSources_RS_31_42_2_6',
        mapper: (Map<String, dynamic> row) => RowSources_RS_31_42_2_6(
            id: row['id'] as int,
            intDataTypeID: row['intDataTypeID'] as int,
            intGroup1DataTypeID: row['intGroup1DataTypeID'] as int));
  }

  @override
  Stream<RowSources_RS_31_42_2_6> findRowSourcesById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM RowSources_RS_31_42_2_6 WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'RowSources_RS_31_42_2_6',
        isView: false,
        mapper: (Map<String, dynamic> row) => RowSources_RS_31_42_2_6(
            id: row['id'] as int,
            intDataTypeID: row['intDataTypeID'] as int,
            intGroup1DataTypeID: row['intGroup1DataTypeID'] as int));
  }

  @override
  Stream<List<RowSources_RS_31_42_2_6>> findAllRowSourcesAsStream() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM RowSources_RS_31_42_2_6',
        queryableName: 'RowSources_RS_31_42_2_6',
        isView: false,
        mapper: (Map<String, dynamic> row) => RowSources_RS_31_42_2_6(
            id: row['id'] as int,
            intDataTypeID: row['intDataTypeID'] as int,
            intGroup1DataTypeID: row['intGroup1DataTypeID'] as int));
  }

  @override
  Future<void> deleteAllRowSources() async {
    await _queryAdapter.queryNoReturn('DELETE FROM RowSources_RS_31_42_2_6');
  }

  @override
  Future<int> insertRowSource(RowSources_RS_31_42_2_6 rawSource) {
    return _rowSources_RS_31_42_2_6InsertionAdapter.insertAndReturnId(
        rawSource, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertRowSourcesList(List<RowSources_RS_31_42_2_6> rkList) {
    return _rowSources_RS_31_42_2_6InsertionAdapter.insertListAndReturnIds(
        rkList, OnConflictStrategy.abort);
  }
}

class _$Prci688StackDao extends Prci688StackDao {
  _$Prci688StackDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _prci688StackInsertionAdapter = InsertionAdapter(
            database,
            'Prci688Stack',
            (Prci688Stack item) => <String, dynamic>{
                  'id': item.id,
                  'PTIR': item.PTIR,
                  'DTID': item.DTID,
                  'PFK': item.PFK,
                  'DATE': _dateTimeConverter.encode(item.DATE),
                  'CCT': item.CCT
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Prci688Stack> _prci688StackInsertionAdapter;

  @override
  Future<List<Prci688Stack>> findAllRowSources() async {
    return _queryAdapter.queryList('SELECT * FROM RowSources_RS_1_10_2',
        mapper: (Map<String, dynamic> row) => Prci688Stack(
            id: row['id'] as int,
            PTIR: row['PTIR'] as int,
            PFK: row['PFK'] as String,
            CCT: row['CCT'] as int,
            DTID: row['DTID'] as int,
            DATE: _dateTimeConverter.decode(row['DATE'] as int)));
  }

  @override
  Stream<Prci688Stack> findPrci688StacksById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM RowSources_RS_1_10_2 WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'Prci688Stack',
        isView: false,
        mapper: (Map<String, dynamic> row) => Prci688Stack(
            id: row['id'] as int,
            PTIR: row['PTIR'] as int,
            PFK: row['PFK'] as String,
            CCT: row['CCT'] as int,
            DTID: row['DTID'] as int,
            DATE: _dateTimeConverter.decode(row['DATE'] as int)));
  }

  @override
  Stream<List<Prci688Stack>> findAllRowSourcesAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM RowSources_RS_1_10_2',
        queryableName: 'Prci688Stack',
        isView: false,
        mapper: (Map<String, dynamic> row) => Prci688Stack(
            id: row['id'] as int,
            PTIR: row['PTIR'] as int,
            PFK: row['PFK'] as String,
            CCT: row['CCT'] as int,
            DTID: row['DTID'] as int,
            DATE: _dateTimeConverter.decode(row['DATE'] as int)));
  }

  @override
  Future<void> deleteAllRowSources() async {
    await _queryAdapter.queryNoReturn('DELETE FROM RowSources_RS_1_10_2');
  }

  @override
  Future<int> insertRowSource(Prci688Stack rawSource) {
    return _prci688StackInsertionAdapter.insertAndReturnId(
        rawSource, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertRowSourcesList(List<Prci688Stack> rkList) {
    return _prci688StackInsertionAdapter.insertListAndReturnIds(
        rkList, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
