import 'dart:io';

void main() {
  int angka; //buat variable angka
  bool isPrima = true; // buat variable boolean untuk mengecek angka

  print("masukkan angka: "); // input angka yang ingin di cek
  angka = int.parse(stdin.readLineSync()!);

  for (int i = 2; i <= angka ~/ 2; i++) {
    if (angka % i == 0) {
      isPrima = false;
      break;
    }
  } //rumus untuk mencari bilangan prima

  if (isPrima) {
    print('$angka adalah bilangan prima');
  } else {
    print('$angka bukan bilangan prima');
  }
}
