import 'package:flutter/material.dart';

import 'clock.dart';
import 'alarm_time_page.dart';
import 'color_text.dart';
import 'bloc_provider.dart';
import 'alarm_bloc.dart';

class ClockCluster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alarmBloc = BlocProvider.of(context).alarmBloc;
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildWidgetList(alarmBloc, context),
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildWidgetList(alarmBloc, context)
          );
        }
      },
    );
  }

  List<Widget> _buildWidgetList(AlarmBloc alarmBloc, BuildContext context) {
    return <Widget>[
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
    ];
  }
}
