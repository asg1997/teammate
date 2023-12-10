// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifs_configs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotifConfigs _$NotifConfigsFromJson(Map<String, dynamic> json) {
  return _NotifConfigs.fromJson(json);
}

/// @nodoc
mixin _$NotifConfigs {
  @SportConfigsJsonConverter()
  Map<Sport, bool> get sportConfigs => throw _privateConstructorUsedError;
  @NotifTypesJsonConverter()
  Map<String, bool> get notifTypes => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotifConfigsCopyWith<NotifConfigs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotifConfigsCopyWith<$Res> {
  factory $NotifConfigsCopyWith(
          NotifConfigs value, $Res Function(NotifConfigs) then) =
      _$NotifConfigsCopyWithImpl<$Res, NotifConfigs>;
  @useResult
  $Res call(
      {@SportConfigsJsonConverter() Map<Sport, bool> sportConfigs,
      @NotifTypesJsonConverter() Map<String, bool> notifTypes,
      bool enabled});
}

/// @nodoc
class _$NotifConfigsCopyWithImpl<$Res, $Val extends NotifConfigs>
    implements $NotifConfigsCopyWith<$Res> {
  _$NotifConfigsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sportConfigs = null,
    Object? notifTypes = null,
    Object? enabled = null,
  }) {
    return _then(_value.copyWith(
      sportConfigs: null == sportConfigs
          ? _value.sportConfigs
          : sportConfigs // ignore: cast_nullable_to_non_nullable
              as Map<Sport, bool>,
      notifTypes: null == notifTypes
          ? _value.notifTypes
          : notifTypes // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotifConfigsCopyWith<$Res>
    implements $NotifConfigsCopyWith<$Res> {
  factory _$$_NotifConfigsCopyWith(
          _$_NotifConfigs value, $Res Function(_$_NotifConfigs) then) =
      __$$_NotifConfigsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@SportConfigsJsonConverter() Map<Sport, bool> sportConfigs,
      @NotifTypesJsonConverter() Map<String, bool> notifTypes,
      bool enabled});
}

/// @nodoc
class __$$_NotifConfigsCopyWithImpl<$Res>
    extends _$NotifConfigsCopyWithImpl<$Res, _$_NotifConfigs>
    implements _$$_NotifConfigsCopyWith<$Res> {
  __$$_NotifConfigsCopyWithImpl(
      _$_NotifConfigs _value, $Res Function(_$_NotifConfigs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sportConfigs = null,
    Object? notifTypes = null,
    Object? enabled = null,
  }) {
    return _then(_$_NotifConfigs(
      sportConfigs: null == sportConfigs
          ? _value._sportConfigs
          : sportConfigs // ignore: cast_nullable_to_non_nullable
              as Map<Sport, bool>,
      notifTypes: null == notifTypes
          ? _value._notifTypes
          : notifTypes // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotifConfigs implements _NotifConfigs {
  const _$_NotifConfigs(
      {@SportConfigsJsonConverter()
      required final Map<Sport, bool> sportConfigs,
      @NotifTypesJsonConverter() required final Map<String, bool> notifTypes,
      this.enabled = true})
      : _sportConfigs = sportConfigs,
        _notifTypes = notifTypes;

  factory _$_NotifConfigs.fromJson(Map<String, dynamic> json) =>
      _$$_NotifConfigsFromJson(json);

  final Map<Sport, bool> _sportConfigs;
  @override
  @SportConfigsJsonConverter()
  Map<Sport, bool> get sportConfigs {
    if (_sportConfigs is EqualUnmodifiableMapView) return _sportConfigs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sportConfigs);
  }

  final Map<String, bool> _notifTypes;
  @override
  @NotifTypesJsonConverter()
  Map<String, bool> get notifTypes {
    if (_notifTypes is EqualUnmodifiableMapView) return _notifTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_notifTypes);
  }

  @override
  @JsonKey()
  final bool enabled;

  @override
  String toString() {
    return 'NotifConfigs(sportConfigs: $sportConfigs, notifTypes: $notifTypes, enabled: $enabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotifConfigs &&
            const DeepCollectionEquality()
                .equals(other._sportConfigs, _sportConfigs) &&
            const DeepCollectionEquality()
                .equals(other._notifTypes, _notifTypes) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sportConfigs),
      const DeepCollectionEquality().hash(_notifTypes),
      enabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotifConfigsCopyWith<_$_NotifConfigs> get copyWith =>
      __$$_NotifConfigsCopyWithImpl<_$_NotifConfigs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotifConfigsToJson(
      this,
    );
  }
}

abstract class _NotifConfigs implements NotifConfigs {
  const factory _NotifConfigs(
      {@SportConfigsJsonConverter()
      required final Map<Sport, bool> sportConfigs,
      @NotifTypesJsonConverter() required final Map<String, bool> notifTypes,
      final bool enabled}) = _$_NotifConfigs;

  factory _NotifConfigs.fromJson(Map<String, dynamic> json) =
      _$_NotifConfigs.fromJson;

  @override
  @SportConfigsJsonConverter()
  Map<Sport, bool> get sportConfigs;
  @override
  @NotifTypesJsonConverter()
  Map<String, bool> get notifTypes;
  @override
  bool get enabled;
  @override
  @JsonKey(ignore: true)
  _$$_NotifConfigsCopyWith<_$_NotifConfigs> get copyWith =>
      throw _privateConstructorUsedError;
}
