import 'package:MMLMobile/databasemodels/WebAppClientDataKeys.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysPageTab.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysToSql.dart';
import 'package:floor/floor.dart';

@dao
abstract class  WebAppClientKeysPageTabDao {

  @Query('SELECT * FROM WebAppClientKeysPageTab ')
  Future<List<WebAppClientKeysPageTab>> findAllWebAppClientDataKeys();

  @Query('SELECT * FROM WebAppClientKeysPageTab WHERE id = :id')
  Stream<WebAppClientKeysPageTab> findWebAppClientDataKeyById(int id);


  @Query('SELECT * FROM WebAppClientKeysPageTab  WHERE TY = :TY and CL = :CL')
  Stream<WebAppClientKeysPageTab> findWebAppClientDataKeyByTYandCL(int TY, int CL);

  @insert
  Future<int> insertWebClientData(WebAppClientKeysPageTab  webAppClientDataKeys);


  @insert
  Future<List<int>> insertWebClientDataList(List<WebAppClientKeysPageTab> WebClientData);

  @Query('SELECT * FROM WebAppClientKeysPageTab')
  Stream<List<WebAppClientKeysToSql>> findAllWebAppClientDataKeysAsStream(); // stream return

  @Query('DELETE FROM WebAppClientKeysPageTab')
  Future<void> deleteAllWebAppClientDataKeys(); // query without returning an entity

}