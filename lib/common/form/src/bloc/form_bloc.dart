library form;

import 'dart:async';

import 'package:flutter/material.dart' show mustCallSuper;
import 'package:spice_blog/common/base_classes/bloc_base.dart';
import 'package:spice_blog/common/base_classes/value_object.dart';

import 'form_event.dart';
import 'form_state.dart';

abstract class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc(super.initialState) {
    initializeForm();
  }

  FutureOr<void> handleOnFormLoadEvent(OnFormLoadEvent event);
  FutureOr<void> handleOnFormSubmitEvent(OnFormSubmitEvent event);

  void initializeForm() {
    on<OnFormLoadEvent>(handleOnFormLoadEvent);
    on<OnFormSubmitEvent>(handleOnFormSubmitEvent);
    on<OnFormValueUpdateEvent>(handleOnFormValueUpdatedEvent);
  }

  @mustCallSuper
  FutureOr<void> handleOnFormValueUpdatedEvent(OnFormValueUpdateEvent event) {
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
    emit(FormState(formValues));
  }
}
