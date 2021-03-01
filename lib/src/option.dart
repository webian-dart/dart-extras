abstract class Option<T> {
  final T value;
  Option(this.value);
}

class Some<T> extends Option {
  Some(value) : super(value);
}

class None<T> extends Option {
  None._() : super(null);
}
