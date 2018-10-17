
class TimeFormatter {
  static String formatDateTime(DateTime dateTime) {
    if (dateTime == null) {
      return '--:--';
    } else {
      return '${dateTime.hour.toString()}:${dateTime.minute.toString().padLeft(2, '0')}';
    }
  }
}
