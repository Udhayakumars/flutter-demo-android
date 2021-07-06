import 'package:MMLMobile/databasemodels/WebAppClientDataKeys.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysFromSql.dart';
import 'package:floor/floor.dart';

@dao
abstract class WebAppClientKeysFromSqlDao {

  @Query('SELECT * FROM WebAppClientKeysFromSql')
  Future<List<WebAppClientKeysFromSql>> findAllWebAppClientDataKeys();

  @Query('SELECT * FROM WebAppClientKeysFromSql WHERE id = :id')
  Stream<WebAppClientKeysFromSql> findWebAppClientDataKeyById(int id);


  @Query('SELECT * FROM WebAppClientKeysFromSql WHERE TY = :TY and CL = :CL')
  Stream<WebAppClientKeysFromSql> findWebAppClientDataKeyByTYandCL(int TY, int CL);

  @insert
  Future<int> insertWebClientData(WebAppClientKeysFromSql webAppClientDataKeys);


  @insert
  Future<List<int>> insertWebClientDataList(List<WebAppClientKeysFromSql> WebClientData);

  @Query('SELECT * FROM WebAppClientKeysFromSql')
  Stream<List<WebAppClientKeysFromSql>> findAllWebAppClientDataKeysAsStream(); // stream return

  @Query('DELETE FROM WebAppClientKeysFromSql')
  Future<void> deleteAllWebAppClientDataKeys(); // query without returning an entity

}