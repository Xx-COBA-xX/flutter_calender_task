// ignore_for_file: non_constant_identifier_names


class MyDate {
  static final now = DateTime.now();

  static final List dayInMonth = [
    DateTime(now.year, now.month + 1, 0).day,
    DateTime(now.year, now.month + 2, 0).day,
    DateTime(now.year, now.month + 3, 0).day,
    DateTime(now.year, now.month + 4, 0).day,
    DateTime(now.year, now.month + 5, 0).day,
    DateTime(now.year, now.month + 6, 0).day,
    DateTime(now.year, now.month + 7, 0).day,
    DateTime(now.year, now.month + 8, 0).day,
    DateTime(now.year, now.month + 9, 0).day,
    DateTime(now.year, now.month + 10, 0).day,
    DateTime(now.year, now.month + 11, 0).day,
    DateTime(now.year, now.month + 12, 0).day,
  ];

  static final List monthName = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  static final List dayName = [
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];

  // ignore: unused_field
  static final List<SelecatDay> availableDay =[
    SelecatDay(n_day: 2, n_month: 4),
    SelecatDay(n_day: 9, n_month: 4),
    SelecatDay(n_day: 16, n_month: 4),
    SelecatDay(n_day: 23, n_month: 4),
    SelecatDay(n_day: 30, n_month: 4),
    SelecatDay(n_day: 5, n_month: 4),
    SelecatDay(n_day: 12, n_month: 4),
  ];
  static final List<SelecatDay> unavailableDay =[
    SelecatDay(n_day: 3, n_month: 4),
    SelecatDay(n_day: 10, n_month: 4),
    SelecatDay(n_day: 17, n_month: 4),
    SelecatDay(n_day: 24, n_month: 4),
    SelecatDay(n_day: 6, n_month: 4),
    SelecatDay(n_day: 13, n_month: 4),
    SelecatDay(n_day: 20, n_month: 4),
  ];

}

class SelecatDay {
  final int n_day;
  final int n_month;

  SelecatDay(
    {required this.n_day,
    required this.n_month,}
  );
}
