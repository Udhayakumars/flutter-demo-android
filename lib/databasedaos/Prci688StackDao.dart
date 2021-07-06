
import 'package:MMLMobile/databasemodels/Prci688Stack.dart';
import 'package:floor/floor.dart';

@dao
abstract class  Prci688StackDao {

  @Query('SELECT * FROM RowSources_RS_1_10_2')
  Future<List<Prci688Stack>> findAllRowSources();

  @Query('SELECT * FROM RowSources_RS_1_10_2 WHERE id = :id')
  Stream<Prci688Stack> findPrci688StacksById(int id);

  @insert
  Future<int> insertRowSource(Prci688Stack rawSource);

  @insert
  Future<List<int>> insertRowSourcesList(List<Prci688Stack> rkList);

  @Query('SELECT * FROM RowSources_RS_1_10_2')
  Stream<List<Prci688Stack>> findAllRowSourcesAsStream(); // stream return

//RS_X_X
//   @Query('SELECT * FROM RowSources where keyValue: keyValue')
//   Stream<List<RowSources>> findAllRowSourceskeyValueAsStream(String keyValue);

  @Query('DELETE FROM RowSources_RS_1_10_2')
  Future<void> deleteAllRowSources(); // query without returning an entity



}