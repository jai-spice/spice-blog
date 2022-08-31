import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spice_blog/common/base_classes/value_object.dart';
import 'package:spice_blog/common/utils/string_ext.dart';

part 'form_state.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class FormState with _$FormState {
  FormState._();
  factory FormState(Map<Enum, dynamic> formValues) = _FormState;

  bool isValid() {
    final valueObjects = formValues.values.whereType<ValueObject>();
    final strings = formValues.values.whereType<String?>();

    final areValueObjectsValid = valueObjects.isEmpty ||
        valueObjects.every((element) => !element.hasError());

    final areStringsValid = strings.isEmpty ||
        strings.every((element) {
          return !element.isNullOrEmpty;
        });

    return areValueObjectsValid && areStringsValid;
  }
}
