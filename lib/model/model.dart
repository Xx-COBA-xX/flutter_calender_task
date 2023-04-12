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
  static final List<DateTime> availableDay = [
    DateTime(2023, 4, 2),
    DateTime(2023, 4, 9),
    DateTime(2023, 4, 16),
    DateTime(2023, 4, 23),
    DateTime(2023, 4, 30),
    DateTime(2024, 4, 10),
    DateTime(2023, 4, 12),
    DateTime(2023, 4, 17),
    DateTime(2023, 5, 2),
    DateTime(2023, 5, 9),
    DateTime(2023, 6, 16),
    DateTime(2023, 3, 23),
    DateTime(2023, 7, 30),
    DateTime(2024, 6, 10),
    DateTime(2023, 7, 12),
    DateTime(2023, 6, 17),
  ];
  static final List<DateTime> unavailableDay = [
    DateTime(2023, 4, 3),
    DateTime(2023, 4, 10),
    DateTime(2023, 4, 17),
    DateTime(2023, 4, 24),
    DateTime(2023, 4, 25),
    DateTime(2024, 4, 6),
    DateTime(2023, 4, 13),
    DateTime(2023, 5, 20),
    DateTime(2023, 5, 3),
    DateTime(2023, 6, 10),
    DateTime(2023, 7, 17),
    DateTime(2023, 6, 24),
    DateTime(2023, 6, 25),
    DateTime(2024, 7, 6),
    DateTime(2023, 8, 13),
    DateTime(2023, 9, 20),
  ];
}
