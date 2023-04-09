import 'package:flutter/material.dart';
import '../models/contact_model.dart';
import '../styles/colors_style.dart';
import '../styles/text_style.dart';

class ListContactWidget extends StatefulWidget {
  final TextEditingController namaController;
  final TextEditingController noTelpController;
  final List<ContactModel> contactModel;

  const ListContactWidget({
    super.key,
    required this.namaController,
    required this.noTelpController,
    required this.contactModel,
  });

  @override
  State<ListContactWidget> createState() => _ListContactWidgetState();
}

class _ListContactWidgetState extends State<ListContactWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10, bottom: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: pink,
        ),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.contactModel.length,
            itemBuilder: (context, index) {
              final data = widget.contactModel[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: primaryContainer,
                  child: Text(
                    data.nama.toString()[0].toUpperCase(),
                    style: m3TitleMedium,
                  ),
                ),
                title: Text(
                  data.nama,
                  style: m3Medium.copyWith(fontSize: 16, letterSpacing: 0.5),
                ),
                subtitle: Text(
                  data.noTelp,
                  style: m3Medium.copyWith(
                    fontSize: 14,
                    letterSpacing: 0.25,
                    color: m3Color,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                    const SizedBox(width: 5),
                    IconButton(
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: Text('Yakin ingin Menghapus ${data.nama}'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                widget.contactModel.removeAt(index);
                                setState(() {});
                                Navigator.pop(context, 'OK');
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
