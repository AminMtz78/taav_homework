import 'course.dart';
import 'student.dart';

class Semester {
  final int id;
  final String title;
  final List<Course> _courses = [];

  Semester(this.id, this.title);

  void addCourse({
    required String title,
    required int id,
    required int unitCount,
  }) {
    final Course newCourse = Course(
      title: title,
      id: id,
      unitCount: unitCount,
    );
  }

  void addStudentToCourse({
    required int id,
    required String name,
    required int courseId,
  }) {
    final newStudent = Student(name, id);
    final int courseIndex =
        _courses.indexWhere((element) => element.id == courseId);

    if (courseIndex != -1) {
      _courses[courseIndex].students.add(newStudent);
    }
  }

  @override
  String toString() {
    return 'Semester{id: $id, title: $title, courses: $_courses}';
  }
}
