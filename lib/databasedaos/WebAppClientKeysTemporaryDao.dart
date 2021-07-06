import 'package:MMLMobile/databasemodels/WebAppClientDataKeys.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysTemporary.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysToSql.dart';
import 'package:floor/floor.dart';

@dao
abstract class  WebAppClientKeysTemporaryDao {

  @Query('SELECT * FROM WebAppClientKeysTemporary')
  Future<List<WebAppClientKeysTemporary>> findAllWebAppClientDataKeys();

  @Query('SELECT * FROM WebAppClientKeysTemporary WHERE id = :id')
  Stream<WebAppClientKeysTemporary> findWebAppClientDataKeyById(int id);

  @Query('SELECT * FROM WebAppClientKeysTemporary WHERE TY = :TY and CL = :CL')
  Stream<WebAppClientKeysTemporary> findWebAppClientDataKeyByTYandCL(int TY, int CL);

  @insert
  Future<int> insertWebClientData(WebAppClientKeysTemporary webAppClientDataKeys);

  @insert
  Future<List<int>> insertWebClientDataList(List<WebAppClientKeysTemporary> WebClientData);

  @Query('SELECT * FROM WebAppClientKeysTemporary')
  Stream<List<WebAppClientKeysTemporary>> findAllWebAppClientDataKeysAsStream(); // stream return

  @Query('DELETE FROM WebAppClientKeysTemporary')
  Future<void> deleteAllWebAppClientDataKeys(); // query without returning an entity

}