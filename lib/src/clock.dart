import 'package:flutter/material.dart';

import 'bloc_provider.dart';
import 'hour_minute_text.dart';

class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timeBloc = BlocProvider.of(context).timeBloc;
    return StreamBuilder<String>(
      stream: timeBloc.timeString,
      builder: (context, snapshot) {
        return ColorText(snapshot.data, Colors.white);
      }
    );
  }
}
