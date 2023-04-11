import 'package:flutter/material.dart';
import 'package:tugas_dio/page/create_contact_page.dart';
import 'package:tugas_dio/page/update_contact_page.dart';

import '../services/contact_services.dart';

class ListContactPage extends StatefulWidget {
  const ListContactPage({super.key});

  @override
  State<ListContactPage> createState() => _ListContactPageState();
}

class _ListContactPageState extends State<ListContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Belajar Dio"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ContactServices().getContact(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var _contact = snapshot.data;
            return ListView.builder(
              itemCount: _contact?.length,
              itemBuilder: (context, index) {
                var data = _contact?[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 24,
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateContactPage(
                          idContact: data?.id.toString() ?? "",
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(_contact?[index].name ?? ""),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(_contact?[index].phone ?? ""),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          height: 1,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text("error");
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const CreateContactPage();
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 36,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
