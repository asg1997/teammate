enum Sport {
  football,
  volleyball,
  basketball;

  String name() {
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
