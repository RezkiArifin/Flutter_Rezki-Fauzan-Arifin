import 'package:flutter/material.dart';
import 'package:praktikum/models/image_model.dart';
import 'package:praktikum/pages/image_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const MyHomePage(),
        '/halamanBaru': (_) => const ImagePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List _listImage = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Galery'),
      ),
      body: Material(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: _listImage.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _showBottomSheet(context, _listImage[index]);
              },
              child: Image.asset(
                _listImage[index].imagePath,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }

  // fungsi untuk menampilkan bottomsheet
  void _showBottomSheet(BuildContext context, ImageModel image) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                  image.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    _showImageDialog(context, image);
                  },
                  child: Image.asset(
                    image.imagePath,
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
  void _showImageDialog(BuildContext context, ImageModel image) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(image.name),
          content: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(image.imagePath),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ya'),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/halamanBaru', arguments: image.imagePath);
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
