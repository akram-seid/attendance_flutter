// To parse this JSON data, do
//
//     final studId = studIdFromJson(jsonString);

import 'dart:convert';

StudId studIdFromJson(String str) => StudId.fromJson(json.decode(str));

String studIdToJson(StudId data) => json.encode(data.toJson());

class StudId {
  StudId({
    required this.message,
    required this.error,
    required this.idlist,
  });

  String message;
  bool error;
  List<String> idlist;

  factory StudId.fromJson(Map<String, dynamic> json) => StudId(
        message: json["Message"],
        error: json["error"],
        idlist: List<String>.from(json["idlist"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "error": error,
        "idlist": List<dynamic>.from(idlist.map((x) => x)),
      };
}
