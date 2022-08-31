import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_blog_event.freezed.dart';

@freezed
class AddBlogEvent with _$AddBlogEvent {
  factory AddBlogEvent.onUpdateTitle({String? value}) = OnUpdateTitleEvent;
  factory AddBlogEvent.onUpdateImgUrl({String? value}) = OnUpdateImgUrlEvent;
  factory AddBlogEvent.onUpdateContent({String? value}) = OnUpdateContentEvent;
  factory AddBlogEvent.onSubmit() = OnSubmitEvent;
}
