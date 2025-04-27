enum AddMemberTableColumnNames {
  memberNumber,
  name,
  phoneNumber,
  role,
  mentor,
  gender,
  membershipStartDate,
  membershipDuration;

  static final _locale = {
    memberNumber: "Member Number",
    name: "Name",
    phoneNumber: "Phone Number",
    role: "Role",
    mentor: "Mentor",
  };

  static AddMemberTableColumnNames toTableNamesEnum(String tableName) {
    switch (tableName) {
      case 'memberNumber':
        return AddMemberTableColumnNames.memberNumber;
      case 'name':
        return AddMemberTableColumnNames.name;
      case 'phoneNumber':
        return AddMemberTableColumnNames.phoneNumber;
      case 'role':
        return AddMemberTableColumnNames.role;
      case 'mentor':
        return AddMemberTableColumnNames.mentor;
      default:
        return AddMemberTableColumnNames.memberNumber;
    }
  }

  String get toLocale {
    if (_locale.containsKey(this)) {
      return _locale[this]!;
    }
    return "";
  }
}
