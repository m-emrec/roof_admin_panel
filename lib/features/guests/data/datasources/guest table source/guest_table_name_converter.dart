part of 'guests_table_source.dart';

class _GuestColumnNameConverter {
  /// This method returns the [GuestTableNames] based on given [columnName]
  static GuestTableNames toGuestTableEnum(String columnName) {
    switch (columnName) {
      case "name":
        return GuestTableNames.name;
      case 'phoneNumber':
        return GuestTableNames.phoneNumber;
      case "gender":
        return GuestTableNames.gender;
      case "guestStartDate":
        return GuestTableNames.guestStartDate;
      case "joinedEventCount":
        return GuestTableNames.joinedEventCount;
      case "role":
        return GuestTableNames.role;
      default:
        return GuestTableNames.name;
    }
  }
}
