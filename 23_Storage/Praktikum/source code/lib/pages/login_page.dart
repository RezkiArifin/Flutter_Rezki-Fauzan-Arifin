import 'package:belajar/main.dart';
import 'package:belajar/utils/shared_pref.dart';
import 'package:belajar/widgets/text_field_costume.dart';
import 'package:flutter/material.dart';

import '../styles/text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // username property
  String _username = "";
  bool _isUsernameValid = true;
  String _errorUserNameMessage = "";

  // username property
  String _password = "";
  bool _isPassValid = true;
  String _errorPassMessage = "";
  bool _isHidePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Page"),
        backgroundColor: const Color(0xFF424242),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            "Login",
            style: m3Medium,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFieldCostume(
                  onChanged: (value) {
                    _username = value;
                    if (_username.isEmpty) {
                      _isUsernameValid = false;
                      _errorUserNameMessage = "Username Tidak Boleh Kosong!";
                    } else if (_username[0] != _username[0].toUpperCase()) {
                      _isUsernameValid = false;
                      _errorUserNameMessage =
                          "Gunakan Huruf kapital diawal kata!";
                    } else if (_username.length < 4) {
                      _isUsernameValid = false;
                      _errorUserNameMessage = "Harus lebih dari 4 kata";
                    } else {
                      _isUsernameValid = true;
                    }
                    setState(() {});
                  },
                  isValidTextField: _isUsernameValid,
                  errorMessage: _errorUserNameMessage,
                  hintText: "Username",
                ),
                TextFieldCostume(
                  onChanged: (value) {
                    _password = value;
                    if (_password.isEmpty) {
                      _isPassValid = false;
                      _errorPassMessage = "Username Tidak Boleh Kosong!";
                    } else if (_password[0] != _password[0].toUpperCase()) {
                      _isPassValid = false;
                      _errorPassMessage = "Gunakan Huruf kapital diawal kata!";
                    } else {
                      _isPassValid = true;
                    }
                    setState(() {});
                  },
                  isValidTextField: _isPassValid,
                  errorMessage: _errorPassMessage,
                  hintText: "Password",
                  isObscureText: _isHidePass,
                  suffixIconWidget: IconButton(
                    onPressed: () {
                      _isHidePass = !_isHidePass;
                      setState(() {});
                    },
                    icon: _isHidePass
                        ? const Icon(Icons.lock)
                        : const Icon(Icons.lock_open),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MyHomePage(title: "Contact"),
                          ),
                        );
                        saveToken(valueToken: _username);
                      },
                      child: const Text("Login"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
