import 'package:MMLMobile/databasemodels/WebAppClientDataKeys.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysRequestKeys.dart';
import 'package:MMLMobile/databasemodels/WebAppClientKeysRequestKeysInitially.dart';
import 'package:floor/floor.dart';

@dao
abstract class WebAppClientKeysRequestKeysInitiallyDao {
  @Query('SELECT * FROM WebAppClientKeysRequestKeysInitially')
  Future<List<WebAppClientKeysRequestKeysInitially>>
      findAllWebAppClientDataKeys();

  @Query('SELECT * FROM WebAppClientKeysRequestKeysInitially WHERE id = :id')
  Stream<WebAppClientKeysRequestKeysInitially> findWebAppClientDataKeyById(
      int id);

  @Query(
      'SELECT * FROM WebAppClientKeysRequestKeysInitially WHERE TY = :TY and CL = :CL')
  Stream<WebAppClientKeysRequestKeysInitially> findWebAppClientDataKeyByTYandCL(
      int TY, int CL);

  @insert
  Future<int> insertWebClientData(
      WebAppClientKeysRequestKeysInitially webAppClientDataKeys);

  @insert
  Future<List<int>> insertWebClientDataList(
      List<WebAppClientKeysRequestKeysInitially> WebClientData);

  @Query('SELECT * FROM WebAppClientKeysRequestKeysInitially')
  Stream<List<WebAppClientKeysRequestKeysInitially>>
      findAllWebAppClientDataKeysAsStream(); // stream return

  @Query('DELETE FROM WebAppClientKeysRequestKeysInitially')
  Future<void>
      deleteAllWebAppClientDataKeys(); // query without returning an entity

}
