// ignore_for_file: public_member_api_docs

enum AddMemberTableColumnNames {
  memberNumber,
  name,
  phoneNumber,
  role,
  mentor,
  gender,
  membershipStartDate,
  membershipDuration;

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
}
