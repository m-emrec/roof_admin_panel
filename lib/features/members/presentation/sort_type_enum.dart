enum SortBy {
  name,
  memberShipStartDate,
  memberShipEndDate,
  membershipDuration,
  memberNumber,
  age,
  ;

  static final _locale = {
    name: "Sort by name",
    memberShipStartDate: "Sort by membership start date",
    memberShipEndDate: "Sort by membership end date",
    membershipDuration: "Sort by membership duration",
    memberNumber: "Sort by member number",
    age: "Sort by age",
  };

  String get toLocale {
    if (_locale.containsKey(this)) {
      return _locale[this]!;
    }
    return "";
  }
}
