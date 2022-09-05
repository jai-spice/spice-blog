import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spice_blog/blogs/datasource/models.dart';

part 'blog_feed_state.freezed.dart';

@freezed
class BlogFeedState with _$BlogFeedState {
  factory BlogFeedState(List<Blog> blogs) = _BlogFeedState;
}
