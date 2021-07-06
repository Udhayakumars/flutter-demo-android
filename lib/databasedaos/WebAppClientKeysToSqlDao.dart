import 'package:MMLMobile/databasemodels/WebAppClientDataKeys.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysToSql.dart';
import 'package:floor/floor.dart';

@dao
abstract class  WebAppClientKeysToSqlDao {

  @Query('SELECT * FROM WebAppClientKeysToSql')
  Future<List<WebAppClientKeysToSql>> findAllWebAppClientDataKeys();

  @Query('SELECT * FROM WebAppClientKeysToSql WHERE id = :id')
  Stream<WebAppClientKeysToSql> findWebAppClientDataKeyById(int id);


  @Query('SELECT * FROM WebAppClientKeysToSql WHERE TY = :TY and CL = :CL')
  Stream<WebAppClientKeysToSql> findWebAppClientDataKeyByTYandCL(int TY, int CL);

  @insert
  Future<int> insertWebClientData(WebAppClientKeysToSql webAppClientDataKeys);


  @insert
  Future<List<int>> insertWebClientDataList(List<WebAppClientKeysToSql> WebClientData);

  @Query('SELECT * FROM WebAppClientKeysToSql')
  Stream<List<WebAppClientKeysToSql>> findAllWebAppClientDataKeysAsStream(); // stream return

  @Query('DELETE FROM WebAppClientKeysToSql')
  Future<void> deleteAllWebAppClientDataKeys(); // query without returning an entity

}