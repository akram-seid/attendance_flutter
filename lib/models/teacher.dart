// To parse this JSON data, do
//
//     final teacher = teacherFromJson(jsonString);

import 'dart:convert';

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));

String teacherToJson(Teacher data) => json.encode(data.toJson());

class Teacher {
  Teacher({
    required this.message,
    required this.error,
    required this.id,
  });

  String message;
  bool error;
  String id;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        message: json["Message"],
        error: json["error"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "error": error,
        "id": id,
      };
}
