// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_game_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateGameParams {
  String get location => throw _privateConstructorUsedError;
  Sport get sport => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  City get city => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateGameParamsCopyWith<CreateGameParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateGameParamsCopyWith<$Res> {
  factory $CreateGameParamsCopyWith(
          CreateGameParams value, $Res Function(CreateGameParams) then) =
      _$CreateGameParamsCopyWithImpl<$Res, CreateGameParams>;
  @useResult
  $Res call(
      {String location,
      Sport sport,
      String description,
      DateTime dateTime,
      City city});

  $CityCopyWith<$Res> get city;
}

/// @nodoc
class _$CreateGameParamsCopyWithImpl<$Res, $Val extends CreateGameParams>
    implements $CreateGameParamsCopyWith<$Res> {
  _$CreateGameParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? sport = null,
    Object? description = null,
    Object? dateTime = null,
    Object? city = null,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      sport: null == sport
          ? _value.sport
          : sport // ignore: cast_nullable_to_non_nullable
              as Sport,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CityCopyWith<$Res> get city {
    return $CityCopyWith<$Res>(_value.city, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateGameParamsCopyWith<$Res>
    implements $CreateGameParamsCopyWith<$Res> {
  factory _$$_CreateGameParamsCopyWith(
          _$_CreateGameParams value, $Res Function(_$_CreateGameParams) then) =
      __$$_CreateGameParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String location,
      Sport sport,
      String description,
      DateTime dateTime,
      City city});

  @override
  $CityCopyWith<$Res> get city;
}

/// @nodoc
class __$$_CreateGameParamsCopyWithImpl<$Res>
    extends _$CreateGameParamsCopyWithImpl<$Res, _$_CreateGameParams>
    implements _$$_CreateGameParamsCopyWith<$Res> {
  __$$_CreateGameParamsCopyWithImpl(
      _$_CreateGameParams _value, $Res Function(_$_CreateGameParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? sport = null,
    Object? description = null,
    Object? dateTime = null,
    Object? city = null,
  }) {
    return _then(_$_CreateGameParams(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      sport: null == sport
          ? _value.sport
          : sport // ignore: cast_nullable_to_non_nullable
              as Sport,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City,
    ));
  }
}

/// @nodoc

class _$_CreateGameParams implements _CreateGameParams {
  const _$_CreateGameParams(
      {required this.location,
      required this.sport,
      required this.description,
      required this.dateTime,
      required this.city});

  @override
  final String location;
  @override
  final Sport sport;
  @override
  final String description;
  @override
  final DateTime dateTime;
  @override
  final City city;

  @override
  String toString() {
    return 'CreateGameParams(location: $location, sport: $sport, description: $description, dateTime: $dateTime, city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateGameParams &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.sport, sport) || other.sport == sport) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.city, city) || other.city == city));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, location, sport, description, dateTime, city);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateGameParamsCopyWith<_$_CreateGameParams> get copyWith =>
      __$$_CreateGameParamsCopyWithImpl<_$_CreateGameParams>(this, _$identity);
}

abstract class _CreateGameParams implements CreateGameParams {
  const factory _CreateGameParams(
      {required final String location,
      required final Sport sport,
      required final String description,
      required final DateTime dateTime,
      required final City city}) = _$_CreateGameParams;

  @override
  String get location;
  @override
  Sport get sport;
  @override
  String get description;
  @override
  DateTime get dateTime;
  @override
  City get city;
  @override
  @JsonKey(ignore: true)
  _$$_CreateGameParamsCopyWith<_$_CreateGameParams> get copyWith =>
      throw _privateConstructorUsedError;
}