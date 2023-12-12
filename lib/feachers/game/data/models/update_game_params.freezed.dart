// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_game_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateGameParams {
  DateTime? get dateTime => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateGameParamsCopyWith<UpdateGameParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateGameParamsCopyWith<$Res> {
  factory $UpdateGameParamsCopyWith(
          UpdateGameParams value, $Res Function(UpdateGameParams) then) =
      _$UpdateGameParamsCopyWithImpl<$Res, UpdateGameParams>;
  @useResult
  $Res call(
      {DateTime? dateTime,
      String? location,
      String? name,
      String? description});
}

/// @nodoc
class _$UpdateGameParamsCopyWithImpl<$Res, $Val extends UpdateGameParams>
    implements $UpdateGameParamsCopyWith<$Res> {
  _$UpdateGameParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
    Object? location = freezed,
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateGameParamsCopyWith<$Res>
    implements $UpdateGameParamsCopyWith<$Res> {
  factory _$$_UpdateGameParamsCopyWith(
          _$_UpdateGameParams value, $Res Function(_$_UpdateGameParams) then) =
      __$$_UpdateGameParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? dateTime,
      String? location,
      String? name,
      String? description});
}

/// @nodoc
class __$$_UpdateGameParamsCopyWithImpl<$Res>
    extends _$UpdateGameParamsCopyWithImpl<$Res, _$_UpdateGameParams>
    implements _$$_UpdateGameParamsCopyWith<$Res> {
  __$$_UpdateGameParamsCopyWithImpl(
      _$_UpdateGameParams _value, $Res Function(_$_UpdateGameParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = freezed,
    Object? location = freezed,
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_UpdateGameParams(
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UpdateGameParams extends _UpdateGameParams {
  const _$_UpdateGameParams(
      {required this.dateTime,
      required this.location,
      required this.name,
      required this.description})
      : super._();

  @override
  final DateTime? dateTime;
  @override
  final String? location;
  @override
  final String? name;
  @override
  final String? description;

  @override
  String toString() {
    return 'UpdateGameParams(dateTime: $dateTime, location: $location, name: $name, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateGameParams &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, dateTime, location, name, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateGameParamsCopyWith<_$_UpdateGameParams> get copyWith =>
      __$$_UpdateGameParamsCopyWithImpl<_$_UpdateGameParams>(this, _$identity);
}

abstract class _UpdateGameParams extends UpdateGameParams {
  const factory _UpdateGameParams(
      {required final DateTime? dateTime,
      required final String? location,
      required final String? name,
      required final String? description}) = _$_UpdateGameParams;
  const _UpdateGameParams._() : super._();

  @override
  DateTime? get dateTime;
  @override
  String? get location;
  @override
  String? get name;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateGameParamsCopyWith<_$_UpdateGameParams> get copyWith =>
      throw _privateConstructorUsedError;
}
