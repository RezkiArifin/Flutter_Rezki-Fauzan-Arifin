import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:praktikum/pages/image_page.dart';
import 'package:praktikum/provider/list_image_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ListImageProvider>(
          create: (_) => ListImageProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
      home: const MyHomePage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/halamanBaru':
            return PageAnimationTransition(
              page: const ImagePage(),
              pageAnimationType: LeftToRightFadedTransition(),
            );
          default:
            return null;
        }
      },
      // routes: {
      //   '/': (_) => const MyHomePage(),
      //   '/halamanBaru': (_) => const ImagePage(),
      // },
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
    final listImageProvider = Provider.of<ListImageProvider>(context);
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
          itemCount: listImageProvider.listImage.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                listImageProvider.showBottomSheet(
                  context: context,
                  index: index,
                  listImageProvider: listImageProvider,
                );
              },
              child: Image.asset(
                listImageProvider.listImage[index].imagePath,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
