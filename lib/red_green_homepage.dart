import 'package:flutter/material.dart';

import './hour_minute_clock.dart';
import './alarm_time_page.dart';

class RedGreenHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            child: HourMinuteClock(Colors.black)
          ),
          RedLight(),
          GreenLight(),
          IconButton(
            icon: Icon(Icons.add_alarm),
            tooltip: 'Set alarm',
            onPressed: () => Navigator.of(context).pushNamed(AlarmTimePage.routeName)
          )
        ],
      )
    )
  );
}

class RedLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    height: 200.0,
    width: 200.0,
    child: RaisedButton(
      color: Colors.red,
      shape: CircleBorder(),
      onPressed: () => null
    )
  );
}

class GreenLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    height: 200.0,
    width: 200.0,
    child: RaisedButton(
      color: Colors.green,
      shape: CircleBorder(),
      onPressed: () => null
    )
  );
}
