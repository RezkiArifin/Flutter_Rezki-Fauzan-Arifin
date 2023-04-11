import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../services/contact_services.dart';

class UpdateContactPage extends StatefulWidget {
  final String idContact;
  const UpdateContactPage({
    super.key,
    required this.idContact,
  });

  @override
  State<UpdateContactPage> createState() => _UpdateContactPageState();
}

class _UpdateContactPageState extends State<UpdateContactPage> {
  String _username = "";
  String _phoneNumber = "";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Contact"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ContactServices().getInfoContact(widget.idContact),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return formContact(
              name: snapshot.data?.name,
              phone: snapshot.data?.phone,
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  SingleChildScrollView formContact({
    String? name,
    String? phone,
  }) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: name ?? "",
              onChanged: (value) {
                _username = value;
              },
              decoration: const InputDecoration(
                hintText: "Nama",
                labelText: "Nama",
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            IntlPhoneField(
              initialValue: phone ?? "",
              initialCountryCode: 'ID',
              invalidNumberMessage: 'Nomor Telepon Tidak Sesuai',
              disableLengthCheck: true,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (PhoneNumber phoneNumber) {
                _phoneNumber = phoneNumber.number;
              },
              decoration: const InputDecoration(
                hintText: 'Phone Number',
                labelText: 'Phone Number',
              ),
            ),
            isLoading
                ? const CircularProgressIndicator()
                : Container(
                    padding: const EdgeInsets.only(top: 10),
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () async {
                        isLoading = true;
                        setState(() {});
                        await ContactServices().putContact(
                          name: _username,
                          phone: _phoneNumber,
                          idContact: widget.idContact,
                        );

                        Future.delayed(const Duration(milliseconds: 500), () {
                          isLoading = false;
                          setState(() {});
                        });
                      },
                      child: const Text("update contact"),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
