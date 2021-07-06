import 'dart:convert';


class ThingsPageTextItems {
  final String NAME;
  final String MANUFACTURER;
  final String SERIAL_NUMBER;
  final String ACQUIRED;
  final List<Location> LOCATIONS;

  ThingsPageTextItems(
      {this.NAME,
      this.MANUFACTURER,
      this.ACQUIRED,
      this.LOCATIONS,
      this.SERIAL_NUMBER});

  factory ThingsPageTextItems.fromJson(Map<String, dynamic> json) {
    return ThingsPageTextItems(
        NAME: json['NAME'],
        MANUFACTURER: json['MANUFACTURER'],
        ACQUIRED: json['ACQUIRED'],
        LOCATIONS: json['LOCATIONS'] != null
            ? (json['LOCATIONS'] as List)
                .map((e) => Location.fromJson(e))
                .toList()
            : null,
        SERIAL_NUMBER: json['SERIAL_NUMBER']);
  }

  Map<String, dynamic> toJson() {
    return {
      'NAME': NAME,
      'MANUFACTURER': MANUFACTURER,
      'LOCATIONS': LOCATIONS,
      'SERIAL_NUMBER': SERIAL_NUMBER,
      'ACQUIRED': ACQUIRED
    };
  }

// @override
// String toString() {
// return '{"TIR":$TIR,"IRE":$IRE,"LA": $LA,"NK":$NK,"IRD":$IRD,"DK":$DK}';
// }
}
class Location {
  final int PK;
  final String LOC;

  Location({
    this.PK,
    this.LOC,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      PK: json['PK'],
      LOC: json['LOC'],
    );
  }
}



