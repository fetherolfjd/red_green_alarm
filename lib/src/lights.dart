import 'package:flutter/material.dart';

import 'bloc_provider.dart';

class Light extends StatelessWidget {

  final Color _onColor;
  final Color _offColor;

  Light(this._onColor, this._offColor);

  @override
  Widget build(BuildContext context) {
    final alarmBloc = BlocProvider.of(context).alarmBloc;
    return StreamBuilder<bool>(
      initialData: false,
      stream: alarmBloc.alarmOn,
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: () => null,
          shape: CircleBorder(),
          color: (snapshot != null && snapshot.data) ? _onColor : _offColor
        );
      },
    );
  }
}

class GreenLight extends Light {
  GreenLight() : super(Color.fromRGBO(0, 255, 0, 1.0), Color.fromRGBO(0, 51, 0, 1.0));
}

class RedLight extends Light {
  RedLight() : super(Color.fromRGBO(51, 0, 0, 1.0), Color.fromRGBO(255, 0, 0, 1.0));
}
