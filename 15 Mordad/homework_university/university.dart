import 'student.dart';
import 'location.dart';
import 'semester.dart';
import 'course.dart';

class University {
  final Location location;
  final String name;
  final int id;
  final List<Semester> _semesters = [];
  final List<Student> _students = [];

  University({
    required this.location,
    required this.name,
    required this.id,
  });

  void addStudent({
    required int id,
    required String name,
  }) {
    final newStudent = Student(name, id);
    _students.add(newStudent);
  }

  void addSemester({required String title, required int id}) {
    final newSemester = Semester(id, title);
    _semesters.add(newSemester);
  }

  List<Semester> get semesters => _semesters;

  void addCourseToSemesterBySemesterId({
    required int semesterId,
    required int courseId,
    required int courseUnitCount,
    required String courseTitle,
  }) {
    final int semesterIndex =
        _semesters.indexWhere((element) => element.id == semesterId);

    final isSemesterFound = semesterIndex != -1;

    if (isSemesterFound) {
      _semesters[semesterIndex].addCourse(
          title: courseTitle, id: courseId, unitCount: courseUnitCount);
    }
  }

  @override
  String toString() {
    return 'University{location: $location, name: $name, id: $id, semesters: $_semesters}';
  }

}
