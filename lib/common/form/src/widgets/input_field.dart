import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/common/base_classes/value_object.dart';
import 'package:spice_blog/common/widgets/input_field.dart';

import '../bloc/form_bloc.dart';
import '../bloc/form_event.dart';

class StreamedFormInputField<T extends FormBloc> extends ConsumerWidget {
  final T bloc;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final String? errorText;
  final bool? obscureText;
  final Enum valueKey;

  const StreamedFormInputField({
    super.key,
    required this.bloc,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.obscureText,
    this.errorText,
    required this.valueKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effectiveHintText = hintText ?? labelText;

    return StreamBuilder(
        stream: bloc.stream.map((event) => event.fields[valueKey]?.value),
        builder: (context, snapshot) {
          return InputField(
            onChanged: (value) =>
                bloc.add(FormEvent.onUpdate(key: valueKey, value: value)),
            obscureText: obscureText ?? false,
            hintText: effectiveHintText,
            labelText: labelText,
            suffixIcon: suffixIcon,
            errorText: snapshot.data is ValueObject
                ? (snapshot.data as ValueObject?)?.error
                : null,
          );
        });
  }
}
