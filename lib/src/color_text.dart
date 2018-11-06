import 'package:flutter/material.dart';

class ColorText extends StatelessWidget {
  final String _clockText;
  final Color _textColor;

  ColorText(this._clockText, this._textColor);

  @override
  Widget build(BuildContext context) {
    return Text(_clockText ?? '',
      style: TextStyle(
        color: _textColor,
        fontSize: 32.0,
      )
    );
  }
}
