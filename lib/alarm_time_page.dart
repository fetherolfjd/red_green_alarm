import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';

class AlarmTimePage extends StatelessWidget {
  AlarmTimePage();

  static const routeName = "/set-alarm";

  final timeFormat = DateFormat("HH:mm");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set alarm time'),
        centerTitle: true,
      ),
      body: Form(
        autovalidate: true,
        child: TimePickerFormField(
          format: timeFormat,
          onChanged: (time) {
            print(time.toString());
          }
        )
      )
    );
  }

}
