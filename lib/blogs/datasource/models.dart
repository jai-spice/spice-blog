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
    @JsonKey(name: 'imageurl') required String imageUrl,
    @JsonKey(name: 'email', fromJson: Author.fromJson, toJson: Author.toJson)
        required Author author,
    @JsonKey(name: 'updatedat') required DateTime updatedAt,
  }) = _Blog;

  factory Blog.fromJson(JSON json) => _$BlogFromJson(json);
}

// @freezed
class Author {
  final String email;
  final String photoUrl;
  Author({required this.email, this.photoUrl = ''});

  static Author fromJson(dynamic email) => Author(email: email);

  static Map<String, dynamic> toJson(Object obj) => {};
  // factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}
