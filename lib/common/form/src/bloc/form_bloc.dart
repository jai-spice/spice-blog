library form;

import 'dart:async';

import 'package:flutter/material.dart' show mustCallSuper;
import 'package:spice_blog/common/base_classes/bloc_base.dart';
import 'package:spice_blog/common/base_classes/value_object.dart';
import 'package:spice_blog/common/form/src/bloc/form_field.dart';

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
    final fields = Map<Enum, FormField>.from(state.fields);
    final field = fields[event.key];
    final value = field?.value;
    if (value is ValueObject) {
      fields[event.key] =
          field!.copyWith(value: value.copyWith(value: event.value));
    } else {
      if (event.isToggle) {
        fields[event.key] = field!.copyWith(value: !(value as bool));
      } else {
        fields[event.key] = event.value;
      }
    }
    emit(FormState(fields));
  }
}
