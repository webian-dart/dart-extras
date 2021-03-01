class Tuple {
  final int size = 0;
  List<dynamic> asList() => [];
}

class Single<A> extends Tuple {
  @override
  final int size = 1;
  final A first;
  Single(this.first);

  @override
  @override
  List<dynamic> asList() => super.asList()..add(first);

  @override
  String toString() => "Single(${first.toString()})";
}

class Couple<A, B> extends Single<A> {
  @override
  final int size = 2;
  final B second;

  Couple(A first, this.second) : super(first);

  @override
  List<dynamic> asList() => super.asList()..add(second);

  @override
  String toString() => "Couple(${first.toString()}, ${second.toString()})";
}

class Triple<A, B, C> extends Couple<A, B> {
  @override
  final int size = 3;
  final C third;
  Triple(A first, B second, this.third) : super(first, second);
  @override
  List<dynamic> asList() => super.asList()..add(third);

  @override
  String toString() =>
      "Triple(first: ${first.toString()}, second: ${second.toString()}, third: ${third.toString()})";
}

class Quadruple<A, B, C, D> extends Triple<A, B, C> {
  @override
  final int size = 4;
  final D fourth;

  Quadruple(A first, B second, C third, this.fourth)
      : super(first, second, third);
  @override
  List<dynamic> asList() => super.asList()..add(fourth);

  @override
  String toString() =>
      "Quadruple(first: ${first.toString()}, second: ${second.toString()}, third: ${third.toString()}, fourth: ${fourth.toString()})";
}
