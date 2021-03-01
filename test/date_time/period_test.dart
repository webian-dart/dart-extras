import 'package:dart_extras/dart_extras.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("A Period should", () {
    test("be instantiated correctly", () {
      final start = MockClock.defaultNowDate.add(Duration(hours: 1));
      final end = MockClock.defaultNowDate.add(Duration(days: 1));
      final period = Period(start, end, clock: MockClock());
      expect(period.start, start);
      expect(period.end, end);
    });
    test("have the end be the same as the start when start is after end", () {
      final start = MockClock.defaultNowDate.add(Duration(hours: 1));
      final end = MockClock.defaultNowDate.add(Duration(days: -1));
      final period = Period(start, end, clock: MockClock());
      expect(period.start, period.end);
    });
    test("have not started", () {
      final start = MockClock.defaultNowDate.add(Duration(hours: 1));
      final end = start.add(Duration(hours: 2));
      final period = Period(start, end, clock: MockClock());
      expect(period.hasNotStarted, true, reason: "has not started = true");
      expect(period.hasStarted, false, reason: "has started = false");
    });

    test("have started", () {
      final start = MockClock.defaultNowDate.add(Duration(hours: -1));
      final end = start.add(Duration(hours: 2));
      final period = Period(start, end, clock: MockClock());
      expect(period.hasNotStarted, false, reason: "has not started = false");
      expect(period.hasStarted, true, reason: "has started = true");
    });

    test("tell us if it has ended", () {
      <Quadruple>[
        Quadruple(Duration(hours: -2), Duration(hours: 1), true,
            "It ended an hour ago"),
        Quadruple(
            Duration.zero,
            Duration.zero,
            true,
            "A period with the same start and end is an empty period when "
            "the now matches start, it is already ended"),
        Quadruple(Duration.zero, Duration(microseconds: 1), false,
            "Has not Ended because end is 1 microsecond in the future."),
        Quadruple(Duration(microseconds: -2), Duration(microseconds: -1), true,
            "End is in the past, then the period should have ended"),
      ].forEach((it) {
        final clock = MockClock();
        final start = MockClock.defaultNowDate.add(it.first);
        final end = start.add(it.second);
        final period = Period(start, end, clock: clock);
        final reason = "\nhas Ended?"
            "\n${it.fourth} "
            "\n now\t${clock.now()},"
            "\n start: $start,"
            "\n end:\t$end;";
        expect(period.hasEnded, it.third, reason: reason);
      });
    });

    test("be empty when start and end have the same date time", () {
      final start = MockClock.defaultNowDate.add(Duration(hours: 1));
      final period = Period(start, start, clock: MockClock());
      expect(period.isEmpty, true);
    });

    test("be running end it has started but has not ended", () {
      final start = MockClock.defaultNowDate.add(Duration(hours: -1));
      final end = MockClock.defaultNowDate.add(Duration(microseconds: 1));
      final period = Period(start, end, clock: MockClock());
      expect(period.isRunning, true);
    });

    test("tell us its remaining duration", () {
      <Quadruple>[
        Quadruple(Duration(hours: -2), Duration(hours: 1), Duration.zero,
            "It ended an hour ago"),
        Quadruple(
            Duration.zero,
            Duration.zero,
            Duration.zero,
            "A period with the same start and end is an empty period when "
            "the now matches start, it is already ended"),
        Quadruple(
            Duration.zero,
            Duration(microseconds: 1),
            Duration(microseconds: 1),
            "Has not Ended because end is 1 microsecond in the future."),
        Quadruple(
            Duration(microseconds: -2),
            Duration(microseconds: -1),
            Duration.zero,
            "End is in the past, then the period should have ended"),
        Quadruple(Duration(days: 1), Duration(days: 1), Duration(days: 1),
            "It is in the future so full period is remaining"),
      ].forEach((it) {
        final clock = MockClock();
        final start = MockClock.defaultNowDate.add(it.first);
        final end = start.add(it.second);
        final period = Period(start, end, clock: clock);
        final expected = it.third;
        final result = period.remaining();
        final reason = "\nDuration\n${it.fourth} "
            "\n now:\t${clock.now()},"
            "\n start: $start,"
            "\n end:\t$end;"
            "\n expected:\t$expected;"
            "\n result:\t$result;";
        expect(result, expected, reason: reason);
      });
    });
  });
}

class MockClock implements DateTimeClock {
  DateTime nowDate = defaultNowDate;

  @override
  DateTime now() => nowDate;

  static final defaultNowDate = DateTime(2000, DateTime.january, 12, 30, 1);
}
