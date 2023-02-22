import 'dart:io';

void main() {
  const phi = 3.14; // tentukan nilai phi
  int r; // r adalah jari-jari tabung
  int t; // t adalah tinggi tabung

  print("Masukkan panjang jari-jari tabung: ");
  r = int.parse(stdin.readLineSync()!);
  print("Masukkan tinggi jari-jari tabung: ");
  t = int.parse(stdin.readLineSync()!);

  double volume = phi * r * r * t; // rumus luas lingkarang

  print("Volume lingkaran adalah $volume");
}
