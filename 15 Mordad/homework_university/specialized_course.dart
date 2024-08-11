import 'course.dart';

class Specializedcourse extends Course {
  Specializedcourse(
      {required super.title, required super.id, required super.unitCount});

  @override
  String toString() {
    return 'Specializedcourse{}';
  }
}
