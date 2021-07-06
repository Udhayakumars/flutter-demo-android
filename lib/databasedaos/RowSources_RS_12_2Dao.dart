
import 'package:MMLMobile/databasemodels/RowSources_RS_12_2.dart';
import 'package:floor/floor.dart';

@dao
abstract class  RowSources_RS_12_2Dao {

  @Query('SELECT * FROM RowSources_RS_12_2')
  Future<List<RowSources_RS_12_2>> findAllRowSources();

  @Query('SELECT * FROM RowSources_RS_12_2 WHERE id = :id')
  Stream<RowSources_RS_12_2> findRowSourcesById(int id);

  @insert
  Future<int> insertRowSource(RowSources_RS_12_2 rawSource);

  @insert
  Future<List<int>> insertRowSourcesList(List<RowSources_RS_12_2> rkList);

  @Query('SELECT * FROM RowSources_RS_12_2')
  Stream<List<RowSources_RS_12_2>> findAllRowSourcesAsStream(); // stream return

//RS_X_X
//   @Query('SELECT * FROM RowSources where keyValue: keyValue')
//   Stream<List<RowSources>> findAllRowSourceskeyValueAsStream(String keyValue);

  @Query('DELETE FROM RowSources_RS_12_2')
  Future<void> deleteAllRowSources(); // query without returning an entity



}