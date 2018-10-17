import 'package:flutter/material.dart';

import 'lights.dart';

class RedGreenLights extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        height: 250.0,
        width: 250.0,
        margin: const EdgeInsets.only(bottom: 20.0),
        child: RedLight()
      ),
      Container(
        height: 250.0,
        width: 250.0,
        child: GreenLight()
      ),
    ],
  );
}
