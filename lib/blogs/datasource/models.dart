import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

typedef JSON = Map<String, dynamic>;
// freezed + json_serializable
// json - json_serializable

@freezed
class Blog with _$Blog {
  const factory Blog({
    @JsonKey(includeIfNull: false) int? id,
    required String title,
    required String content,
    required String imageUrl,
    required Author author,
    required DateTime updatedAt,
  }) = _Blog;

  factory Blog.fromJson(JSON json) => _$BlogFromJson(json);
}

@freezed
class Author with _$Author {
  const factory Author({required String email, required String photoUrl}) =
      _Author;
  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}
