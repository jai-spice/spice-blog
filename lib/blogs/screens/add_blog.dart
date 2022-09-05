import 'package:flutter/material.dart' hide Form;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:spice_blog/blogs/logic/add_blog_bloc/add_blog_bloc.dart';
import 'package:spice_blog/common/form/form.dart';
import 'package:spice_blog/common/widgets/stream_listener.dart';

final _blocProvider = Provider(AddBlogBloc.new);

class AddBlogPage extends ConsumerWidget {
  const AddBlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.read(_blocProvider);
    return StreamListener(
      stream: bloc.stream,
      onDone: Navigator.of(context).pop,
      onError: (error) => Logger().wtf(error),
      child: Scaffold(
        appBar: AppBar(),
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
                Form(bloc),
                StreamBuilder<bool>(
                    stream: bloc.stream.map((event) => event.isValid()),
                    builder: (context, snapshot) {
                      final isValid = snapshot.data ?? false;
                      return ElevatedButton(
                          onPressed: !isValid
                              ? null
                              : () => bloc.add(const FormEvent.onSubmit()),
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
