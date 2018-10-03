import 'package:flutter/widgets.dart';

import './alarm_bloc.dart';

class AlarmProvider extends InheritedWidget {
  final AlarmBloc alarmBloc;

  AlarmProvider({
    Key key,
    AlarmBloc alarmBloc,
    Widget child
  }) : alarmBloc = alarmBloc ?? AlarmBloc(),
       super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AlarmBloc of(BuildContext context) => (context.inheritFromWidgetOfExactType(AlarmProvider) as AlarmProvider).alarmBloc;

}
