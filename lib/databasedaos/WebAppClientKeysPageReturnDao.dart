import 'package:MMLMobile/databasemodels/WebAppClientKeysPageReturn.dart';
// import 'package:MMLMobile/databasemodels/WebAppClientKeysPageTab.dart';
import 'package:floor/floor.dart';

@dao
abstract class WebAppClientKeysPageReturnDao {
  @Query('SELECT * FROM WebAppClientKeysPageReturn ')
  Future<List<WebAppClientKeysPageReturn>> findAllWebAppClientKeysPageReturn();

  @Query('SELECT * FROM WebAppClientKeysPageReturn WHERE id = :id')
  Stream<WebAppClientKeysPageReturn> findWebAppClientKeysPageReturnById(int id);

  @Query(
      'SELECT * FROM WebAppClientKeysPageReturn  WHERE TY = :TY and CL = :CL')
  Stream<WebAppClientKeysPageReturn> findWebAppClientKeysPageReturnByTYandCL(
      int TY, int CL);

  @Query('DELETE FROM WebAppClientKeysPageReturn')
  Future<void>
      deleteAllWebAppClientKeysPageReturn(); // query without returning an entity

}
