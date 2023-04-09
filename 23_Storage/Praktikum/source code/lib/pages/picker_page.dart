import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_filex/open_filex.dart';

class Picker extends StatefulWidget {
  const Picker({Key? key}) : super(key: key);

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  DateTime _duDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.orange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive widget'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ///date picker
            buildDatePicker(context),
            const SizedBox(
              height: 20,
            ),

            ///color picker
            buildColorPicker(context),

            ///file picker
            buildFilePicker()
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
                onPressed: () async {
                  final selectDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(currentDate.year + 5));
                  setState(() {
                    if (selectDate != null) {
                      _duDate = selectDate;
                    }
                  });
                },
                child: const Text('Select')),
          ],
        ),
        Text(DateFormat('dd-MM-yyy').format(_duDate)),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_currentColor)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Pick Your Color"),
                          content: SingleChildScrollView(
                            child: SlidePicker(
                              pickerColor: _currentColor,
                              onColorChanged: (color) {
                                setState(() {
                                  _currentColor = color;
                                });
                              },
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('saved'))
                          ],
                        );
                      });
                },
                child: const Text('Pick Color')))
      ],
    );
  }

  Widget buildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pick File'),
        const SizedBox(height: 10),
        Center(
          child: Center(
            child: ElevatedButton(
                onPressed: () {
                  _pickFile();
                },
                child: const Text('Pick and Open File')),
          ),
        )
      ],
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

  void _openFile(PlatformFile file) {
    OpenFilex.open(file.path);
  }
}
