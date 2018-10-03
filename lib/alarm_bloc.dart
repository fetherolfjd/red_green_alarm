import 'dart:async';
import 'package:rxdart/subjects.dart';

import './alarm.dart';

class AlarmUpdate {
  final DateTime alarmTime;

  AlarmUpdate(this.alarmTime);
}

class TimeUpdate {
  final DateTime currentTime;

  TimeUpdate(this.currentTime);
}

class AlarmBloc {
  final Alarm _alarm = Alarm();

  final StreamController<AlarmUpdate> _alarmUpdateController = StreamController<AlarmUpdate>();

  final StreamController<TimeUpdate> _timeUpdateController = StreamController<TimeUpdate>();

  final BehaviorSubject<bool> _alarmOn = BehaviorSubject<bool>(seedValue: false);

  AlarmBloc() {
    _alarmUpdateController.stream.listen((alarmUpdate) {
      _alarm.alarmTime = alarmUpdate.alarmTime;
      if (DateTime.now().isBefore(_alarm.alarmTime)) {
        _alarmOn.add((false));
      }
    });
    _timeUpdateController.stream.listen((timeUpdate) {
      if (_alarm.alarmTime != null && timeUpdate.currentTime.isAfter(_alarm.alarmTime)) {
        _alarmOn.add(true);
      } else {
        _alarmOn.add(false);
      }
    });
  }

  Sink<AlarmUpdate> get alarmUpdate => _alarmUpdateController.sink;

  Sink<TimeUpdate> get timeUpdate => _timeUpdateController.sink;

  Stream<bool> get alarmOn => _alarmOn.stream;

  void dispose() {
    _alarmOn.close();
    _alarmUpdateController.close();
    _timeUpdateController.close();
  }

}
