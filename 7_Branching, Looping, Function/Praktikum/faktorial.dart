import 'dart:io';

void main() {
  int angka; // buat variable bilangan bulat yang ingin dicari faktorialnya
  int faktorial = 1;

  print("masukkan bilangan bulat: "); // input bilangan bulat
  angka = int.parse(stdin.readLineSync()!);
  for (int i = 1; i <= angka; i++) {
    faktorial *= i; // rumus menghitung bilangan bulat
  }
  print("faktorial dari $angka adalah $faktorial");
}
