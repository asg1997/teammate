// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_game_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateGameState {
  String get name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  City get city => throw _privateConstructorUsedError;
  String get locationName => throw _privateConstructorUsedError;
  Sport get sport => throw _privateConstructorUsedError;
  int get currentStep => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  bool get isCreatingGame => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateGameStateCopyWith<CreateGameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateGameStateCopyWith<$Res> {
  factory $CreateGameStateCopyWith(
          CreateGameState value, $Res Function(CreateGameState) then) =
      _$CreateGameStateCopyWithImpl<$Res, CreateGameState>;
  @useResult
  $Res call(
      {String name,
      String price,
      DateTime dateTime,
      City city,
      String locationName,
      Sport sport,
      int currentStep,
      String error,
      bool isCreatingGame});
}

/// @nodoc
class _$CreateGameStateCopyWithImpl<$Res, $Val extends CreateGameState>
    implements $CreateGameStateCopyWith<$Res> {
  _$CreateGameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? dateTime = null,
    Object? city = null,
    Object? locationName = null,
    Object? sport = null,
    Object? currentStep = null,
    Object? error = null,
    Object? isCreatingGame = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      sport: null == sport
          ? _value.sport
          : sport // ignore: cast_nullable_to_non_nullable
              as Sport,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      isCreatingGame: null == isCreatingGame
          ? _value.isCreatingGame
          : isCreatingGame // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateGameStateCopyWith<$Res>
    implements $CreateGameStateCopyWith<$Res> {
  factory _$$_CreateGameStateCopyWith(
          _$_CreateGameState value, $Res Function(_$_CreateGameState) then) =
      __$$_CreateGameStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String price,
      DateTime dateTime,
      City city,
      String locationName,
      Sport sport,
      int currentStep,
      String error,
      bool isCreatingGame});
}

/// @nodoc
class __$$_CreateGameStateCopyWithImpl<$Res>
    extends _$CreateGameStateCopyWithImpl<$Res, _$_CreateGameState>
    implements _$$_CreateGameStateCopyWith<$Res> {
  __$$_CreateGameStateCopyWithImpl(
      _$_CreateGameState _value, $Res Function(_$_CreateGameState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? dateTime = null,
    Object? city = null,
    Object? locationName = null,
    Object? sport = null,
    Object? currentStep = null,
    Object? error = null,
    Object? isCreatingGame = null,
  }) {
    return _then(_$_CreateGameState(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      sport: null == sport
          ? _value.sport
          : sport // ignore: cast_nullable_to_non_nullable
              as Sport,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      isCreatingGame: null == isCreatingGame
          ? _value.isCreatingGame
          : isCreatingGame // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CreateGameState extends _CreateGameState {
  const _$_CreateGameState(
      {required this.name,
      required this.price,
      required this.dateTime,
      required this.city,
      required this.locationName,
      required this.sport,
      required this.currentStep,
      required this.error,
      required this.isCreatingGame})
      : super._();

  @override
  final String name;
  @override
  final String price;
  @override
  final DateTime dateTime;
  @override
  final City city;
  @override
  final String locationName;
  @override
  final Sport sport;
  @override
  final int currentStep;
  @override
  final String error;
  @override
  final bool isCreatingGame;

  @override
  String toString() {
    return 'CreateGameState(name: $name, price: $price, dateTime: $dateTime, city: $city, locationName: $locationName, sport: $sport, currentStep: $currentStep, error: $error, isCreatingGame: $isCreatingGame)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateGameState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.sport, sport) || other.sport == sport) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isCreatingGame, isCreatingGame) ||
                other.isCreatingGame == isCreatingGame));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, price, dateTime, city,
      locationName, sport, currentStep, error, isCreatingGame);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateGameStateCopyWith<_$_CreateGameState> get copyWith =>
      __$$_CreateGameStateCopyWithImpl<_$_CreateGameState>(this, _$identity);
}

abstract class _CreateGameState extends CreateGameState {
  const factory _CreateGameState(
      {required final String name,
      required final String price,
      required final DateTime dateTime,
      required final City city,
      required final String locationName,
      required final Sport sport,
      required final int currentStep,
      required final String error,
      required final bool isCreatingGame}) = _$_CreateGameState;
  const _CreateGameState._() : super._();

  @override
  String get name;
  @override
  String get price;
  @override
  DateTime get dateTime;
  @override
  City get city;
  @override
  String get locationName;
  @override
  Sport get sport;
  @override
  int get currentStep;
  @override
  String get error;
  @override
  bool get isCreatingGame;
  @override
  @JsonKey(ignore: true)
  _$$_CreateGameStateCopyWith<_$_CreateGameState> get copyWith =>
      throw _privateConstructorUsedError;
}
