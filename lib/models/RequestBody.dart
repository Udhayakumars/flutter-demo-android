import 'package:MMLMobile/models/InputObject.dart';

class RequestBody {
  final int AspNetUserID;
  final List<InputObject> RequestKeys;
  final bool IsMobile;

  RequestBody({this.AspNetUserID, this.RequestKeys, this.IsMobile});

  factory RequestBody.fromJson(Map<String, dynamic> json) {
    return RequestBody(
      AspNetUserID: json['AspNetUserID'],
      RequestKeys: json['RequestKeys'],
      IsMobile: json['IsMobile']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'AspNetUserID': AspNetUserID,
      'RequestKeys': RequestKeys,
      'IsMobile': IsMobile,
    };
  }

}
