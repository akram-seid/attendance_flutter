// To parse this JSON data, do
//
//     final sectionList = sectionListFromJson(jsonString);

import 'dart:convert';

SectionList sectionListFromJson(String str) => SectionList.fromJson(json.decode(str));

String sectionListToJson(SectionList data) => json.encode(data.toJson());

class SectionList {
    SectionList({
        required this.message,
        required this.error,
        required this.sectionlist,
    });

    String message;
    bool error;
    List<String> sectionlist;

    factory SectionList.fromJson(Map<String, dynamic> json) => SectionList(
        message: json["Message"],
        error: json["error"],
        sectionlist: List<String>.from(json["sectionlist"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Message": message,
        "error": error,
        "sectionlist": List<dynamic>.from(sectionlist.map((x) => x)),
    };
}
