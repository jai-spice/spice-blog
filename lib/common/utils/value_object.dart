import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// [ValueObject] is a type of class that is self validated.
/// It is useful for values that are supposed to be crucial for domain logic.
abstract class ValueObject<T> with EquatableMixin {
  final T? value;
  String? get error => validator();

  bool hasError() => value == null || error != null;

  @protected
  String? validator();

  const ValueObject([this.value]);

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return value.toString();
  }

  ValueObject<T> copyWith({T? value});
}
