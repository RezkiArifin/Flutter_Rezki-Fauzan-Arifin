void main() async {
  var faktorialAsync = await faktorial();
  print(faktorialAsync);
}

Future<int> faktorial() {
  return Future.delayed(Duration(seconds: 1), () {
    int angka = 5;
    int faktorial = 1;

    for (int i = 1; i <= angka; i++) {
      faktorial *= i;
    }
    return faktorial;
  });
}
