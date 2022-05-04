// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
  Student({
    required this.message,
    required this.error,
    required this.id,
  });

  String message;
  bool error;
  String id;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
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
