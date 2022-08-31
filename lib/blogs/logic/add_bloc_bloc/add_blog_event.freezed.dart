// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_blog_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddBlogEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? value) onUpdateTitle,
    required TResult Function(String? value) onUpdateImgUrl,
    required TResult Function(String? value) onUpdateContent,
    required TResult Function() onSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? value)? onUpdateTitle,
    TResult Function(String? value)? onUpdateImgUrl,
    TResult Function(String? value)? onUpdateContent,
    TResult Function()? onSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? value)? onUpdateTitle,
    TResult Function(String? value)? onUpdateImgUrl,
    TResult Function(String? value)? onUpdateContent,
    TResult Function()? onSubmit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnUpdateTitleEvent value) onUpdateTitle,
    required TResult Function(OnUpdateImgUrlEvent value) onUpdateImgUrl,
    required TResult Function(OnUpdateContentEvent value) onUpdateContent,
    required TResult Function(OnSubmitEvent value) onSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnUpdateTitleEvent value)? onUpdateTitle,
    TResult Function(OnUpdateImgUrlEvent value)? onUpdateImgUrl,
    TResult Function(OnUpdateContentEvent value)? onUpdateContent,
    TResult Function(OnSubmitEvent value)? onSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnUpdateTitleEvent value)? onUpdateTitle,
    TResult Function(OnUpdateImgUrlEvent value)? onUpdateImgUrl,
    TResult Function(OnUpdateContentEvent value)? onUpdateContent,
    TResult Function(OnSubmitEvent value)? onSubmit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddBlogEventCopyWith<$Res> {
  factory $AddBlogEventCopyWith(
          AddBlogEvent value, $Res Function(AddBlogEvent) then) =
      _$AddBlogEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AddBlogEventCopyWithImpl<$Res> implements $AddBlogEventCopyWith<$Res> {
  _$AddBlogEventCopyWithImpl(this._value, this._then);

  final AddBlogEvent _value;
  // ignore: unused_field
  final $Res Function(AddBlogEvent) _then;
}

/// @nodoc
abstract class _$$OnUpdateTitleEventCopyWith<$Res> {
  factory _$$OnUpdateTitleEventCopyWith(_$OnUpdateTitleEvent value,
          $Res Function(_$OnUpdateTitleEvent) then) =
      __$$OnUpdateTitleEventCopyWithImpl<$Res>;
  $Res call({String? value});
}

/// @nodoc
class __$$OnUpdateTitleEventCopyWithImpl<$Res>
    extends _$AddBlogEventCopyWithImpl<$Res>
    implements _$$OnUpdateTitleEventCopyWith<$Res> {
  __$$OnUpdateTitleEventCopyWithImpl(
      _$OnUpdateTitleEvent _value, $Res Function(_$OnUpdateTitleEvent) _then)
      : super(_value, (v) => _then(v as _$OnUpdateTitleEvent));

  @override
  _$OnUpdateTitleEvent get _value => super._value as _$OnUpdateTitleEvent;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$OnUpdateTitleEvent(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OnUpdateTitleEvent implements OnUpdateTitleEvent {
  _$OnUpdateTitleEvent({this.value});

  @override
  final String? value;

  @override
  String toString() {
    return 'AddBlogEvent.onUpdateTitle(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnUpdateTitleEvent &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$OnUpdateTitleEventCopyWith<_$OnUpdateTitleEvent> get copyWith =>
      __$$OnUpdateTitleEventCopyWithImpl<_$OnUpdateTitleEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? value) onUpdateTitle,
    required TResult Function(String? value) onUpdateImgUrl,
    required TResult Function(String? value) onUpdateContent,
    required TResult Function() onSubmit,
  }) {
    return onUpdateTitle(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? value)? onUpdateTitle,
    TResult Function(String? value)? onUpdateImgUrl,
    TResult Function(String? value)? onUpdateContent,
    TResult Function()? onSubmit,
  }) {
    return onUpdateTitle?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? value)? onUpdateTitle,
    TResult Function(String? value)? onUpdateImgUrl,
    TResult Function(String? value)? onUpdateContent,
    TResult Function()? onSubmit,
    required TResult orElse(),
  }) {
    if (onUpdateTitle != null) {
      return onUpdateTitle(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnUpdateTitleEvent value) onUpdateTitle,
    required TResult Function(OnUpdateImgUrlEvent value) onUpdateImgUrl,
    required TResult Function(OnUpdateContentEvent value) onUpdateContent,
    required TResult Function(OnSubmitEvent value) onSubmit,
  }) {
    return onUpdateTitle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnUpdateTitleEvent value)? onUpdateTitle,
    TResult Function(OnUpdateImgUrlEvent value)? onUpdateImgUrl,
    TResult Function(OnUpdateContentEvent value)? onUpdateContent,
    TResult Function(OnSubmitEvent value)? onSubmit,
  }) {
    return onUpdateTitle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnUpdateTitleEvent value)? onUpdateTitle,
    TResult Function(OnUpdateImgUrlEvent value)? onUpdateImgUrl,
    TResult Function(OnUpdateContentEvent value)? onUpdateContent,
    TResult Function(OnSubmitEvent value)? onSubmit,
    required TResult orElse(),
  }) {
    if (onUpdateTitle != null) {
      return onUpdateTitle(this);
    }
    return orElse();
  }
}

abstract class OnUpdateTitleEvent implements AddBlogEvent {
  factory OnUpdateTitleEvent({final String? value}) = _$OnUpdateTitleEvent;

  String? get value;
  @JsonKey(ignore: true)
  _$$OnUpdateTitleEventCopyWith<_$OnUpdateTitleEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnUpdateImgUrlEventCopyWith<$Res> {
  factory _$$OnUpdateImgUrlEventCopyWith(_$OnUpdateImgUrlEvent value,
          $Res Function(_$OnUpdateImgUrlEvent) then) =
      __$$OnUpdateImgUrlEventCopyWithImpl<$Res>;
  $Res call({String? value});
}

/// @nodoc
class __$$OnUpdateImgUrlEventCopyWithImpl<$Res>
    extends _$AddBlogEventCopyWithImpl<$Res>
    implements _$$OnUpdateImgUrlEventCopyWith<$Res> {
  __$$OnUpdateImgUrlEventCopyWithImpl(
      _$OnUpdateImgUrlEvent _value, $Res Function(_$OnUpdateImgUrlEvent) _then)
      : super(_value, (v) => _then(v as _$OnUpdateImgUrlEvent));

  @override
  _$OnUpdateImgUrlEvent get _value => super._value as _$OnUpdateImgUrlEvent;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$OnUpdateImgUrlEvent(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OnUpdateImgUrlEvent implements OnUpdateImgUrlEvent {
  _$OnUpdateImgUrlEvent({this.value});

  @override
  final String? value;

  @override
  String toString() {
    return 'AddBlogEvent.onUpdateImgUrl(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnUpdateImgUrlEvent &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$OnUpdateImgUrlEventCopyWith<_$OnUpdateImgUrlEvent> get copyWith =>
      __$$OnUpdateImgUrlEventCopyWithImpl<_$OnUpdateImgUrlEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? value) onUpdateTitle,
    required TResult Function(String? value) onUpdateImgUrl,
    required TResult Function(String? value) onUpdateContent,
    required TResult Function() onSubmit,
  }) {
    return onUpdateImgUrl(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? value)? onUpdateTitle,
    TResult Function(String? value)? onUpdateImgUrl,
    TResult Function(String? value)? onUpdateContent,
    TResult Function()? onSubmit,
  }) {
    return onUpdateImgUrl?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? value)? onUpdateTitle,
    TResult Function(String? value)? onUpdateImgUrl,
    TResult Function(String? value)? onUpdateContent,
    TResult Function()? onSubmit,
    required TResult orElse(),
  }) {
    if (onUpdateImgUrl != null) {
      return onUpdateImgUrl(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnUpdateTitleEvent value) onUpdateTitle,
    required TResult Function(OnUpdateImgUrlEvent value) onUpdateImgUrl,
    required TResult Function(OnUpdateContentEvent value) onUpdateContent,
    required TResult Function(OnSubmitEvent value) onSubmit,
  }) {
    return onUpdateImgUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnUpdateTitleEvent value)? onUpdateTitle,
    TResult Function(OnUpdateImgUrlEvent value)? onUpdateImgUrl,
    TResult Function(OnUpdateContentEvent value)? onUpdateContent,
    TResult Function(OnSubmitEvent value)? onSubmit,
  }) {
    return onUpdateImgUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnUpdateTitleEvent value)? onUpdateTitle,
    TResult Function(OnUpdateImgUrlEvent value)? onUpdateImgUrl,
    TResult Function(OnUpdateContentEvent value)? onUpdateContent,
    TResult Function(OnSubmitEvent value)? onSubmit,
    required TResult orElse(),
  }) {
    if (onUpdateImgUrl != null) {
      return onUpdateImgUrl(this);
    }
    return orElse();
  }
}

abstract class OnUpdateImgUrlEvent implements AddBlogEvent {
  factory OnUpdateImgUrlEvent({final String? value}) = _$OnUpdateImgUrlEvent;

  String? get value;
  @JsonKey(ignore: true)
  _$$OnUpdateImgUrlEventCopyWith<_$OnUpdateImgUrlEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnUpdateContentEventCopyWith<$Res> {
  factory _$$OnUpdateContentEventCopyWith(_$OnUpdateContentEvent value,
          $Res Function(_$OnUpdateContentEvent) then) =
      __$$OnUpdateContentEventCopyWithImpl<$Res>;
  $Res call({String? value});
}

/// @nodoc
class __$$OnUpdateContentEventCopyWithImpl<$Res>
    extends _$AddBlogEventCopyWithImpl<$Res>
    implements _$$OnUpdateContentEventCopyWith<$Res> {
  __$$OnUpdateContentEventCopyWithImpl(_$OnUpdateContentEvent _value,
      $Res Function(_$OnUpdateContentEvent) _then)
      : super(_value, (v) => _then(v as _$OnUpdateContentEvent));

  @override
  _$OnUpdateContentEvent get _value => super._value as _$OnUpdateContentEvent;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$OnUpdateContentEvent(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OnUpdateContentEvent implements OnUpdateContentEvent {
  _$OnUpdateContentEvent({this.value});

  @override
  final String? value;

  @override
  String toString() {
    return 'AddBlogEvent.onUpdateContent(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnUpdateContentEvent &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$OnUpdateContentEventCopyWith<_$OnUpdateContentEvent> get copyWith =>
      __$$OnUpdateContentEventCopyWithImpl<_$OnUpdateContentEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? value) onUpdateTitle,
    required TResult Function(String? value) onUpdateImgUrl,
    required TResult Function(String? value) onUpdateContent,
    required TResult Function() onSubmit,
  }) {
    return onUpdateContent(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? value)? onUpdateTitle,
    TResult Function(String? value)? onUpdateImgUrl,
    TResult Function(String? value)? onUpdateContent,
    TResult Function()? onSubmit,
  }) {
    return onUpdateContent?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? value)? onUpdateTitle,
    TResult Function(String? value)? onUpdateImgUrl,
    TResult Function(String? value)? onUpdateContent,
    TResult Function()? onSubmit,
    required TResult orElse(),
  }) {
    if (onUpdateContent != null) {
      return onUpdateContent(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnUpdateTitleEvent value) onUpdateTitle,
    required TResult Function(OnUpdateImgUrlEvent value) onUpdateImgUrl,
    required TResult Function(OnUpdateContentEvent value) onUpdateContent,
    required TResult Function(OnSubmitEvent value) onSubmit,
  }) {
    return onUpdateContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnUpdateTitleEvent value)? onUpdateTitle,
    TResult Function(OnUpdateImgUrlEvent value)? onUpdateImgUrl,
    TResult Function(OnUpdateContentEvent value)? onUpdateContent,
    TResult Function(OnSubmitEvent value)? onSubmit,
  }) {
    return onUpdateContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnUpdateTitleEvent value)? onUpdateTitle,
    TResult Function(OnUpdateImgUrlEvent value)? onUpdateImgUrl,
    TResult Function(OnUpdateContentEvent value)? onUpdateContent,
    TResult Function(OnSubmitEvent value)? onSubmit,
    required TResult orElse(),
  }) {
    if (onUpdateContent != null) {
      return onUpdateContent(this);
    }
    return orElse();
  }
}

abstract class OnUpdateContentEvent implements AddBlogEvent {
  factory OnUpdateContentEvent({final String? value}) = _$OnUpdateContentEvent;

  String? get value;
  @JsonKey(ignore: true)
  _$$OnUpdateContentEventCopyWith<_$OnUpdateContentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnSubmitEventCopyWith<$Res> {
  factory _$$OnSubmitEventCopyWith(
          _$OnSubmitEvent value, $Res Function(_$OnSubmitEvent) then) =
      __$$OnSubmitEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnSubmitEventCopyWithImpl<$Res>
    extends _$AddBlogEventCopyWithImpl<$Res>
    implements _$$OnSubmitEventCopyWith<$Res> {
  __$$OnSubmitEventCopyWithImpl(
      _$OnSubmitEvent _value, $Res Function(_$OnSubmitEvent) _then)
      : super(_value, (v) => _then(v as _$OnSubmitEvent));

  @override
  _$OnSubmitEvent get _value => super._value as _$OnSubmitEvent;
}

/// @nodoc

class _$OnSubmitEvent implements OnSubmitEvent {
  _$OnSubmitEvent();

  @override
  String toString() {
    return 'AddBlogEvent.onSubmit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnSubmitEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? value) onUpdateTitle,
    required TResult Function(String? value) onUpdateImgUrl,
    required TResult Function(String? value) onUpdateContent,
    required TResult Function() onSubmit,
  }) {
    return onSubmit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? value)? onUpdateTitle,
    TResult Function(String? value)? onUpdateImgUrl,
    TResult Function(String? value)? onUpdateContent,
    TResult Function()? onSubmit,
  }) {
    return onSubmit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? value)? onUpdateTitle,
    TResult Function(String? value)? onUpdateImgUrl,
    TResult Function(String? value)? onUpdateContent,
    TResult Function()? onSubmit,
    required TResult orElse(),
  }) {
    if (onSubmit != null) {
      return onSubmit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnUpdateTitleEvent value) onUpdateTitle,
    required TResult Function(OnUpdateImgUrlEvent value) onUpdateImgUrl,
    required TResult Function(OnUpdateContentEvent value) onUpdateContent,
    required TResult Function(OnSubmitEvent value) onSubmit,
  }) {
    return onSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnUpdateTitleEvent value)? onUpdateTitle,
    TResult Function(OnUpdateImgUrlEvent value)? onUpdateImgUrl,
    TResult Function(OnUpdateContentEvent value)? onUpdateContent,
    TResult Function(OnSubmitEvent value)? onSubmit,
  }) {
    return onSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnUpdateTitleEvent value)? onUpdateTitle,
    TResult Function(OnUpdateImgUrlEvent value)? onUpdateImgUrl,
    TResult Function(OnUpdateContentEvent value)? onUpdateContent,
    TResult Function(OnSubmitEvent value)? onSubmit,
    required TResult orElse(),
  }) {
    if (onSubmit != null) {
      return onSubmit(this);
    }
    return orElse();
  }
}

abstract class OnSubmitEvent implements AddBlogEvent {
  factory OnSubmitEvent() = _$OnSubmitEvent;
}
