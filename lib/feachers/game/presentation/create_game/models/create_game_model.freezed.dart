// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateGameModel {
  City get city => throw _privateConstructorUsedError;
  Field get location => throw _privateConstructorUsedError;
  Sport get sport => throw _privateConstructorUsedError;
  Field get description => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateGameModelCopyWith<CreateGameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateGameModelCopyWith<$Res> {
  factory $CreateGameModelCopyWith(
          CreateGameModel value, $Res Function(CreateGameModel) then) =
      _$CreateGameModelCopyWithImpl<$Res, CreateGameModel>;
  @useResult
  $Res call(
      {City city,
      Field location,
      Sport sport,
      Field description,
      DateTime dateTime});

  $CityCopyWith<$Res> get city;
  $FieldCopyWith<$Res> get location;
  $FieldCopyWith<$Res> get description;
}

/// @nodoc
class _$CreateGameModelCopyWithImpl<$Res, $Val extends CreateGameModel>
    implements $CreateGameModelCopyWith<$Res> {
  _$CreateGameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? location = null,
    Object? sport = null,
    Object? description = null,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Field,
      sport: null == sport
          ? _value.sport
          : sport // ignore: cast_nullable_to_non_nullable
              as Sport,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Field,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CityCopyWith<$Res> get city {
    return $CityCopyWith<$Res>(_value.city, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<$Res> get location {
    return $FieldCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<$Res> get description {
    return $FieldCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateGameModelCopyWith<$Res>
    implements $CreateGameModelCopyWith<$Res> {
  factory _$$_CreateGameModelCopyWith(
          _$_CreateGameModel value, $Res Function(_$_CreateGameModel) then) =
      __$$_CreateGameModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {City city,
      Field location,
      Sport sport,
      Field description,
      DateTime dateTime});

  @override
  $CityCopyWith<$Res> get city;
  @override
  $FieldCopyWith<$Res> get location;
  @override
  $FieldCopyWith<$Res> get description;
}

/// @nodoc
class __$$_CreateGameModelCopyWithImpl<$Res>
    extends _$CreateGameModelCopyWithImpl<$Res, _$_CreateGameModel>
    implements _$$_CreateGameModelCopyWith<$Res> {
  __$$_CreateGameModelCopyWithImpl(
      _$_CreateGameModel _value, $Res Function(_$_CreateGameModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? location = null,
    Object? sport = null,
    Object? description = null,
    Object? dateTime = null,
  }) {
    return _then(_$_CreateGameModel(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Field,
      sport: null == sport
          ? _value.sport
          : sport // ignore: cast_nullable_to_non_nullable
              as Sport,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Field,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_CreateGameModel extends _CreateGameModel {
  const _$_CreateGameModel(
      {required this.city,
      required this.location,
      required this.sport,
      required this.description,
      required this.dateTime})
      : super._();

  @override
  final City city;
  @override
  final Field location;
  @override
  final Sport sport;
  @override
  final Field description;
  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'CreateGameModel(city: $city, location: $location, sport: $sport, description: $description, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateGameModel &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.sport, sport) || other.sport == sport) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, city, location, sport, description, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateGameModelCopyWith<_$_CreateGameModel> get copyWith =>
      __$$_CreateGameModelCopyWithImpl<_$_CreateGameModel>(this, _$identity);
}

abstract class _CreateGameModel extends CreateGameModel {
  const factory _CreateGameModel(
      {required final City city,
      required final Field location,
      required final Sport sport,
      required final Field description,
      required final DateTime dateTime}) = _$_CreateGameModel;
  const _CreateGameModel._() : super._();

  @override
  City get city;
  @override
  Field get location;
  @override
  Sport get sport;
  @override
  Field get description;
  @override
  DateTime get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$_CreateGameModelCopyWith<_$_CreateGameModel> get copyWith =>
      throw _privateConstructorUsedError;
}
