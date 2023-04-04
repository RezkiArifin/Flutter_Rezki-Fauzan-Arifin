import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum/bloc/photos_bloc.dart';
import 'package:praktikum/models/image_model.dart';
import 'package:praktikum/pages/image_page.dart';
import 'package:praktikum/style/image_style.dart';

final List<ImageModel> listImage = [
  ImageModel(name: 'Gambar 1', imagePath: imageg1),
  ImageModel(name: 'Gambar 2', imagePath: imageg2),
  ImageModel(name: 'Gambar 3', imagePath: imageg3),
  ImageModel(name: 'Gambar 4', imagePath: imageg4),
  ImageModel(name: 'Gambar 5', imagePath: imageg5),
  ImageModel(name: 'Gambar 6', imagePath: imageg6),
  ImageModel(name: 'Gambar 7', imagePath: imageg7),
  ImageModel(name: 'Gambar 8', imagePath: imageg8),
  ImageModel(name: 'Gambar 9', imagePath: imageg9),
  ImageModel(name: 'Gambar 10', imagePath: imageg10),
  ImageModel(name: 'Gambar 11', imagePath: imageg11),
  ImageModel(name: 'Gambar 12', imagePath: imageg12),
  ImageModel(name: 'Gambar 13', imagePath: imageg13),
];

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Galery'),
        ),
        body: BlocProvider<PhotosBloc>(
          create: (context) => PhotosBloc(),
          child:
              BlocBuilder<PhotosBloc, PhotosState>(builder: (context, state) {
            BlocProvider.of<PhotosBloc>(context).add(FetchImagePhotosEvent());
            if (state is PhotosSuccessLoaded) {
              return Material(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: state.images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _showBottomSheet(context, state.images[index]);
                      },
                      child: Image.asset(
                        state.images[index].imagePath,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              );
            } else {
              return Container();
            }
          }),
        ));
  }

  // fungsi untuk menampilkan bottomsheet
  void _showBottomSheet(BuildContext context, ImageModel image) {
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
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        closePage();
                      },
                      icon: const Icon(Icons.close),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Text(
                      image.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
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

  void closePage() {
    Navigator.pop(context);
  }

  // fungsi untuk menampilkan dialog
  void _showImageDialog(BuildContext context, ImageModel image) {
    closePage();
    showDialog(
      barrierDismissible: false,
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
                closePage();
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
