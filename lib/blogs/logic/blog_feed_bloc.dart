import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spice_blog/blogs/logic/blog_feed_event.dart';
import 'package:spice_blog/blogs/logic/blog_feed_state.dart';
import 'package:spice_blog/common/base_classes/bloc_base.dart';
import 'package:spice_blog/di.dart';

class BlogFeedBloc extends Bloc<BlogFeedEvent, BlogFeedState> {
  final Ref _ref;
  BlogFeedBloc(this._ref) : super(BlogFeedState([])) {
    on<OnFeedLoadEvent>(_handleFeedLoadEvent);
    on<OnDeleteBlogEvent>(_handleDeleteBlogEvent);
  }

  Future<void> _handleDeleteBlogEvent(OnDeleteBlogEvent event) async {
    await _ref.read(blogRepoProvider).deleteBlog(event.id);
  }

  void _handleFeedLoadEvent(OnFeedLoadEvent _) {
    _ref.read(blogRepoProvider).fetchAllBlogs().listen((blogs) {
      emit(BlogFeedState(blogs));
    });
  }

  @override
  void dispose() {
    emitDone();
    super.dispose();
  }
}
