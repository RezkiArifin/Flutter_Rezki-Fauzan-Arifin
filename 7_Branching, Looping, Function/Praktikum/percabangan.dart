import 'dart:io';

void main() {
  int nilai; // buat variable nilai

  print("masukkan nilai: "); // input nilai
  nilai = int.parse(stdin.readLineSync()!); // membaca inputan

  if (nilai > 70) {
    print("nilai A"); // mereturn nilai A jika > 70
  } else if (nilai > 40) {
    print("nilai B"); // mereturn nilai B jika > 40
  } else {
    print("nilai C"); // mereturn nilai C jika <= 40
  }
}
