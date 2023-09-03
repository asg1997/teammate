// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Player {
  String get nickname => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String? get pushToken => throw _privateConstructorUsedError;
  NotificationSettings? get notificationsSettings =>
      throw _privateConstructorUsedError;
  dynamic get teammatesIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res, Player>;
  @useResult
  $Res call(
      {String nickname,
      String id,
      String? pushToken,
      NotificationSettings? notificationsSettings,
      dynamic teammatesIds});

  $NotificationSettingsCopyWith<$Res>? get notificationsSettings;
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res, $Val extends Player>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? id = null,
    Object? pushToken = freezed,
    Object? notificationsSettings = freezed,
    Object? teammatesIds = freezed,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pushToken: freezed == pushToken
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationsSettings: freezed == notificationsSettings
          ? _value.notificationsSettings
          : notificationsSettings // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      teammatesIds: freezed == teammatesIds
          ? _value.teammatesIds
          : teammatesIds // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res>? get notificationsSettings {
    if (_value.notificationsSettings == null) {
      return null;
    }

    return $NotificationSettingsCopyWith<$Res>(_value.notificationsSettings!,
        (value) {
      return _then(_value.copyWith(notificationsSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$_PlayerCopyWith(_$_Player value, $Res Function(_$_Player) then) =
      __$$_PlayerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nickname,
      String id,
      String? pushToken,
      NotificationSettings? notificationsSettings,
      dynamic teammatesIds});

  @override
  $NotificationSettingsCopyWith<$Res>? get notificationsSettings;
}

/// @nodoc
class __$$_PlayerCopyWithImpl<$Res>
    extends _$PlayerCopyWithImpl<$Res, _$_Player>
    implements _$$_PlayerCopyWith<$Res> {
  __$$_PlayerCopyWithImpl(_$_Player _value, $Res Function(_$_Player) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? id = null,
    Object? pushToken = freezed,
    Object? notificationsSettings = freezed,
    Object? teammatesIds = freezed,
  }) {
    return _then(_$_Player(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pushToken: freezed == pushToken
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationsSettings: freezed == notificationsSettings
          ? _value.notificationsSettings
          : notificationsSettings // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      teammatesIds:
          freezed == teammatesIds ? _value.teammatesIds! : teammatesIds,
    ));
  }
}

/// @nodoc

class _$_Player implements _Player {
  const _$_Player(
      {required this.nickname,
      required this.id,
      this.pushToken,
      this.notificationsSettings,
      this.teammatesIds = const <String>[]});

  @override
  final String nickname;
  @override
  final String id;
  @override
  final String? pushToken;
  @override
  final NotificationSettings? notificationsSettings;
  @override
  @JsonKey()
  final dynamic teammatesIds;

  @override
  String toString() {
    return 'Player(nickname: $nickname, id: $id, pushToken: $pushToken, notificationsSettings: $notificationsSettings, teammatesIds: $teammatesIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Player &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pushToken, pushToken) ||
                other.pushToken == pushToken) &&
            (identical(other.notificationsSettings, notificationsSettings) ||
                other.notificationsSettings == notificationsSettings) &&
            const DeepCollectionEquality()
                .equals(other.teammatesIds, teammatesIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nickname, id, pushToken,
      notificationsSettings, const DeepCollectionEquality().hash(teammatesIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerCopyWith<_$_Player> get copyWith =>
      __$$_PlayerCopyWithImpl<_$_Player>(this, _$identity);
}

abstract class _Player implements Player {
  const factory _Player(
      {required final String nickname,
      required final String id,
      final String? pushToken,
      final NotificationSettings? notificationsSettings,
      final dynamic teammatesIds}) = _$_Player;

  @override
  String get nickname;
  @override
  String get id;
  @override
  String? get pushToken;
  @override
  NotificationSettings? get notificationsSettings;
  @override
  dynamic get teammatesIds;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerCopyWith<_$_Player> get copyWith =>
      throw _privateConstructorUsedError;
}
