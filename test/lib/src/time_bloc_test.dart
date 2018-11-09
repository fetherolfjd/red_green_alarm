import 'package:test/test.dart';

import 'package:red_green_alarm/src/time_bloc.dart';
import 'package:red_green_alarm/src/time_formatter.dart';

void main() {
  test('Test Time Bloc', () async {
    TimeBloc timeBloc = TimeBloc();
    timeBloc.timeString.listen((data) {
      expect(data, equals(TimeFormatter.formatDateTime(DateTime.now())));
    });
  });
}
