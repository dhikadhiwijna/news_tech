String formatDate(String date) {
  final DateTime dateTime = DateTime.parse(date);

  // parse to 01 January 2021
  final String formattedDate =
      '${dateTime.day} ${_months[dateTime.month - 1]} ${dateTime.year}';

  return formattedDate;
}

final List<String> _months = [
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
  'December',
];
