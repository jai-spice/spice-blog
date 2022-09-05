import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/blogs/datasource/models.dart';
import 'package:spice_blog/common/form/form.dart';
import 'package:spice_blog/common/form/src/value_objects/url.dart';
import 'package:spice_blog/di.dart';

enum AddBlogFormKeys { title, content, imgUrl }

//AddBlogFormKeys.title: null,
// AddBlogFormKeys.imgUrl: const Url(),
// AddBlogFormKeys.content: null
class AddBlogBloc extends FormBloc {
  final Ref _ref;

  static const _formFields = {
    AddBlogFormKeys.title: FormField<String?>(
        key: AddBlogFormKeys.title,
        value: null,
        label: 'Title',
        type: FieldType.text),
    AddBlogFormKeys.content: FormField<String?>(
        key: AddBlogFormKeys.content,
        value: null,
        label: 'Content',
        type: FieldType.text),
    AddBlogFormKeys.imgUrl: FormField<Url>(
        key: AddBlogFormKeys.imgUrl,
        value: Url(),
        label: 'Image Url',
        type: FieldType.text),
  };

  AddBlogBloc(this._ref) : super(const FormState(_formFields));

  @override
  void handleOnFormLoadEvent(OnFormLoadEvent event) {}

  @override
  Future<void> handleOnFormSubmitEvent(OnFormSubmitEvent event) async {
    await _ref.read(blogRepoProvider).addBlog(Blog(
          title: state.fields[AddBlogFormKeys.title]!.value,
          content: state.fields[AddBlogFormKeys.content]!.value,
          imageUrl: state.fields[AddBlogFormKeys.imgUrl]!.value,
          author: Author(
            email: _ref.read(authRepoProvider).currentUser!.email,
            photoUrl: "",
          ),
          updatedAt: DateTime.now(),
        ));

    emitDone();
  }
}
