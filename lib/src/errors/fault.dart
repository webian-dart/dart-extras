import 'package:equatable/equatable.dart';

class Fault with EquatableMixin implements Exception {
  bool get isEmpty => this is EmptyFault || message.isEmpty;

  final String message;

  const Fault([String? message]) : this.message = message ?? "";

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  factory Fault.empty() => EmptyFault();
}

class EmptyFault extends Fault {}
