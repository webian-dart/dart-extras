extension ObjectScopeExtensions<T extends Object> on T {
  T apply(void Function(T self) call, {T or}) {
    call(this ?? or);
    return this ?? or;
  }

  R let<R>(R Function(T self) call, {T or}) {
    return call(this ?? or);
  }

  run<R>(R Function() operation) {
    return operation();
  }

  runNotNull(void Function() call) {
    if (this != null) call();
  }

  either(Function(T self) right, Function() left) {
    this != null ? right(this) : left();
  }
}
