/// This enum contains the names of the columns in the  table.
enum MemberTableNames {
  memberNumber,
  memberName,
  phoneNumber,
  membershipEndDate,
  role,
  age,
  membershipDuration,
  ;
}

/// This extension helps to convert a string to a TableNamesEnum.
extension StringToTableNamesEnum on String {
  /// Converts a string to a TableNamesEnum.
  MemberTableNames toTableNamesEnum() {
    switch (this) {
      case 'memberNumber':
        return MemberTableNames.memberNumber;
      case 'memberName':
        return MemberTableNames.memberName;
      case 'phoneNumber':
        return MemberTableNames.phoneNumber;
      case 'membershipEndDate':
        return MemberTableNames.membershipEndDate;
      case 'role':
        return MemberTableNames.role;
      case 'age':
        return MemberTableNames.age;
      case 'membershipDuration':
        return MemberTableNames.membershipDuration;
      default:
        return MemberTableNames.memberNumber;
    }
  }
}
