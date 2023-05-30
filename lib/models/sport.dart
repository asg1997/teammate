enum Sport {
  soccer,
  basketball,
  volleyball;

  String get locale {
    switch (this) {
      case Sport.soccer:
        return 'Футбол';
      case Sport.basketball:
        return 'Баскетбол';
      case Sport.volleyball:
        return 'Волейбол';
    }
  }

  String toJson() => name;
  factory Sport.fromJson(String json) {
    switch (json) {
      case 'soccer':
        return soccer;
      case 'volleyball':
        return volleyball;
      case 'basketball':
        return basketball;
    }
    return soccer;
  }
}
