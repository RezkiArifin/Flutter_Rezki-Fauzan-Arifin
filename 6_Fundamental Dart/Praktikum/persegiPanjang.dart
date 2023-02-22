import 'dart:io';

void main() {
  int p; // p adalah panjang
  int l; // l adalah lebar

  print("masukkan panjang persegi panjang: ");
  p = int.parse(stdin.readLineSync()!);
  print("masukkan lebar persegi panjang: ");
  l = int.parse(stdin.readLineSync()!);

  int luas = p * l; //rumus menghitung luas persegi panjang
  int keliling = 2 * (p + l); //rumus menghitung keliling persegi panjang

  print("Luas persegi panjang ialah: $luas");
  print("Keliling persegi panjang ialah: $keliling");
}
