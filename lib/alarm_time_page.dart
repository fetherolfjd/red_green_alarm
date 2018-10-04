import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';

import 'alarm_provider.dart';
import 'alarm_bloc.dart';

class AlarmTimePage extends StatelessWidget {
  AlarmTimePage();

  static const routeName = "/set-alarm";

  final timeFormat = DateFormat("HH:mm");

  @override
  Widget build(BuildContext context) {
    final alarmBloc = AlarmProvider.of(context);
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
            if (time == null) {
              alarmBloc.alarmUpdate.add(AlarmUpdate(null));
            } else {
              final now = DateTime.now();
              var alarmTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
              if (alarmTime.isBefore(now)) {
                alarmTime = alarmTime.add(Duration(days: 1));
              }
              alarmBloc.alarmUpdate.add(AlarmUpdate(alarmTime));
            }
          }
        )
      )
    );
  }

}
