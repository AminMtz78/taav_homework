import 'university.dart';
import 'location.dart';

void main() {
  final Location shiraz = Location(title: 'shiraz', id: 1);

  final University taavUniversity = University(
    location: shiraz,
    name: 'taav',
    id: 100,
  );

  taavUniversity.addSemester(title: 'summer', id: 1);

  // taavUniversity.semesters.first.addCourse(title: title, id: id, unitCount: unitCount)



}
