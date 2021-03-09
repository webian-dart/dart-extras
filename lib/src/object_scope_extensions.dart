extension ObjectScopeExtensions<T extends Object> on T {
  and(Function(T self) call) => call(this);
}
