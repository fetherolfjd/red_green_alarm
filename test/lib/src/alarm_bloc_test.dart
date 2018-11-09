import 'package:test/test.dart';

import 'package:red_green_alarm/src/alarm_bloc.dart';
import 'package:red_green_alarm/src/time_formatter.dart';

void main() {
  group('Test Alarm Bloc', () {
    AlarmBloc alarmBloc;
    setUp(() {
      alarmBloc = AlarmBloc();
    });

    test('starts not alarmed', () {
      alarmBloc.alarmOn.listen((alarmState) {
        expect(alarmState, equals(false));
      });
      alarmBloc.alarmTime.listen((alarmTimeString) {
        expect(alarmTimeString, equals('--:--'));
      });
    });

    test('alarm time gets set and alarms', () {
      DateTime now = DateTime.now();
      alarmBloc.alarmUpdate.add(now.add(Duration(seconds: 2)));
      alarmBloc.alarmOn.take(2).listen((alarmState) {
        expect(alarmState, equals(false));
      });
      alarmBloc.alarmOn.last.then((alarmState) {
        expect(alarmState, equals(true));
      });
      alarmBloc.alarmTime.first.then((alarmTimeString) {
        expect(alarmTimeString, equals('--:--'));
      });
      alarmBloc.alarmTime.last.then((alarmTimeString) {
        expect(alarmTimeString, equals(TimeFormatter.formatDateTime(now)));
      });
    });
  });
}
