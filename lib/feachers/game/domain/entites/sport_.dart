enum Sport { football, volleyball, basketball }

localeSportName(Sport sport) {
  switch (sport) {
    case Sport.football:
      return 'Футбол';
    case Sport.volleyball:
      return 'Волейбол';
    case Sport.basketball:
      return 'Баскетбол';
  }
}
