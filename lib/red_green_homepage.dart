import 'package:flutter/material.dart';

import './clock.dart';
import './alarm_time_page.dart';
import 'red_green_lights.dart';
import 'alarm_provider.dart';
import 'hour_minute_text.dart';

class RedGreenHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alarmBloc = AlarmProvider.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50.0,
              width: 50.0,
              child: Clock()
            ),
            RedGreenLights(),
            IconButton(
              icon: Icon(Icons.add_alarm, color: Colors.white),
              tooltip: 'Set alarm',
              onPressed: () => Navigator.of(context).pushNamed(AlarmTimePage.routeName)
            ),
            Container(
              height: 50.0,
              width: 50.0,
              child: StreamBuilder<DateTime>(
                stream: alarmBloc.alarmTime,
                builder: (context, snapshot) {
                  return HourMinuteText(Colors.white, snapshot.data);
                }
              )
            ),
          ],
        )
      )
    );
  }
}
