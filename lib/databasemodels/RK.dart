
import 'package:MMLMobile/databasemodels/RowSources.dart';
import 'package:floor/floor.dart';

@Entity(
  tableName: 'RK',
  foreignKeys: [
    ForeignKey(
      childColumns: ['rowsource_id'],
      parentColumns: ['id'],
      entity: RowSources,
    )
  ],
)

@entity
class RK {

  @PrimaryKey(autoGenerate: true)
  final int id;

  @ColumnInfo(name: 'rowsource_id')
  final int rowsource_id;

  final int P;
  final int C;
  final int I;
  final bool U;



  RK({this.id, this.rowsource_id, this.P, this.C, this.I, this.U});

  factory RK.fromJson(Map<String, dynamic> json) {
    return RK(
      rowsource_id: json['rowsource_id'],
      P: json['P'],
      C: json['C'],
      I: json['I'],
      U: json['U'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rowsource_id' : rowsource_id,
      'P': P,
      'C': C,
      'I': I,
      'U': U,
    };
  }

//P": 193,
// "C": 153,
// "I": 10,
// "U": true
}