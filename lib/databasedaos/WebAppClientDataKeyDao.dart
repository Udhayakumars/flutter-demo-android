import 'package:MMLMobile/databasemodels/WebAppClientDataKeys.dart';
import 'package:floor/floor.dart';

@dao
abstract class  WebAppClientDataKeyDao {

  @Query('SELECT * FROM WebAppClientDataKeys')
  Future<List<WebAppClientDataKeys>> findAllWebAppClientDataKeys();

  @Query('SELECT * FROM WebAppClientDataKeys WHERE id = :id')
  Stream<WebAppClientDataKeys> findWebAppClientDataKeyById(int id);


  @Query('SELECT * FROM WebAppClientDataKeys WHERE TY = :TY and CL = :CL')
  Stream<WebAppClientDataKeys> findWebAppClientDataKeyByTYandCL(int TY, int CL);

  @insert
  Future<int> insertWebClientData(WebAppClientDataKeys webAppClientDataKeys);


  @insert
  Future<List<int>> insertWebClientDataList(List<WebAppClientDataKeys> WebClientData);

  @Query('SELECT * FROM WebAppClientDataKeys')
  Stream<List<WebAppClientDataKeys>> findAllWebAppClientDataKeysAsStream(); // stream return

  @Query('DELETE FROM WebAppClientDataKeys')
  Future<void> deleteAllWebAppClientDataKeys(); // query without returning an entity

}