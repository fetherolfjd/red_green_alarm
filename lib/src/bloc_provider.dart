import 'package:flutter/widgets.dart';

import 'time_bloc.dart';
import 'alarm_bloc.dart';

class BlocProvider extends InheritedWidget {
  final TimeBloc timeBloc;
  final AlarmBloc alarmBloc;

  BlocProvider({
    Key key,
    TimeBloc timeBloc,
    AlarmBloc alarmBloc,
    Widget child
  }) : timeBloc = timeBloc ?? TimeBloc(),
       alarmBloc = alarmBloc ?? AlarmBloc(),
       super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWIdget) => true;

  static BlocProvider of(BuildContext context) => (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider);
}
