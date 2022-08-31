import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/blogs/logic/add_bloc_bloc/add_blog_bloc.dart';
import 'package:spice_blog/blogs/logic/add_bloc_bloc/add_blog_event.dart';
import 'package:spice_blog/common/widgets/input_field.dart';
import 'package:spice_blog/common/widgets/stream_listener.dart';
import 'package:spice_blog/common/widgets/vertical_spacing.dart';
import 'package:spice_blog/common/utils/string_ext.dart';

final _blocProvider = Provider.autoDispose(AddBlogBloc.new);

class AddBlogPage extends ConsumerWidget {
  const AddBlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.read(_blocProvider);
    return StreamListener(
      stream: bloc.stream,
      onDone: Navigator.of(context).pop,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 48.0,
              horizontal: MediaQuery.of(context).size.width / 6,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Add Blog',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const VerticalSpacing(),
                StreamedInputField(
                  addValue: (value) =>
                      bloc.add(AddBlogEvent.onUpdateTitle(value: value)),
                  title: 'Title',
                  stream: bloc.stream.map((event) => event.title),
                ),
                const VerticalSpacing(),
                StreamedInputField(
                  addValue: (value) =>
                      bloc.add(AddBlogEvent.onUpdateContent(value: value)),
                  stream: bloc.stream.map((event) => event.content),
                  title: 'Content',
                ),
                const VerticalSpacing(),
                StreamedInputField(
                  addValue: (value) =>
                      bloc.add(AddBlogEvent.onUpdateImgUrl(value: value)),
                  stream: bloc.stream.map((event) => event.imgUrl),
                  title: 'Image Url',
                ),
                const VerticalSpacing(),
                StreamBuilder<bool>(
                    stream: bloc.stream.map(
                      (event) =>
                          !event.title.isNullOrEmpty &&
                          !event.imgUrl.isNullOrEmpty &&
                          !event.content.isNullOrEmpty,
                    ),
                    builder: (context, snapshot) {
                      final isValid = snapshot.data ?? false;
                      return ElevatedButton(
                          onPressed: !isValid
                              ? null
                              : () {
                                  bloc.add(AddBlogEvent.onSubmit());
                                },
                          child: const Text('Add Blog'));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StreamedInputField<T> extends StatelessWidget {
  final Stream<T> stream;
  final Function(String?) addValue;
  final String title;

  const StreamedInputField({
    Key? key,
    required this.stream,
    required this.addValue,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
        stream: stream,
        builder: (context, snapshot) {
          return InputField(
            onChanged: (value) => addValue(value),
            hintText: title,
            labelText: title,
            errorText: snapshot.error as String?,
          );
        });
  }
}
