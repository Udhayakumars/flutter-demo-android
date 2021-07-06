
import 'package:MMLMobile/databasemodels/WebAppClientData.dart';
import 'package:floor/floor.dart';

@dao
abstract class WebAppClientDataDao {

  @Query('SELECT * FROM WebAppClientData')
  Future<List<WebAppClientData>> findAllWebAppClientData();

  // @Query('SELECT * FROM WebClientData WHERE PI = :PI')
  // Stream<WebClientData> findJsonWebClientDataById(int id);

  @Query('SELECT * FROM WebAppClientData WHERE id = :id')
  Future<WebAppClientData> findWebAppClientDataById(int id);

  @insert
  Future<int> insertWebAppClientData(WebAppClientData jsonWebClientData);

  @insert
  Future<List<int>> insertWebAppClientDataList(List<WebAppClientData> WebClientData);

  @Query('SELECT * FROM WebAppClientData')
  Stream<List<WebAppClientData>> findAllJsonWebClientDataAsStream(); // stream return

  @Query('DELETE FROM WebAppClientData')
  Future<void> deleteAllWebAppClientData(); // query without returning an entity

  @transaction
  Future<void> replaceWebClientData(List<WebAppClientData> WebAppClientData) async {
    await deleteAllWebAppClientData();
    await insertWebAppClientDataList(WebAppClientData);
  }

}