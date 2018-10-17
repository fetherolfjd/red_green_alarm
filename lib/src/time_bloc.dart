import 'dart:async';
import 'package:rxdart/subjects.dart';

import 'time_formatter.dart';


class TimeBloc {
  final BehaviorSubject<String> _clockTime = BehaviorSubject<String>(seedValue: TimeFormatter.formatDateTime(DateTime.now()));
  Timer _clockTimer;

  Stream<String> get timeString => _clockTime.stream;

  TimeBloc() {
    _clockTimer = Timer.periodic(Duration(seconds: 1), _generateTime);
  }

  void dispose() {
    _clockTime.close();
    _clockTimer.cancel();
  }

  void _generateTime(Timer timer) {
    _clockTime.add(TimeFormatter.formatDateTime(DateTime.now()));
  }
}
