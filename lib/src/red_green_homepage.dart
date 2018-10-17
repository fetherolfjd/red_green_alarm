import 'package:flutter/material.dart';

import 'red_green_lights.dart';
import 'bloc_provider.dart';
import 'clock_cluster.dart';

class RedGreenHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alarmBloc = BlocProvider.of(context).alarmBloc;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClockCluster(),
            RedGreenLights(),
          ],
        )
      )
    );
  }
}
