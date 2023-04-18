import 'package:belajar/pages/picker_page.dart';
import 'package:belajar/styles/colors_style.dart';
import 'package:belajar/styles/text_style.dart';
import 'package:belajar/widgets/form_contact_widget.dart';
import 'package:belajar/widgets/list_contact_widget.dart';
import 'package:flutter/material.dart';

import 'models/contact_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Contact'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _namaController = TextEditingController();
  final _noTelpController = TextEditingController();

  final List<ContactModel> _contactModel = [];

  @override
  void dispose() {
    _namaController.dispose();
    _noTelpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: const Color(0xFF424242),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF424242),
        child: ListView(
          children: const [
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Icon(
                Icons.mobile_friendly,
              ),
              const SizedBox(height: 17),
              Text(
                "Create New Contacts",
                style: m3Medium,
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Text(
                      "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
                      style: m3Medium.copyWith(
                        fontSize: 14,
                        color: m3Color,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(
                      height: 1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  FormContactWidget(
                    controller: _namaController,
                    labelText: "Nama",
                    hintText: "Insert Your Name",
                  ),
                  FormContactWidget(
                    controller: _noTelpController,
                    labelText: "Nomor",
                    hintText: "+62 ....",
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        _contactModel.add(
                          ContactModel(
                            nama: _namaController.text,
                            noTelp: _noTelpController.text,
                          ),
                        );
                        _namaController.clear();
                        _noTelpController.clear();

                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6750A4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: const Text("Submit"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 49),
              Text(
                "List Contacts",
                style: m3Medium,
              ),
              ListContactWidget(
                contactModel: _contactModel,
                namaController: _namaController,
                noTelpController: _noTelpController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        backgroundColor: const Color(0xFF303030),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
