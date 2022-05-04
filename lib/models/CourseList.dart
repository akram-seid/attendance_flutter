// To parse this JSON data, do
//
//     final courseList = courseListFromJson(jsonString);

import 'dart:convert';

CourseList courseListFromJson(String str) => CourseList.fromJson(json.decode(str));

String courseListToJson(CourseList data) => json.encode(data.toJson());

class CourseList {
    CourseList({
        required this.courselist,
    });

    List<String> courselist;

    factory CourseList.fromJson(Map<String, dynamic> json) => CourseList(
        courselist: List<String>.from(json["courselist"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "courselist": List<dynamic>.from(courselist.map((x) => x)),
    };
}
