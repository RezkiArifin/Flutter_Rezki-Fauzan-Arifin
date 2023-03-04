class kalkulator {
  void penjumlahan(int angka1, int angka2) {
    int total = angka1 + angka2;
    print(total);
  }

  void pengurangan(int angka1, int angka2) {
    int total = angka1 - angka2;
    print(total);
  }

  void perkalian(int angka1, int angka2) {
    int total = angka1 * angka2;
    print(total);
  }

  void pembagian(int angka1, int angka2) {
    var total = angka1 / angka2;
    print(total);
  }
}

void main(List<String> args) {
  var method = kalkulator();
  int angkaKe1 = 10;
  int angkaKe2 = 5;

  method.penjumlahan(angkaKe1, angkaKe2);
  method.pengurangan(angkaKe1, angkaKe2);
  method.perkalian(angkaKe1, angkaKe2);
  method.pembagian(angkaKe1, angkaKe2);
}
