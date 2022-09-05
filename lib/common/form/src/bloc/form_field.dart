import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_field.freezed.dart';

@freezed
class FormField<T> with _$FormField<T> {
  const factory FormField({
    required Enum key,
    required T value,
    String? label,
    required FieldType type,
  }) = _FormField<T>;
}

enum FieldType {
  text,
  dropdown,
  radio,
  multiSelect,
}
