enum Permissions {
  canEdit,
  canRead,
  canEditMembers,
  canReadMembers,
  canEditFeedbacks,
  canReadFeedbacks,
  canWriteGuests,
  canReadGuests,
  canReadManagers,
  canEditManagers,
  ;

  const Permissions();
  static Map<Permissions, String> _localizations = {
    canEditMembers: 'Can delete member',
    canEdit: 'Can edit',
  };

  String toLocale() {
    assert(
      Permissions.values.length == _localizations.length,
      "Please add all the values in the localizations",
    );

    return _localizations[this] ?? "";
  }

  static Permissions? fromLocale(String permission) {
    switch (permission) {
      case 'Can delete member':
        return Permissions.canEditMembers;
      default:
        return null;
    }
  }
}
