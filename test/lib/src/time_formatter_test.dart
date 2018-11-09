import 'package:test/test.dart';

import 'package:red_green_alarm/src/time_formatter.dart';

void main() {
  group('Test Time Formatter', () {
    test('handles null', () {
      expect(TimeFormatter.formatDateTime(null), equals('--:--'));
    });

    test('correctly formats tims', () {
      DateTime now = DateTime.now();
      expect(TimeFormatter.formatDateTime(now), equals('${now.hour.toString()}:${now.minute.toString().padLeft(2, '0')}'));
    });
  });
}
