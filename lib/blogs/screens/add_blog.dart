import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/blogs/logic/add_blog_bloc.dart';
import 'package:spice_blog/common/widgets/input_field.dart';
import 'package:spice_blog/common/widgets/vertical_spacing.dart';
import 'package:spice_blog/di.dart';

final blocProvider = Provider.autoDispose((ref) =>
    AddBlogBloc(ref.watch(blogRepoProvider), ref.watch(authRepoProvider)));

class AddBlogPage extends ConsumerWidget {
  const AddBlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.watch(blocProvider);
    return Scaffold(
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
                addValue: bloc.title.addValue,
                title: 'Title',
                stream: bloc.title.obs$,
              ),
              const VerticalSpacing(),
              StreamedInputField(
                addValue: bloc.content.addValue,
                title: 'Content',
                stream: bloc.content.obs$,
              ),
              const VerticalSpacing(),
              StreamedInputField(
                addValue: bloc.imgUrl.addValue,
                title: 'Image Url',
                stream: bloc.imgUrl.obs$,
              ),
              const VerticalSpacing(),
              StreamBuilder<bool>(
                  stream: bloc.validInputObs$,
                  builder: (context, snapshot) {
                    final isValid = snapshot.data ?? false;
                    return StreamBuilder<bool>(
                        stream: bloc.isLoading.obs$,
                        builder: (context, loadingSnapshot) {
                          final isLoading = loadingSnapshot.data ?? false;
                          return ElevatedButton(
                              onPressed: isLoading || !isValid
                                  ? null
                                  : () async {
                                      bloc.isLoading.addValue(true);
                                      bloc.addBlog();
                                      bloc.isLoading.addValue(false);
                                      Navigator.of(context).pop();
                                    },
                              child: isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white)
                                  : const Text('Add Blog'));
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class StreamedInputField<T> extends StatelessWidget {
  final Stream<T> stream;
  final void Function(String?) addValue;
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
            onChanged: addValue,
            hintText: title,
            labelText: title,
            errorText: snapshot.error as String?,
          );
        });
  }
}
