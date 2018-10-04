import 'package:flutter/material.dart';

class HourMinuteText extends StatelessWidget {

  final Color _textColor;
  final DateTime _datetime;

  HourMinuteText(this._textColor, this._datetime);

  @override
  Widget build(BuildContext context) {
    var clockTxt;
    if (this._datetime == null) {
      clockTxt = '--:--';
    } else {
      clockTxt = '${_datetime.hour}:${_datetime.minute.toString().padLeft(2, '0')}';
    }
    return Text(clockTxt,
      style: TextStyle(
        color: _textColor
      )
    );
  }
}
