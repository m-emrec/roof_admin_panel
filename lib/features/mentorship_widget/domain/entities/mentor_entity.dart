class UserInfoEntity {
  UserInfoEntity({
    required this.uid,
    required this.name,
    this.imageUrl,
  });

  final String uid;

  final String name;
  final String? imageUrl;
}
