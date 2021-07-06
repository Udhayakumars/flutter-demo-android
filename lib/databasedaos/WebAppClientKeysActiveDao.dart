import 'package:MMLMobile/databasemodels/WebAppClientKeysActive.dart';
import 'package:floor/floor.dart';

@dao
abstract class  WebAppClientKeysActiveDao {

  @Query('SELECT * FROM WebAppClientKeysActive')
  Future<List<WebAppClientKeysActive>> findAllWebAppClientDataKeys();

  @Query('SELECT * FROM WebAppClientKeysActive WHERE id = :id')
  Stream<WebAppClientKeysActive> findWebAppClientDataKeyById(int id);


  @Query('SELECT * FROM WebAppClientKeysActive WHERE TY = :TY and CL = :CL')
  Stream<WebAppClientKeysActive> findWebAppClientDataKeyByTYandCL(int TY, int CL);

  @insert
  Future<int> insertWebClientData(WebAppClientKeysActive webAppClientDataKeys);


  @insert
  Future<List<int>> insertWebClientDataList(List<WebAppClientKeysActive> WebClientData);

  @Query('SELECT * FROM WebAppClientKeysActive')
  Stream<List<WebAppClientKeysActive>> findAllWebAppClientDataKeysAsStream(); // stream return

  @Query('DELETE FROM WebAppClientKeysActive')
  Future<void> deleteAllWebAppClientDataKeys(); // query without returning an entity

}