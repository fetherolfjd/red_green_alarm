import 'dart:async';
import 'package:rxdart/subjects.dart';

import 'time_formatter.dart';

class TimeUpdate {
  final DateTime currentTime;

  TimeUpdate(this.currentTime);
}

class AlarmBloc {
  final StreamController<DateTime> _alarmUpdateController = StreamController<DateTime>();

  final BehaviorSubject<String> _alarmTime = BehaviorSubject<String>(seedValue: TimeFormatter.formatDateTime(null));

  final BehaviorSubject<bool> _alarmOn = BehaviorSubject<bool>(seedValue: false);

  DateTime tempalarmTime;
  Timer _alarmTimeChecker;

  AlarmBloc() {
    _alarmUpdateController.stream.listen((alarmDateTime) {
      _alarmOn.add(false);
      tempalarmTime = alarmDateTime;
      _clearAlarmTimeChecker();
      if (alarmTime != null) {
        _alarmTimeChecker = Timer.periodic(Duration(seconds: 1), _checkAlarm);
        _alarmTime.add(TimeFormatter.formatDateTime(tempalarmTime));
      }
    });
  }

  Sink<DateTime> get alarmUpdate => _alarmUpdateController.sink;

  Stream<bool> get alarmOn => _alarmOn.stream;

  Stream<String> get alarmTime => _alarmTime.stream;

  void dispose() {
    _clearAlarmTimeChecker();
    _alarmOn.close();
    _alarmTime.close();
    _alarmUpdateController.close();
  }

  void _checkAlarm(Timer timer) {
    if (tempalarmTime != null) {
      DateTime now = DateTime.now();
      if (now.isAfter(tempalarmTime)) {
        _alarmOn.add(true);
        _alarmTime.add(TimeFormatter.formatDateTime(null));
      }
    }
  }

  void _clearAlarmTimeChecker() {
    if (_alarmTimeChecker != null) {
      _alarmTimeChecker.cancel();
      _alarmTimeChecker = null;
    }
  }

}
