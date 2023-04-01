import 'package:flutter/material.dart';

import '../models/image_model.dart';

class ListImageProvider with ChangeNotifier {
  final List<ImageModel> _listImage = [
    ImageModel(name: 'Gambar 1', imagePath: 'assets/img/g1.jpg'),
    ImageModel(name: 'Gambar 2', imagePath: 'assets/img/g2.jpg'),
    ImageModel(name: 'Gambar 3', imagePath: 'assets/img/g3.jpg'),
    ImageModel(name: 'Gambar 4', imagePath: 'assets/img/g4.jpg'),
    ImageModel(name: 'Gambar 5', imagePath: 'assets/img/g5.jpg'),
    ImageModel(name: 'Gambar 6', imagePath: 'assets/img/g6.jpg'),
    ImageModel(name: 'Gambar 7', imagePath: 'assets/img/g7.png'),
    ImageModel(name: 'Gambar 8', imagePath: 'assets/img/g8.jpg'),
    ImageModel(name: 'Gambar 9', imagePath: 'assets/img/g9.jpg'),
    ImageModel(name: 'Gambar 10', imagePath: 'assets/img/g10.jpg'),
    ImageModel(name: 'Gambar 11', imagePath: 'assets/img/g11.jpg'),
    ImageModel(name: 'Gambar 12', imagePath: 'assets/img/g12.jpg'),
    ImageModel(name: 'Gambar 13', imagePath: 'assets/img/g13.jpg'),
  ];

  List<ImageModel> get listImage => _listImage;

  // fungsi untuk menampilkan bottomsheet
  void showBottomSheet({
    required BuildContext context,
    required int index,
    required ListImageProvider listImageProvider,
  }) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                  listImageProvider.listImage[index].name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    _showImageDialog(
                      context: context,
                      index: index,
                      listImageProvider: listImageProvider,
                    );
                  },
                  child: Image.asset(
                    listImageProvider.listImage[index].imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // fungsi untuk menampilkan dialog
  void _showImageDialog({
    required BuildContext context,
    required int index,
    required ListImageProvider listImageProvider,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(listImageProvider.listImage[index].name),
          content: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(listImageProvider.listImage[index].imagePath),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ya'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/halamanBaru',
                    arguments: listImageProvider.listImage[index].imagePath);
              },
            ),
            TextButton(
              child: const Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
