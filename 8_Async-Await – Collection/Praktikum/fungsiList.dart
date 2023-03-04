void main() {
  List<List<String>> dataDiri = [
    ["Rezki", "Makassar"],
    ["Anto", "Bandung"],
    ["Jaka", "Jakarta"],
    ["Tio", "Malang"],
  ];

  Map<String, String> dataMap = Map.fromIterable(
    dataDiri,
    key: (nama) => nama[0],
    value: (kota) => kota[1],
  );

  print(dataMap);
}
