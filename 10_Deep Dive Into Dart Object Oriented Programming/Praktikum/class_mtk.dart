class Matematika {
  hasil() {}
}

class KPK implements Matematika {
  late int x;
  late int y;

  KPK(int x, int y) {
    this.x = x;
    this.y = y;
  }

  @override
  hasil() {
    int lcm = getLCM(x, y);
    print("kelipatan persekutuan terkecil dari $x dan $y adalah $lcm");
  }

  int getLCM(int x, int y) {
    return (x * y) ~/ gcd(x, y);
  }

  int gcd(int x, int y) {
    return x.gcd(y);
  }
}

class FPB implements Matematika {
  late int x;
  late int y;

  FPB(int x, int y) {
    this.x = x;
    this.y = y;
  }

  @override
  hasil() {
    int hcf = gcd(x, y);
    print("faktor persekutuan terbesar dari $x dan $y adalah $hcf");
  }

  int gcd(int x, int y) {
    return x.gcd(y);
  }
}

void main() {
  var kpk = KPK(10, 25);
  var fpb = FPB(10, 25);

  kpk.hasil();
  fpb.hasil();
}
