import 'package:flutter/material.dart';

import 'clock_cluster.dart';
import 'lights.dart';

class RedGreenHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: OrientationBuilder(
        builder: (context, orientation) {
          final width = MediaQuery.of(context).size.width;
          final height = MediaQuery.of(context).size.height;
          if (orientation == Orientation.landscape) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClockCluster(),
                _buildRedLight(orientation, width, height),
                _buildGreenLight(orientation, width, height),
              ]
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClockCluster(),
                _buildRedLight(orientation, width, height),
                _buildGreenLight(orientation, width, height),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildRedLight(Orientation orientation, double width, double height) {
    return _buildLight(orientation, width, height, RedLight());
  }

  Widget _buildGreenLight(Orientation orientation, double width, double height) {
    return _buildLight(orientation, width, height, GreenLight());
  }

  Widget _buildLight(Orientation orientation, double width, double height, Widget childWidget) {
    double largeDimension = width > height ? width : height;
    double totalWidgetSpace = largeDimension * 0.4;
    double widgetSpace = totalWidgetSpace * 0.9;
    double widgetMargin = totalWidgetSpace * 0.1;
    EdgeInsetsGeometry edgeInset = orientation == Orientation.portrait ? EdgeInsets.only(top: widgetMargin) : EdgeInsets.only(left: widgetMargin);
    return Container(
      height: widgetSpace,
      width: widgetSpace,
      margin: edgeInset,
      child: childWidget
    );
  }
}
