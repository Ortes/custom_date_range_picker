import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Date Range Picker",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, bottom: 16),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Choose a date Range',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${startDate != null ? DateFormat("dd, MMM").format(startDate!) : '-'} / ${endDate != null ? DateFormat("dd, MMM").format(endDate!) : '-'}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCustomDateRangePicker(
            context,
            dismissible: true,
            minimumDate: DateTime.now().subtract(const Duration(days: 30)),
            maximumDate: DateTime.now().add(const Duration(days: 30)),
            endDate: endDate,
            startDate: startDate,
            backgroundColor: Colors.white,
            primaryColor: Colors.green,
            onApplyClick: (start, end) {
              setState(() {
                endDate = end;
                startDate = start;
              });
            },
            onCancelClick: () {
              setState(() {
                endDate = null;
                startDate = null;
              });
            },
            locale: const Locale('fr', 'FR'),
            cancelButtonText: 'Annuler',
            applyButtonText: 'Appliquer',
            fromText: 'Du',
            toText: 'Au',
          );
        },
        tooltip: 'choose date Range',
        child: const Icon(Icons.calendar_today_outlined, color: Colors.white),
      ),
    );
  }
}
