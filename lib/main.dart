import 'package:flutter/material.dart';

import './hour_minute_clock.dart';

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

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       backgroundColor: Colors.black,
  //       body: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Container(
  //               height: 50.0,
  //               width: 50.0,
  //               child: HourMinuteClock(Colors.white)
  //             ),
  //             Container(
  //               height: 200.0,
  //               width: 200.0,
  //               margin: const EdgeInsets.only(bottom: 20.0),
  //               child: RaisedButton(
  //                 color: Colors.redAccent,
  //                 shape: CircleBorder(),
  //                 onPressed: () => null,
  //               ),
  //             ),
  //             Container(
  //               height: 200.0,
  //               width: 200.0,
  //               child: RaisedButton(
  //                 color: Colors.greenAccent,
  //                 shape: CircleBorder(),
  //                 onPressed: () => null,
  //               )
  //             )
  //           ]
  //         )
  //       )
  //     )
  //   );
  // }

}
