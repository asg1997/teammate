// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameInfoState {
  List<User> get players => throw _privateConstructorUsedError;
  Game get game => throw _privateConstructorUsedError;
  GameInfoStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameInfoStateCopyWith<GameInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameInfoStateCopyWith<$Res> {
  factory $GameInfoStateCopyWith(
          GameInfoState value, $Res Function(GameInfoState) then) =
      _$GameInfoStateCopyWithImpl<$Res, GameInfoState>;
  @useResult
  $Res call({List<User> players, Game game, GameInfoStatus status});
}

/// @nodoc
class _$GameInfoStateCopyWithImpl<$Res, $Val extends GameInfoState>
    implements $GameInfoStateCopyWith<$Res> {
  _$GameInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? players = null,
    Object? game = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<User>,
      game: null == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as Game,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameInfoStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameInfoStateCopyWith<$Res>
    implements $GameInfoStateCopyWith<$Res> {
  factory _$$_GameInfoStateCopyWith(
          _$_GameInfoState value, $Res Function(_$_GameInfoState) then) =
      __$$_GameInfoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<User> players, Game game, GameInfoStatus status});
}

/// @nodoc
class __$$_GameInfoStateCopyWithImpl<$Res>
    extends _$GameInfoStateCopyWithImpl<$Res, _$_GameInfoState>
    implements _$$_GameInfoStateCopyWith<$Res> {
  __$$_GameInfoStateCopyWithImpl(
      _$_GameInfoState _value, $Res Function(_$_GameInfoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? players = null,
    Object? game = null,
    Object? status = null,
  }) {
    return _then(_$_GameInfoState(
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<User>,
      game: null == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as Game,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameInfoStatus,
    ));
  }
}

/// @nodoc

class _$_GameInfoState extends _GameInfoState {
  const _$_GameInfoState(
      {required final List<User> players,
      required this.game,
      required this.status})
      : _players = players,
        super._();

  final List<User> _players;
  @override
  List<User> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  final Game game;
  @override
  final GameInfoStatus status;

  @override
  String toString() {
    return 'GameInfoState(players: $players, game: $game, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameInfoState &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.game, game) || other.game == game) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_players), game, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameInfoStateCopyWith<_$_GameInfoState> get copyWith =>
      __$$_GameInfoStateCopyWithImpl<_$_GameInfoState>(this, _$identity);
}

abstract class _GameInfoState extends GameInfoState {
  const factory _GameInfoState(
      {required final List<User> players,
      required final Game game,
      required final GameInfoStatus status}) = _$_GameInfoState;
  const _GameInfoState._() : super._();

  @override
  List<User> get players;
  @override
  Game get game;
  @override
  GameInfoStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_GameInfoStateCopyWith<_$_GameInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
