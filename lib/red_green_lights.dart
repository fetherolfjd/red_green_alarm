import 'package:flutter/material.dart';

import 'alarm_provider.dart';

// dark green (light off): 0 51 0
// green (light on): 0 255 0
// dark red (light off): 51 0 0
// red (light on): 255 0 0

class RedGreenLights extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        height: 200.0,
        width: 200.0,
        margin: const EdgeInsets.only(bottom: 20.0),
        child: RedLight()
      ),
      Container(
        height: 200.0,
        width: 200.0,
        child: GreenLight()
      ),
    ],
  );
}

class RedLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alarmBloc = AlarmProvider.of(context);
    return StreamBuilder<bool>(
      stream: alarmBloc.alarmOn,
      builder: (context, snapshot) {
        Color color = (snapshot != null && snapshot.data) ? Color.fromRGBO(51, 0, 0, 1.0) : Color.fromRGBO(255, 0, 0, 1.0);
        return RaisedButton(
          color: color,
          shape: CircleBorder(),
          onPressed: () => null
        );
      }
    );
  }
}

class GreenLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alarmBloc = AlarmProvider.of(context);
    return StreamBuilder<bool>(
      stream: alarmBloc.alarmOn,
      builder: (context, snapshot) {
        Color color = snapshot.data ? Color.fromRGBO(0, 255, 0, 1.0) : Color.fromRGBO(0, 51, 0, 1.0);
        return RaisedButton(
          color: color,
          shape: CircleBorder(),
          onPressed: () => null
        );
      }
    );
  }
}
