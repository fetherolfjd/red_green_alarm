import 'package:flutter/material.dart';

import './alarm_provider.dart';
import './alarm_time_page.dart';
import './red_green_homepage.dart';

void main() => runApp(RedGreenApp());

class RedGreenApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlarmProvider(
      child: MaterialApp(
        home: RedGreenHomepage(),
        routes: <String, WidgetBuilder>{
          AlarmTimePage.routeName: (context) => AlarmTimePage()
        }
      ),
    );
  }

}
