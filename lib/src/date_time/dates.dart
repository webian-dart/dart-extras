class Dates {
  static const DAYS_IN_A_YEAR = 365;
  static const ONE_THOUSAND_YEARS_IN_DAYS = DAYS_IN_A_YEAR * 1000;
  static final never = DateTime.now()..add(Duration(days: ONE_THOUSAND_YEARS_IN_DAYS));
}

extension DateTimeExtension on DateTime {
  bool get isNotNever => this == Dates.never;
}
