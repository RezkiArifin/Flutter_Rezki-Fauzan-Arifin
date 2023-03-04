class Course {
  String judul;
  String deskripsi;

  Course({required this.judul, required this.deskripsi});
}

class Student {
  String nama;
  String kelas;
  List<Course> courses = [];

  Student({required this.nama, required this.kelas});

  void tambahCourse(Course course) {
    courses.add(course);
  }

  void hapusCourse(Course course) {
    courses.remove(course);
  }

  void lihatCourses() {
    if (courses.isNotEmpty) {
      print('list course dari nama ${nama}:');
      for (var course in courses) {
        print('- ${course.judul}');
      }
    } else {
      print('${nama} tidak mempunyai course');
    }
  }
}

void main() {
  var penjaskes = Course(judul: 'penjaskes', deskripsi: 'berolahraga');
  var matematika = Course(judul: 'matematika', deskripsi: 'belajar berhitung');

  var john = Student(nama: 'Rezki', kelas: '12');
  john.tambahCourse(penjaskes);
  john.tambahCourse(matematika);
  john.lihatCourses();

  var jane = Student(nama: 'Arifin', kelas: '11');
  jane.tambahCourse(matematika);
  jane.lihatCourses();

  john.hapusCourse(matematika);
  john.lihatCourses();
}
