import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:spice_blog/common/utils/value_object.dart';

import 'bloc_base.dart';

part 'form_bloc.freezed.dart';

abstract class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc(super.initialState) {
    initializeForm();
  }

  FutureOr<void> handleOnFormLoadEvent(OnFormLoadEvent event);
  FutureOr<void> handleOnFormSubmitEvent(OnFormSubmitEvent event);

  void initializeForm() {
    on<OnFormLoadEvent>(handleOnFormLoadEvent);
    on<OnFormSubmitEvent>(handleOnFormSubmitEvent);

    on<OnFormValueUpdateEvent>(_handleOnFormValueUpdatedEvent);
  }

  FutureOr<void> _handleOnFormValueUpdatedEvent(OnFormValueUpdateEvent event) {
    Logger().i('Form Value Updated: ${event.key} , ${event.value}');
    final formValues = state.formValues;
    final value = formValues[event.key];
    if (value is ValueObject) {
      formValues[event.key] = value.copyWith(value: event.value);
    } else {
      if (event.isToggle) {
        formValues[event.key] = !formValues[event.key];
      } else {
        formValues[event.key] = event.value;
      }
    }
    Logger().i(formValues);
    emit(FormState(formValues));
    Logger().i(state);
  }
}

@Freezed(makeCollectionsUnmodifiable: false)
class FormState with _$FormState {
  FormState._();
  factory FormState(Map<String, dynamic> formValues) = _FormState;

  bool isValid() => formValues.values
      .whereType<ValueObject>()
      .every((element) => !element.hasError());
}

@freezed
class FormEvent<T> with _$FormEvent {
  const factory FormEvent.onLoad() = OnFormLoadEvent;
  const factory FormEvent.onUpdate(
      {required String key,
      T? value,
      @Default(false) bool isToggle}) = OnFormValueUpdateEvent;
  const factory FormEvent.onSubmit() = OnFormSubmitEvent;
}
