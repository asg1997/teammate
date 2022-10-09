enum Sport { football, volleyball, basketball }

getLocaleSportName(Sport sport) {
  switch (sport) {
    case Sport.football:
      return 'Футбол';
    case Sport.volleyball:
      return 'Волейбол';
    case Sport.basketball:
      return 'Баскетбол';
  }
}
