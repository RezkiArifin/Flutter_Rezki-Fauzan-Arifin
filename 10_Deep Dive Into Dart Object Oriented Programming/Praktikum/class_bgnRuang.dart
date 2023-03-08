class bangunRuang {
  var p = 0;
  var l = 0;
  var t = 0;

  volume() {}
}

class Kubus extends bangunRuang {
  var sisi = 0;

  @override
  volume() {
    var hasil = sisi * sisi * sisi;
    print("volume kubus : $hasil");
  }
}

class Balok extends bangunRuang {
  @override
  volume() {
    var hasil = p * l * t;
    print("volume balok: $hasil");
  }
}

void main() {
  var kubus = Kubus();
  kubus.sisi = 6;

  var balok = Balok();
  balok.p = 12;
  balok.l = 8;
  balok.t = 10;

  kubus.volume();
  balok.volume();
}
