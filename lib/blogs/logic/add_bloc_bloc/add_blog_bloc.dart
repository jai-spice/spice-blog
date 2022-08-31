import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/blogs/datasource/models.dart';
import 'package:spice_blog/blogs/logic/add_bloc_bloc/add_blog_event.dart';
import 'package:spice_blog/blogs/logic/add_bloc_bloc/add_blog_state.dart';
import 'package:spice_blog/common/base_classes/bloc_base.dart';
import 'package:spice_blog/di.dart';

class AddBlogBloc extends Bloc<AddBlogEvent, AddBlogState> {
  final Ref _ref;

  AddBlogBloc(this._ref) : super(AddBlogState()) {
    on<OnUpdateTitleEvent>(_handleUpdateTitleEvent);
    on<OnUpdateImgUrlEvent>(_handleUpdateImgUrlEvent);
    on<OnUpdateContentEvent>(_handleUpdateContentEvent);
    on<OnSubmitEvent>(_handleSubmitEvent);
  }

  void _handleUpdateTitleEvent(OnUpdateTitleEvent event) {
    emit(state.copyWith(title: event.value));
  }

  void _handleUpdateImgUrlEvent(OnUpdateImgUrlEvent event) {
    emit(state.copyWith(imgUrl: event.value));
  }

  void _handleUpdateContentEvent(OnUpdateContentEvent event) {
    emit(state.copyWith(content: event.value));
  }

  Future<void> _handleSubmitEvent(OnSubmitEvent event) async {
    await _ref.read(blogRepoProvider).addBlog(Blog(
          title: state.title!,
          content: state.content!,
          imageUrl: state.imgUrl!,
          author: Author(
              email: _ref.read(authRepoProvider).currentUser!.email,
              photoUrl: ""),
          updatedAt: DateTime.now(),
        ));

    emitDone();
  }
}
