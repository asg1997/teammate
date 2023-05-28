import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum Sport {
  football,
  volleyball,
  basketball;

  String get localized {
    switch (this) {
      case Sport.football:
        return 'Футбол';
      case Sport.volleyball:
        return 'Волейбол';
      case Sport.basketball:
        return 'Баскетбол';
    }
  }
}
