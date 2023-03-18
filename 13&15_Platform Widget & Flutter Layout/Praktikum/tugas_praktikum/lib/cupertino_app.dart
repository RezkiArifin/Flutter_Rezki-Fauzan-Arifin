import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: HomeScreen(),
      theme: CupertinoThemeData(primaryColor: Colors.blue),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      backgroundColor: Colors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color(0xFF303030),
        middle: Text(
          "Cupertino App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      child: Center(
        child: Text(
          "This is CupertinoApp",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
