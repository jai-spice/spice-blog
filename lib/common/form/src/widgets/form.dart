import 'package:flutter/material.dart' hide Form, FormState;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/common/form/src/bloc/form_bloc.dart';
import 'package:spice_blog/common/form/src/widgets/input_field.dart';
import 'package:spice_blog/common/widgets/vertical_spacing.dart';

import '../bloc/form_state.dart';

///
///
///
class Form extends ConsumerWidget {
  final FormBloc bloc;

  const Form(this.bloc, {super.key});
  //
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<FormState>(
      stream: bloc.stream,
      builder: ((context, snapshot) {
        final state = snapshot.data;
        if (state != null) {
          final fields = state.fields;
          final keys = fields.keys.toList();
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => Column(
              children: [
                StreamedFormInputField(
                  bloc: bloc,
                  valueKey: keys[index],
                  labelText: fields[keys[index]]?.label ?? "",
                ),
                const VerticalSpacing()
              ],
            ),
            itemCount: fields.length,
          );
        }

        return Container();
      }),
    );
  }
}
