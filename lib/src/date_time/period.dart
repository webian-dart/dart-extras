import 'package:dart_extras/src/date_time/clock.dart';
import 'package:dart_extras/src/date_time/date_time_clock.dart';
import "package:dart_extras/src/object_scope_extensions.dart";
import 'package:equatable/equatable.dart';

import 'dates.dart';

class Period with EquatableMixin {
  final DateTime start;
  final DateTime end;
  final DateTimeClock clock;

  Period(this.start, DateTime end, {DateTimeClock clock})
      : clock = clock ?? Clock(),
        this.end = end.isAfter(start) ? end : start;

  Duration remaining() {
    if (hasEnded) return Duration.zero;
    if (isRunning)
      return end.difference(clock.now());
    else
      return end.difference(start);
  }

  bool get hasStarted => clock.now().isAfter(start);

  bool get hasNotStarted => !hasStarted;

  bool get hasEnded => clock.now().let((it) =>
      it.isAfter(end) && it.isAfter(start) ||
      it.isAtSameMomentAs(start) && isEmpty);

  bool get isEmpty => this is EmptyPeriod || end.isAtSameMomentAs(start);

  bool get hasNotEnded => !hasEnded;

  bool get isRunning => hasStarted && hasNotEnded;

  @override
  List<Object> get props => [start, end, clock];

  @override
  bool get stringify => true;
}

class EmptyPeriod extends Period {
  EmptyPeriod() : super(Dates.never, Dates.never);
}
