import 'package:flutter/widgets.dart';

import 'time_bloc.dart';
import 'alarm_bloc.dart';

class BlocHolder extends StatefulWidget {
  final Widget child;

  BlocHolder({this.child});

  @override
  _BlocHolderState createState() => _BlocHolderState();
}

class _BlocHolderState extends State<BlocHolder> {
  final TimeBloc _timeBloc = TimeBloc();
  final AlarmBloc _alarmBloc = AlarmBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      timeBloc: _timeBloc,
      alarmBloc: _alarmBloc,
      child: widget.child);
  }

  @override
  void dispose() {
    _timeBloc.dispose();
    _alarmBloc.dispose();
    super.dispose();
  }
}

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
