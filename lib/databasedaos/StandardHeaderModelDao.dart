import 'package:MMLMobile/databasemodels/WebAppClientData.dart';
import 'package:MMLMobile/databasemodels/StandardHeader.dart';
import 'package:floor/floor.dart';

@dao
abstract class StandardHeaderModelDao {

  @Query('SELECT * FROM StandardHeader')
  Future<List<StandardHeader>> findAllStandardHeader();

  @insert
  Future<void> insertStandardHeader(StandardHeader standardHeader);

  @Query('SELECT * FROM StandardHeader')
  Stream<List<StandardHeader>> findAllStandardHeadersAsStream(); // stream return

  @Query('DELETE FROM StandardHeader')
  Future<void> deleteAllStandardHeaders(); // query without returning an entity

}