import 'dart:convert';

import 'package:floor/floor.dart';

// Prci688Stack Fields:
// id - primary key
// PTIR - Parent Treeview ID Record
// TIR - Treeview ID Record
// DATE - date record added to table
// CCT - Children Count for this PTIR (does nooot incll the records from Lazy Swipe actions)
// PFK - preference Key - Format: PG_33_PRCI_688_{PTIR} PG_33, Organization is Page 33, PRCI_688 - Control ID for Folder View

@entity
class Prci688Stack {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final int PTIR;
  final int DTID;
  final String PFK;
  final DateTime DATE;
  final int CCT;

  Prci688Stack(
      {this.id, this.PTIR,this.PFK, this.CCT, this.DTID, this.DATE});

  factory Prci688Stack.fromJson(Map<String, dynamic> json) {
    return Prci688Stack(
        id: json['id'],
        PTIR: json['PTIR'],
        DTID: json['DTID'],
        PFK: json['PFK'],
        CCT: json['CCT'],
        DATE: json['DATE'] == null
            ? null
            : ((json['DATE'] is DateTime)
                ? json['DATE']
                : DateTime.parse(json['DATE'])));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'PTIR': PTIR,
      'DTID': DTID,
      'PFK': PFK,
      'CCT': CCT,
      'DATE':DATE
    };
  }
}
