import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_blog_state.freezed.dart';

@freezed
class AddBlogState with _$AddBlogState {
  factory AddBlogState({
    String? title,
    String? content,
    String? imgUrl,
  }) = _AddBlogState;
}
