import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spice_blog/common/base_classes/value_object.dart';
import 'package:spice_blog/common/utils/string_ext.dart';

import 'form_field.dart';

part 'form_state.freezed.dart';

@Freezed(
  makeCollectionsUnmodifiable: false,
)
class FormState with _$FormState {
  const FormState._();

  const factory FormState(Map<Enum, FormField> fields) = _FormState;

  bool isValid() {
    final valueObjects = fields.values.whereType<ValueObject>();
    final strings = fields.values.whereType<String?>();
    // final nums = fields.values.whereType<num>();

    final areValueObjectsValid = valueObjects.isEmpty ||
        valueObjects.every((field) => !field.value.hasError());

    final areStringsValid = strings.isEmpty ||
        strings.every((field) {
          return !field.isNullOrEmpty;
        });

    return areValueObjectsValid && areStringsValid;
  }
}
