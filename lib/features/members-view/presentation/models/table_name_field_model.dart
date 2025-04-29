class TableNameFieldModel {
  TableNameFieldModel({
    required this.name,
    required this.phoneNumber,
    this.imageUrl,
  });
  final String name;
  final String phoneNumber;
  final String? imageUrl;
  int compareTo(TableNameFieldModel other) {
    final nameChars = name.replaceAll(" ", "").split("");
    final otherChars = other.name.replaceAll(" ", "").split("");

    for (var i = 0; i < nameChars.length; i++) {
      if (i >= otherChars.length) {
        return 1;
      }
      final nameChar = nameChars[i].toLowerCase();
      final otherChar = otherChars[i].toLowerCase();
      final nameCharIsDigit = int.tryParse(nameChar) != null;
      final otherCharIsDigit = int.tryParse(otherChar) != null;

      if (nameCharIsDigit && otherCharIsDigit) {
        final nameNumber = int.parse(nameChar);
        final otherNumber = int.parse(otherChar);
        if (nameNumber != otherNumber) {
          return nameNumber.compareTo(otherNumber);
        }
      } else if (nameCharIsDigit) {
        return 1;
      } else if (otherCharIsDigit) {
        return -1;
      } else {
        final comparison = nameChar.compareTo(otherChar);
        if (comparison != 0) {
          return comparison;
        }
      }
    }

    return nameChars.length.compareTo(otherChars.length);
  }
}
