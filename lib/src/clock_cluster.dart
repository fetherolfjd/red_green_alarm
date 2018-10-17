import 'package:flutter/material.dart';

import 'clock.dart';
import 'alarm_time_page.dart';
import 'hour_minute_text.dart';
import 'bloc_provider.dart';

class ClockCluster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alarmBloc = BlocProvider.of(context).alarmBloc;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Clock(),
        IconButton(
          icon: Icon(Icons.add_alarm, color: Colors.white),
          tooltip: 'Set alarm',
          onPressed: () => Navigator.of(context).pushNamed(AlarmTimePage.routeName)
        ),
        StreamBuilder<String>(
          stream: alarmBloc.alarmTime,
          builder: (context, snapshot) {
            return ColorText(snapshot.data, Colors.white);
          }
        ),
      ],
    );
  }
}
