library form;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_event.freezed.dart';

@freezed
class FormEvent<T> with _$FormEvent {
  const factory FormEvent.onLoad() = OnFormLoadEvent;
  const factory FormEvent.onUpdate({
    required Enum key,
    T? value,
    @Default(false) bool isToggle,
  }) = OnFormValueUpdateEvent;
  const factory FormEvent.onSubmit() = OnFormSubmitEvent;
}
