import 'package:MMLMobile/databasemodels/WebAppClientData.dart';
import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
@entity
class WebAppClientKeysRequestKeys {
  @PrimaryKey(autoGenerate: true)
  final int id;

  @JsonKey(includeIfNull: false)
  final int TY;

  final int PC;
  final int CL;
  final int TI;
  final int UI;
  final bool RF;
  final bool SV;

  WebAppClientKeysRequestKeys({
    this.id,
    this.TY,
    this.PC,
    this.CL,
    this.TI,
    this.UI,
    this.RF,
    this.SV,
  });

  factory WebAppClientKeysRequestKeys.fromJson(Map<String, dynamic> json) {
    return WebAppClientKeysRequestKeys(
      TY: json['TY'] == null ? null : json["TY"],
      PC: json['PC'] == null ? null : json["PC"],
      CL: json['CL'] == null ? null : json["CL"],
      TI: json['TI'] == null ? null : json["TI"],
      UI: json['UI'] == null
          ? null
          : (json["UI"] is bool ? (json['UI'] == true ? 1 : 0) : json['UI']),
      RF: json['RF'] == null ? null : json["RF"],
      SV: json['SV'] == null ? null : json["SV"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'TY': TY == null ? null : TY,
      'PC': PC == null ? null : PC,
      'CL': CL == null ? null : CL,
      'TI': TI == null ? null : TI,
      'UI': UI == null ? null : UI,
      'RF': RF == null ? null : RF,
      'SV': SV == null ? null : SV,
    };
  }

  @override
  String toString() {
    return '{TY: $TY, PC: $PC, CL: $CL, TI: $TI, UI: $UI, RF: $RF, SV: $SV}';
  }
}
