extension NullableObjectScopeExtensions<T extends Object> on T? {
  T? apply(void Function(T self) call, {T? or}) {
    if (this != null)
      call(this!);
    else if (or != null) call(or);
    return this ?? or;
  }

  R? let<R>(R Function(T self) call, {T? or}) {
    if (this != null)
      return call(this!);
    else if (or != null)
      return call(or);
    else
      return null;
  }

  run<R>(R Function() operation) {
    return operation();
  }

  runNotNull(void Function() call) {
    if (this != null) call();
  }

  either(Function(T self) right, Function() left) {
    this != null ? right(this!) : left();
  }

  R fromEither<R>(R Function(T self) right, R Function() left) {
    return this != null ? right(this!) : left();
  }
}
