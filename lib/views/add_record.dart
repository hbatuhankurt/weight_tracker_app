import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class AddRecordView extends StatefulWidget {
  const AddRecordView({Key? key}) : super(key: key);

  @override
  State<AddRecordView> createState() => _AddRecordViewState();
}

class _AddRecordViewState extends State<AddRecordView> {
  int _selectedValue = 70;
  DateTime _selectedDate = DateTime.now();

  void pickDate(BuildContext context) async {
    var initalDate = DateTime.now();
    _selectedDate = await showDatePicker(
            context: context,
            initialDate: initalDate,
            firstDate: initalDate.subtract(const Duration(days: 365)),
            lastDate: initalDate.add(const Duration(days: 30)),
            builder: (context, child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  colorScheme: const ColorScheme(
                      brightness: Brightness.light,
                      primary: Colors.black87,
                      onPrimary: Colors.white,
                      secondary: Colors.yellow,
                      onSecondary: Colors.blue,
                      error: Colors.red,
                      onError: Colors.orange,
                      background: Colors.blueAccent,
                      onBackground: Colors.blueGrey,
                      surface: Colors.blue,
                      onSurface: Colors.black26),
                ),
                child: child ?? const Text(""),
              );
            }) ??
        _selectedDate;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Record"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(FontAwesomeIcons.weightScale, size: 40),
                    Stack(alignment: Alignment.bottomCenter, children: [
                      NumberPicker(
                        itemCount: 3,
                        itemWidth: 80,
                        itemHeight: 50,
                        step: 1,
                        axis: Axis.horizontal,
                        minValue: 40,
                        maxValue: 130,
                        value: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        },
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                      const Icon(
                        FontAwesomeIcons.chevronUp,
                        size: 16,
                      ),
                    ]),
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              pickDate(context);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.calendar,
                      size: 40,
                    ),
                    Expanded(
                      child: Text(
                        DateFormat.yMMMMd('en_US').format(_selectedDate),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text('Note Card'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Save Record"),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
