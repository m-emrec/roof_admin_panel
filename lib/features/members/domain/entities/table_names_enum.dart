/// This enum contains the names of the columns in the  table.
enum TableNamesEnum {
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
  TableNamesEnum toTableNamesEnum() {
    switch (this) {
      case 'memberNumber':
        return TableNamesEnum.memberNumber;
      case 'memberName':
        return TableNamesEnum.memberName;
      case 'phoneNumber':
        return TableNamesEnum.phoneNumber;
      case 'membershipEndDate':
        return TableNamesEnum.membershipEndDate;
      case 'role':
        return TableNamesEnum.role;
      case 'age':
        return TableNamesEnum.age;
      case 'membershipDuration':
        return TableNamesEnum.membershipDuration;
      default:
        return TableNamesEnum.memberNumber;
    }
  }
}
