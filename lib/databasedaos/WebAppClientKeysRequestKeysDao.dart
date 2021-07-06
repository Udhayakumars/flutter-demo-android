import 'package:MMLMobile/databasemodels/WebAppClientDataKeys.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysRequestKeys.dart';
import 'package:floor/floor.dart';

@dao
abstract class  WebAppClientKeysRequestKeysDao {

  @Query('SELECT * FROM WebAppClientKeysRequestKeys')
  Future<List<WebAppClientKeysRequestKeys>> findAllWebAppClientDataKeys();

  @Query('SELECT * FROM WebAppClientKeysRequestKeys WHERE id = :id')
  Stream<WebAppClientKeysRequestKeys> findWebAppClientDataKeyById(int id);


  @Query('SELECT * FROM WebAppClientKeysRequestKeys WHERE TY = :TY and CL = :CL')
  Stream<WebAppClientKeysRequestKeys> findWebAppClientDataKeyByTYandCL(int TY, int CL);

  @insert
  Future<int> insertWebClientData(WebAppClientKeysRequestKeys webAppClientDataKeys);


  @insert
  Future<List<int>> insertWebClientDataList(List<WebAppClientKeysRequestKeys> WebClientData);

  @Query('SELECT * FROM WebAppClientKeysRequestKeys')
  Stream<List<WebAppClientKeysRequestKeys>> findAllWebAppClientDataKeysAsStream(); // stream return

  @Query('DELETE FROM WebAppClientKeysRequestKeys')
  Future<void> deleteAllWebAppClientDataKeys(); // query without returning an entity

}