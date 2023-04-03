import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String imagePath = ModalRoute.of(context)!.settings.arguments == null
        ? "NULL"
        : ModalRoute.of(context)!.settings.arguments as String;
    if (imagePath != "NULL") {
      Image.asset(imagePath);
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Halaman Baru'),
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
