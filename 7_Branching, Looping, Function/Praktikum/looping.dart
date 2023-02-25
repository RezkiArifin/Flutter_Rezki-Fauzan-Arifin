import 'dart:io';

void main() {
  int bintang; //buat variable bintang

  print("masukka jumlah bintang: "); // input jumlah bintang
  bintang = int.parse(stdin.readLineSync()!); // membaca inputan

  for (int i = 1; i <= bintang; i++) {
    for (int j = 1; j <= bintang - i; j++) {
      stdout.write(' ');
    }
    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write('*');
    }
    stdout.write('\n');
  }
}
