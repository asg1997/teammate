// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Game {
  String get id => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get cityCode => throw _privateConstructorUsedError;
  Sport get sport => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  List<String>? get players => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameCopyWith<Game> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res, Game>;
  @useResult
  $Res call(
      {String id,
      String creatorId,
      String name,
      int cityCode,
      Sport sport,
      String location,
      String? description,
      DateTime dateTime,
      List<String>? players});
}

/// @nodoc
class _$GameCopyWithImpl<$Res, $Val extends Game>
    implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorId = null,
    Object? name = null,
    Object? cityCode = null,
    Object? sport = null,
    Object? location = null,
    Object? description = freezed,
    Object? dateTime = null,
    Object? players = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cityCode: null == cityCode
          ? _value.cityCode
          : cityCode // ignore: cast_nullable_to_non_nullable
              as int,
      sport: null == sport
          ? _value.sport
          : sport // ignore: cast_nullable_to_non_nullable
              as Sport,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      players: freezed == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$$_GameCopyWith(_$_Game value, $Res Function(_$_Game) then) =
      __$$_GameCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String creatorId,
      String name,
      int cityCode,
      Sport sport,
      String location,
      String? description,
      DateTime dateTime,
      List<String>? players});
}

/// @nodoc
class __$$_GameCopyWithImpl<$Res> extends _$GameCopyWithImpl<$Res, _$_Game>
    implements _$$_GameCopyWith<$Res> {
  __$$_GameCopyWithImpl(_$_Game _value, $Res Function(_$_Game) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorId = null,
    Object? name = null,
    Object? cityCode = null,
    Object? sport = null,
    Object? location = null,
    Object? description = freezed,
    Object? dateTime = null,
    Object? players = freezed,
  }) {
    return _then(_$_Game(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cityCode: null == cityCode
          ? _value.cityCode
          : cityCode // ignore: cast_nullable_to_non_nullable
              as int,
      sport: null == sport
          ? _value.sport
          : sport // ignore: cast_nullable_to_non_nullable
              as Sport,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      players: freezed == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$_Game extends _Game {
  const _$_Game(
      {required this.id,
      required this.creatorId,
      required this.name,
      required this.cityCode,
      required this.sport,
      required this.location,
      required this.description,
      required this.dateTime,
      final List<String>? players})
      : _players = players,
        super._();

  @override
  final String id;
  @override
  final String creatorId;
  @override
  final String name;
  @override
  final int cityCode;
  @override
  final Sport sport;
  @override
  final String location;
  @override
  final String? description;
  @override
  final DateTime dateTime;
  final List<String>? _players;
  @override
  List<String>? get players {
    final value = _players;
    if (value == null) return null;
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Game(id: $id, creatorId: $creatorId, name: $name, cityCode: $cityCode, sport: $sport, location: $location, description: $description, dateTime: $dateTime, players: $players)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Game &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cityCode, cityCode) ||
                other.cityCode == cityCode) &&
            (identical(other.sport, sport) || other.sport == sport) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            const DeepCollectionEquality().equals(other._players, _players));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      creatorId,
      name,
      cityCode,
      sport,
      location,
      description,
      dateTime,
      const DeepCollectionEquality().hash(_players));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameCopyWith<_$_Game> get copyWith =>
      __$$_GameCopyWithImpl<_$_Game>(this, _$identity);
}

abstract class _Game extends Game {
  const factory _Game(
      {required final String id,
      required final String creatorId,
      required final String name,
      required final int cityCode,
      required final Sport sport,
      required final String location,
      required final String? description,
      required final DateTime dateTime,
      final List<String>? players}) = _$_Game;
  const _Game._() : super._();

  @override
  String get id;
  @override
  String get creatorId;
  @override
  String get name;
  @override
  int get cityCode;
  @override
  Sport get sport;
  @override
  String get location;
  @override
  String? get description;
  @override
  DateTime get dateTime;
  @override
  List<String>? get players;
  @override
  @JsonKey(ignore: true)
  _$$_GameCopyWith<_$_Game> get copyWith => throw _privateConstructorUsedError;
}
