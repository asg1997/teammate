// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CustomException exception) error,
    required TResult Function(T? data) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CustomException exception)? error,
    TResult? Function(T? data)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomException exception)? error,
    TResult Function(T? data)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialBaseState<T> value) initial,
    required TResult Function(LoadingBaseState<T> value) loading,
    required TResult Function(_ErrorBaseState<T> value) error,
    required TResult Function(SuccessBaseState<T> value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialBaseState<T> value)? initial,
    TResult? Function(LoadingBaseState<T> value)? loading,
    TResult? Function(_ErrorBaseState<T> value)? error,
    TResult? Function(SuccessBaseState<T> value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialBaseState<T> value)? initial,
    TResult Function(LoadingBaseState<T> value)? loading,
    TResult Function(_ErrorBaseState<T> value)? error,
    TResult Function(SuccessBaseState<T> value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseStateCopyWith<T, $Res> {
  factory $BaseStateCopyWith(
          BaseState<T> value, $Res Function(BaseState<T>) then) =
      _$BaseStateCopyWithImpl<T, $Res, BaseState<T>>;
}

/// @nodoc
class _$BaseStateCopyWithImpl<T, $Res, $Val extends BaseState<T>>
    implements $BaseStateCopyWith<T, $Res> {
  _$BaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialBaseStateCopyWith<T, $Res> {
  factory _$$_InitialBaseStateCopyWith(_$_InitialBaseState<T> value,
          $Res Function(_$_InitialBaseState<T>) then) =
      __$$_InitialBaseStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_InitialBaseStateCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$_InitialBaseState<T>>
    implements _$$_InitialBaseStateCopyWith<T, $Res> {
  __$$_InitialBaseStateCopyWithImpl(_$_InitialBaseState<T> _value,
      $Res Function(_$_InitialBaseState<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InitialBaseState<T> implements _InitialBaseState<T> {
  const _$_InitialBaseState();

  @override
  String toString() {
    return 'BaseState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InitialBaseState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CustomException exception) error,
    required TResult Function(T? data) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CustomException exception)? error,
    TResult? Function(T? data)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomException exception)? error,
    TResult Function(T? data)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialBaseState<T> value) initial,
    required TResult Function(LoadingBaseState<T> value) loading,
    required TResult Function(_ErrorBaseState<T> value) error,
    required TResult Function(SuccessBaseState<T> value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialBaseState<T> value)? initial,
    TResult? Function(LoadingBaseState<T> value)? loading,
    TResult? Function(_ErrorBaseState<T> value)? error,
    TResult? Function(SuccessBaseState<T> value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialBaseState<T> value)? initial,
    TResult Function(LoadingBaseState<T> value)? loading,
    TResult Function(_ErrorBaseState<T> value)? error,
    TResult Function(SuccessBaseState<T> value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialBaseState<T> implements BaseState<T> {
  const factory _InitialBaseState() = _$_InitialBaseState<T>;
}

/// @nodoc
abstract class _$$LoadingBaseStateCopyWith<T, $Res> {
  factory _$$LoadingBaseStateCopyWith(_$LoadingBaseState<T> value,
          $Res Function(_$LoadingBaseState<T>) then) =
      __$$LoadingBaseStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingBaseStateCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$LoadingBaseState<T>>
    implements _$$LoadingBaseStateCopyWith<T, $Res> {
  __$$LoadingBaseStateCopyWithImpl(
      _$LoadingBaseState<T> _value, $Res Function(_$LoadingBaseState<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingBaseState<T> implements LoadingBaseState<T> {
  const _$LoadingBaseState();

  @override
  String toString() {
    return 'BaseState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingBaseState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CustomException exception) error,
    required TResult Function(T? data) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CustomException exception)? error,
    TResult? Function(T? data)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomException exception)? error,
    TResult Function(T? data)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialBaseState<T> value) initial,
    required TResult Function(LoadingBaseState<T> value) loading,
    required TResult Function(_ErrorBaseState<T> value) error,
    required TResult Function(SuccessBaseState<T> value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialBaseState<T> value)? initial,
    TResult? Function(LoadingBaseState<T> value)? loading,
    TResult? Function(_ErrorBaseState<T> value)? error,
    TResult? Function(SuccessBaseState<T> value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialBaseState<T> value)? initial,
    TResult Function(LoadingBaseState<T> value)? loading,
    TResult Function(_ErrorBaseState<T> value)? error,
    TResult Function(SuccessBaseState<T> value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingBaseState<T> implements BaseState<T> {
  const factory LoadingBaseState() = _$LoadingBaseState<T>;
}

/// @nodoc
abstract class _$$_ErrorBaseStateCopyWith<T, $Res> {
  factory _$$_ErrorBaseStateCopyWith(_$_ErrorBaseState<T> value,
          $Res Function(_$_ErrorBaseState<T>) then) =
      __$$_ErrorBaseStateCopyWithImpl<T, $Res>;
  @useResult
  $Res call({CustomException exception});
}

/// @nodoc
class __$$_ErrorBaseStateCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$_ErrorBaseState<T>>
    implements _$$_ErrorBaseStateCopyWith<T, $Res> {
  __$$_ErrorBaseStateCopyWithImpl(
      _$_ErrorBaseState<T> _value, $Res Function(_$_ErrorBaseState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$_ErrorBaseState<T>(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as CustomException,
    ));
  }
}

/// @nodoc

class _$_ErrorBaseState<T> implements _ErrorBaseState<T> {
  const _$_ErrorBaseState(this.exception);

  @override
  final CustomException exception;

  @override
  String toString() {
    return 'BaseState<$T>.error(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorBaseState<T> &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorBaseStateCopyWith<T, _$_ErrorBaseState<T>> get copyWith =>
      __$$_ErrorBaseStateCopyWithImpl<T, _$_ErrorBaseState<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CustomException exception) error,
    required TResult Function(T? data) success,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CustomException exception)? error,
    TResult? Function(T? data)? success,
  }) {
    return error?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomException exception)? error,
    TResult Function(T? data)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialBaseState<T> value) initial,
    required TResult Function(LoadingBaseState<T> value) loading,
    required TResult Function(_ErrorBaseState<T> value) error,
    required TResult Function(SuccessBaseState<T> value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialBaseState<T> value)? initial,
    TResult? Function(LoadingBaseState<T> value)? loading,
    TResult? Function(_ErrorBaseState<T> value)? error,
    TResult? Function(SuccessBaseState<T> value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialBaseState<T> value)? initial,
    TResult Function(LoadingBaseState<T> value)? loading,
    TResult Function(_ErrorBaseState<T> value)? error,
    TResult Function(SuccessBaseState<T> value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorBaseState<T> implements BaseState<T> {
  const factory _ErrorBaseState(final CustomException exception) =
      _$_ErrorBaseState<T>;

  CustomException get exception;
  @JsonKey(ignore: true)
  _$$_ErrorBaseStateCopyWith<T, _$_ErrorBaseState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessBaseStateCopyWith<T, $Res> {
  factory _$$SuccessBaseStateCopyWith(_$SuccessBaseState<T> value,
          $Res Function(_$SuccessBaseState<T>) then) =
      __$$SuccessBaseStateCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$SuccessBaseStateCopyWithImpl<T, $Res>
    extends _$BaseStateCopyWithImpl<T, $Res, _$SuccessBaseState<T>>
    implements _$$SuccessBaseStateCopyWith<T, $Res> {
  __$$SuccessBaseStateCopyWithImpl(
      _$SuccessBaseState<T> _value, $Res Function(_$SuccessBaseState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessBaseState<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$SuccessBaseState<T> implements SuccessBaseState<T> {
  const _$SuccessBaseState({this.data});

  @override
  final T? data;

  @override
  String toString() {
    return 'BaseState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessBaseState<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessBaseStateCopyWith<T, _$SuccessBaseState<T>> get copyWith =>
      __$$SuccessBaseStateCopyWithImpl<T, _$SuccessBaseState<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CustomException exception) error,
    required TResult Function(T? data) success,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CustomException exception)? error,
    TResult? Function(T? data)? success,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomException exception)? error,
    TResult Function(T? data)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialBaseState<T> value) initial,
    required TResult Function(LoadingBaseState<T> value) loading,
    required TResult Function(_ErrorBaseState<T> value) error,
    required TResult Function(SuccessBaseState<T> value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialBaseState<T> value)? initial,
    TResult? Function(LoadingBaseState<T> value)? loading,
    TResult? Function(_ErrorBaseState<T> value)? error,
    TResult? Function(SuccessBaseState<T> value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialBaseState<T> value)? initial,
    TResult Function(LoadingBaseState<T> value)? loading,
    TResult Function(_ErrorBaseState<T> value)? error,
    TResult Function(SuccessBaseState<T> value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessBaseState<T> implements BaseState<T> {
  const factory SuccessBaseState({final T? data}) = _$SuccessBaseState<T>;

  T? get data;
  @JsonKey(ignore: true)
  _$$SuccessBaseStateCopyWith<T, _$SuccessBaseState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
