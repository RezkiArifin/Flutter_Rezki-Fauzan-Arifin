import 'dart:io';

class Hewan {
  String nama = "Hewan";
  int beratBadan = 0;
}

class Sapi extends Hewan {
  Sapi() {
    nama = "sapi";
    beratBadan = 10;
  }
}

class Ayam extends Hewan {
  Ayam() {
    nama = "ayam";
    beratBadan = 3;
  }
}

class Mobil {
  int kapasitas = 26;
  List<String> muatan = [];
  void tambahMuatan(int beratBadan, String hewan) {
    if (kapasitas - beratBadan >= 0) {
      muatan.add(hewan);
      kapasitas -= beratBadan;
      print("muatan berhasil ditambahkan");
    } else {
      print("muatan telah memenuhi kapasitas");
      while (kapasitas == 0) {
        break;
      }
    }
  }
}

void main() {
  var tampung = Mobil();
  var a1 = Ayam();
  var s1 = Sapi();

  while (tampung.kapasitas > 0) {
    stdout.write("masukkan nama hewan: ");
    String? strInput = stdin.readLineSync();
    if (strInput == s1.nama) {
      tampung.tambahMuatan(s1.beratBadan, s1.nama);
    } else if (strInput == a1.nama) {
      tampung.tambahMuatan(a1.beratBadan, a1.nama);
    } else {
      print("tidak ada hewan yang dimaksud");
    }
  }
}
