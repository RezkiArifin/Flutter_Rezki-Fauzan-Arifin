import 'dart:io';

void main() {
  const phi = 3.14; // tentukan nilai phi
  int r; // r adalah jari-jari lingkaran

  print("Masukkan panjang jari-jari lingkaran: ");
  r = int.parse(stdin.readLineSync()!);

  double luas = phi * r * r; // rumus luas lingkarang
  double keliling = 2 * (phi * r); // rumus keliling lingkaran

  print("Luas lingkaran adalah $luas");
  print("Keliling lingkaran adalah $keliling");
}
