class DateUtil {
  static String formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);

    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    int day = parsedDate.day;
    String month = months[parsedDate.month - 1];
    int year = parsedDate.year;

    return '$month $day, $year';
  }
}
