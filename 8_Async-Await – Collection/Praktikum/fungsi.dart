Future<List<int>> perkalianList(List<int> listAngka, int angkaPengali) async {
  List<int> hasil = [];

  for (int i = 0; i < listAngka.length; i++) {
    int hasilKali = await Future(() => listAngka[i] * angkaPengali);
    hasil.add(hasilKali);
  }

  return hasil;
}

Future<void> main() async {
  var fungsi = await perkalianList([1, 2, 3, 4, 5], 2);
  print(fungsi);
}
