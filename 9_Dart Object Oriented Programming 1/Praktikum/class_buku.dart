class Buku {
  int id;
  String judul;
  String penerbit;
  double harga;
  String kategori;

  Buku(
      {required this.id,
      required this.judul,
      required this.penerbit,
      required this.harga,
      required this.kategori});
}

class tokoBukuu {
  List<Buku> _Buku = [];

  void addBuku(Buku Buku) {
    _Buku.add(Buku);
    print('Buku dengan id ${Buku.id} telah berhasil ditambahkan.');
  }

  List<Buku> getAllBuku() {
    return _Buku;
  }

  void deleteBuku(int id) {
    _Buku.removeWhere((Buku) => Buku.id == id);
    print('Buku dengan id $id telah berhasil dihapus.');
  }
}

void main() {
  var tokoBuku = tokoBukuu();

  //menambahkan buku
  var Buku1 = Buku(
      id: 1,
      judul: 'Si Kancil dan Buaya',
      penerbit: 'Rezki Fauzan',
      harga: 50.000,
      kategori: 'Fiksi');
  var Buku2 = Buku(
      id: 2,
      judul: 'Cara Hebat Untuk Menjadi Programmer',
      penerbit: 'Alterra Academy',
      harga: 250.000,
      kategori: 'Edukasi');
  tokoBuku.addBuku(Buku1);
  tokoBuku.addBuku(Buku2);

  //menampilkan semua buku
  var semuaBuku = tokoBuku.getAllBuku();
  print('Semua Buku: ');
  semuaBuku.forEach((Buku) => print(' - ${Buku.judul}'));

  //menghapus buku
  tokoBuku.deleteBuku(1);

  //menampilkan semua buku kembali
  semuaBuku = tokoBuku.getAllBuku();
  print('Semua Buku: ');
  semuaBuku.forEach((Buku) => print(' - ${Buku.judul}'));
}
