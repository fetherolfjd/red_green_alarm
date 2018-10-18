import 'package:flutter/material.dart';
import 'package:screen/screen.dart';

import 'src/bloc_provider.dart';
import 'src/alarm_time_page.dart';
import 'src/red_green_homepage.dart';

void main() => runApp(RedGreenApp());

class RedGreenApp extends StatelessWidget {

  RedGreenApp() {
    Screen.keepOn(true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocHolder(
      child: MaterialApp(
        home: RedGreenHomepage(),
        routes: <String, WidgetBuilder>{
          AlarmTimePage.routeName: (context) => AlarmTimePage()
        }
      ),
    );
  }

}
