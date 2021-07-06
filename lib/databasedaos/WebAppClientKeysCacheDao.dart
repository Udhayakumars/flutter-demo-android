import 'package:MMLMobile/databasemodels/WebAppClientKeysCache.dart';
import 'package:floor/floor.dart';

@dao
abstract class WebAppClientKeysCacheDao {

  @Query('SELECT * FROM WebAppClientKeysCache')
  Future<List<WebAppClientKeysCache>> findAllWebAppClientDataKeys();

  @Query('SELECT * FROM WebAppClientKeysCache WHERE id = :id')
  Stream<WebAppClientKeysCache> findWebAppClientDataKeyById(int id);


  @Query('SELECT * FROM WebAppClientKeysCache WHERE TY = :TY and CL = :CL')
  Stream<WebAppClientKeysCache> findWebAppClientDataKeyByTYandCL(int TY, int CL);

  @insert
  Future<int> insertWebClientData(WebAppClientKeysCache webAppClientDataKeys);


  @insert
  Future<List<int>> insertWebClientDataList(List<WebAppClientKeysCache> WebClientData);

  @Query('SELECT * FROM WebAppClientKeysCache')
  Stream<List<WebAppClientKeysCache>> findAllWebAppClientDataKeysAsStream(); // stream return

  @Query('DELETE FROM WebAppClientKeysCache')
  Future<void> deleteAllWebAppClientDataKeys(); // query without returning an entity

}