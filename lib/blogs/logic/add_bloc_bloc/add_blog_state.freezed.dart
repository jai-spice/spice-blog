// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_blog_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddBlogState {
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddBlogStateCopyWith<AddBlogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddBlogStateCopyWith<$Res> {
  factory $AddBlogStateCopyWith(
          AddBlogState value, $Res Function(AddBlogState) then) =
      _$AddBlogStateCopyWithImpl<$Res>;
  $Res call({String? title, String? content, String? imgUrl});
}

/// @nodoc
class _$AddBlogStateCopyWithImpl<$Res> implements $AddBlogStateCopyWith<$Res> {
  _$AddBlogStateCopyWithImpl(this._value, this._then);

  final AddBlogState _value;
  // ignore: unused_field
  final $Res Function(AddBlogState) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? imgUrl = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AddBlogStateCopyWith<$Res>
    implements $AddBlogStateCopyWith<$Res> {
  factory _$$_AddBlogStateCopyWith(
          _$_AddBlogState value, $Res Function(_$_AddBlogState) then) =
      __$$_AddBlogStateCopyWithImpl<$Res>;
  @override
  $Res call({String? title, String? content, String? imgUrl});
}

/// @nodoc
class __$$_AddBlogStateCopyWithImpl<$Res>
    extends _$AddBlogStateCopyWithImpl<$Res>
    implements _$$_AddBlogStateCopyWith<$Res> {
  __$$_AddBlogStateCopyWithImpl(
      _$_AddBlogState _value, $Res Function(_$_AddBlogState) _then)
      : super(_value, (v) => _then(v as _$_AddBlogState));

  @override
  _$_AddBlogState get _value => super._value as _$_AddBlogState;

  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? imgUrl = freezed,
  }) {
    return _then(_$_AddBlogState(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AddBlogState implements _AddBlogState {
  _$_AddBlogState({this.title, this.content, this.imgUrl});

  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? imgUrl;

  @override
  String toString() {
    return 'AddBlogState(title: $title, content: $content, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddBlogState &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.imgUrl, imgUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(imgUrl));

  @JsonKey(ignore: true)
  @override
  _$$_AddBlogStateCopyWith<_$_AddBlogState> get copyWith =>
      __$$_AddBlogStateCopyWithImpl<_$_AddBlogState>(this, _$identity);
}

abstract class _AddBlogState implements AddBlogState {
  factory _AddBlogState(
      {final String? title,
      final String? content,
      final String? imgUrl}) = _$_AddBlogState;

  @override
  String? get title;
  @override
  String? get content;
  @override
  String? get imgUrl;
  @override
  @JsonKey(ignore: true)
  _$$_AddBlogStateCopyWith<_$_AddBlogState> get copyWith =>
      throw _privateConstructorUsedError;
}
