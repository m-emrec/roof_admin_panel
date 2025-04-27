class AddMentorEntity {
  AddMentorEntity({
    required this.uid,
    required this.name,
    required this.memberCount,
    this.imageUrl,
  });

  final String uid;
  final String name;
  final String? imageUrl;
  final int? memberCount;
}
