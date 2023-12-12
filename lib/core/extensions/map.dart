extension RemoveWhereNullValue on Map {
  Map removeWhereNullValue() =>
      this..removeWhere((key, value) => value == null);
}
