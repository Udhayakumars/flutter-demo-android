
import 'package:MMLMobile/databasemodels/RowSources_RS_12_2.dart';
import 'package:MMLMobile/databasemodels/RowSources_RS_31_42_2_6.dart';
import 'package:floor/floor.dart';

@dao
abstract class  RowSources_RS_31_42_2_6Dao {

  @Query('SELECT * FROM RowSources_RS_31_42_2_6')
  Future<List<RowSources_RS_31_42_2_6>> findAllRowSources();

  @Query('SELECT * FROM RowSources_RS_31_42_2_6 WHERE id = :id')
  Stream<RowSources_RS_31_42_2_6> findRowSourcesById(int id);

  @insert
  Future<int> insertRowSource(RowSources_RS_31_42_2_6 rawSource);

  @insert
  Future<List<int>> insertRowSourcesList(List<RowSources_RS_31_42_2_6> rkList);

  @Query('SELECT * FROM RowSources_RS_31_42_2_6')
  Stream<List<RowSources_RS_31_42_2_6>> findAllRowSourcesAsStream(); // stream return

//RS_X_X
//   @Query('SELECT * FROM RowSources where keyValue: keyValue')
//   Stream<List<RowSources>> findAllRowSourceskeyValueAsStream(String keyValue);

  @Query('DELETE FROM RowSources_RS_31_42_2_6')
  Future<void> deleteAllRowSources(); // query without returning an entity



}