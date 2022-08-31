import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_feed_event.freezed.dart';

@freezed
class BlogFeedEvent with _$BlogFeedEvent {
  factory BlogFeedEvent.load() = OnFeedLoadEvent;
  factory BlogFeedEvent.delete(int id) = OnDeleteBlogEvent;
}
