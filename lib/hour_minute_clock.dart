import 'package:flutter/material.dart';
import 'dart:async';

import './alarm_provider.dart';
import './alarm_bloc.dart';

class HourMinuteClock extends StatefulWidget {

  Color textColor;

  HourMinuteClock(Color color) : this.textColor = color;

  @override
  _HourMinuteClockState createState() => _HourMinuteClockState();
}

class _HourMinuteClockState extends State<HourMinuteClock> {

  DateTime _datetime = DateTime.now();

  _HourMinuteClockState() {
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
    return Text('${_datetime.hour}:${_datetime.minute.toString().padLeft(2, '0')}',
      style: TextStyle(
        color: widget.textColor
      )
    );
  }
}
