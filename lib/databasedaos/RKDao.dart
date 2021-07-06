import 'package:MMLMobile/databasemodels/RK.dart';
import 'package:MMLMobile/databasemodels/WebAppClientDataKeys.dart';
import 'package:floor/floor.dart';

@dao
abstract class  RKDao {

  @Query('SELECT * FROM RK')
  Future<List<RK>> findAllWebAppClientDataKeys();

  @Query('SELECT * FROM RK WHERE id = :id')
  Stream<RK> findWebAppClientDataKeyById(int id);

  @insert
  Future<int> insertRK(RK rk);

  @insert
  Future<List<int>> insertRKList(List<RK> rkList);

  @Query('SELECT * FROM WebAppClientDataKeys')
  Stream<List<RK>> findAllRKsAsStream(); // stream return

  @Query('DELETE FROM RK')
  Future<void> deleteAllRKs(); // query without returning an entity

}