import 'course.dart';

class GeneralCourse extends Course {
  GeneralCourse(
      {required super.title, required super.id, required super.unitCount});

  @override
  String toString() {
    return 'GeneralCourse{}';
  }
}
