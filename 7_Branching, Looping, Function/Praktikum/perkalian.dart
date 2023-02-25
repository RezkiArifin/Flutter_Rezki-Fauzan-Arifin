import 'dart:io';

void main() {
  int angka; //buatkan variable angka
  String output = ''; //buat variable tipe data string

  print("masukkan angka: "); // input angka yang ingin dihitung perkaliannya
  angka = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= angka; i++) {
    for (int j = 1; j <= angka; j++) {
      String result = (i * j).toString();
      output += '${result.padLeft(2)},';
    } //rumus perkalian
    output = output.substring(0, output.length - 1);
    output += '\n'; //rumus untuk membentuk tabel
  }
  print(output);
}
