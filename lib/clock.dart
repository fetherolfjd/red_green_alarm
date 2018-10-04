import 'dart:async';
import 'package:flutter/material.dart';

import 'alarm_provider.dart';
import 'alarm_bloc.dart';
import 'hour_minute_text.dart';

class Clock extends StatefulWidget {
  @override createState() => _ClockState();
}

class _ClockState extends State<Clock> {

  DateTime _datetime = DateTime.now();

  _ClockState() {
    Timer.periodic(Duration(seconds:1), _setDateTime);
  }

  _setDateTime(Timer timer) {
    setState(() {
      _datetime = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    final alarmBloc = AlarmProvider.of(context);
    alarmBloc.timeUpdate.add(TimeUpdate(_datetime));
    return HourMinuteText(Colors.white, _datetime);
  }

}
