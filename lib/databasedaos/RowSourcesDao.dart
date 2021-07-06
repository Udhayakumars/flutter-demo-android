import 'package:MMLMobile/databasemodels/RowSources.dart';
import 'package:floor/floor.dart';

@dao
abstract class  RowSourcesDao {

  @Query('SELECT * FROM RowSources')
  Future<List<RowSources>> findAllRowSourcesKeys();

  @Query('SELECT * FROM RowSources WHERE id = :id')
  Stream<RowSources> findRowSourcesById(int id);

  @insert
  Future<int> insertRowSource(RowSources rawSource);

  @insert
  Future<List<int>> insertRowSourcesList(List<RowSources> rkList);

  @Query('SELECT * FROM RowSources')
  Stream<List<RowSources>> findAllRowSourcesAsStream(); // stream return

//RS_X_X
//   @Query('SELECT * FROM RowSources where keyValue: keyValue')
//   Stream<List<RowSources>> findAllRowSourceskeyValueAsStream(String keyValue);

  @Query('DELETE FROM RowSources')
  Future<void> deleteAllRowSources(); // query without returning an entity



}