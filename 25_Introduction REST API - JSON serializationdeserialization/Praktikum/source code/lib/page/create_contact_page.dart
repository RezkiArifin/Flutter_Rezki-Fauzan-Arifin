import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../services/contact_services.dart';

class CreateContactPage extends StatefulWidget {
  const CreateContactPage({super.key});

  @override
  State<CreateContactPage> createState() => _CreateContactPageState();
}

class _CreateContactPageState extends State<CreateContactPage> {
  String _username = "";
  String _phoneNumber = "";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Contact"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
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
                          await ContactServices().postContact(
                            context,
                            name: _username,
                            phone: _phoneNumber,
                          );

                          Future.delayed(const Duration(milliseconds: 500), () {
                            isLoading = false;
                            setState(() {});
                          });
                        },
                        child: const Text("Register"),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
