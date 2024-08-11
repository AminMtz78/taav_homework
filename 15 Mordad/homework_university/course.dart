import 'dart:ffi';

import 'student.dart';

class Course {
  String title;
  int id;
  int unitCount;
  final List<Student> _students = [];

  List<Student> get students => _students;

  Course({
    required this.title,
    required this.id,
    required this.unitCount,
  });



  @override
  String toString() {
    return 'Course{title: $title, id: $id, unitCount: $unitCount}';
  }
}
