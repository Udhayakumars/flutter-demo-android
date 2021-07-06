import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
@entity
class WebAppClientKeysPageReturn {
  @PrimaryKey(autoGenerate: true)
  final int PageReturnID;

  @JsonKey(includeIfNull: false)
  final int PI_CHILD;

  final int TY;
  final int PC;
  final int CL;
  final int TI;
  final bool UI;
  final bool RF;
  final bool SV;

  WebAppClientKeysPageReturn(
      {this.PageReturnID,
      this.PI_CHILD,
      this.TY,
      this.PC,
      this.CL,
      this.TI,
      this.UI,
      this.RF,
      this.SV});

  factory WebAppClientKeysPageReturn.fromJson(Map<String, dynamic> json) {
    return WebAppClientKeysPageReturn(
      PI_CHILD: json['PI_CHILD'] ? null : json['PI_CHILD'],
      TY: json['TY'] == null ? null : json["TY"],
      PC: json['PC'] == null ? null : json["PC"],
      CL: json['CL'] == null ? null : json["CL"],
      TI: json['TI'] == null ? null : json["TI"],
      UI: json['UI'] == null ? null : json["UI"],
      RF: json['RF'] == null ? null : json["RF"],
      SV: json['SV'] == null ? null : json["SV"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PI_CHILD': PI_CHILD == null ? null : PI_CHILD,
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
    return '{PI_CHILD: $PI_CHILD,TY: $TY, PC: $PC, CL: $CL, TI: $TI, UI: $UI, RF: $RF, SV: $SV}';
  }
}
