void main() {
  List<int> nilai = [7, 5, 3, 5, 2, 1];
  int total = 0;

  for (int angka in nilai) {
    total += angka;
  }

  double rataRata = total / nilai.length;
  int rataRataBulat = rataRata.ceil();
  // ceil adalah library dart untuk melakukan pembulatan keatas

  print("list nilai: $nilai");
  print("nilai rata-ratanya ialah: $rataRataBulat");
}
