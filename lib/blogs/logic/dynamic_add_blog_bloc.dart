import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/blogs/datasource/models.dart';
import 'package:spice_blog/common/form/form.dart';
import 'package:spice_blog/common/form/src/value_objects/url.dart';
import 'package:spice_blog/di.dart';

enum AddBlogFormKeys { title, content, imgUrl }

class AddBlogBloc extends FormBloc {
  final Ref _ref;

  AddBlogBloc(this._ref)
      : super(
          FormState({
            AddBlogFormKeys.title: null,
            AddBlogFormKeys.imgUrl: const Url(),
            AddBlogFormKeys.content: null
          }),
        );

  @override
  void handleOnFormLoadEvent(OnFormLoadEvent event) {}

  @override
  Future<void> handleOnFormSubmitEvent(OnFormSubmitEvent event) async {
    await _ref.read(blogRepoProvider).addBlog(Blog(
          title: state.formValues[AddBlogFormKeys.title],
          content: state.formValues[AddBlogFormKeys.content],
          imageUrl: state.formValues[AddBlogFormKeys.imgUrl],
          author: Author(
            email: _ref.read(authRepoProvider).currentUser!.email,
            photoUrl: "",
          ),
          updatedAt: DateTime.now(),
        ));

    emitDone();
  }
}
