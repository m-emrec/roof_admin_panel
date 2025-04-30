class BannedMemberEntity {
  BannedMemberEntity({
    required this.name,
    required this.phoneNumber,
    required this.bannedDate,
    required this.reason,
    this.uid,
    this.imageUrl,
  });

  final String? uid;
  final String name;
  final String phoneNumber;
  final String? imageUrl;
  final DateTime? bannedDate;
  final String? reason;
}
