class UserEntity {
  final String name;
  final String email;
  final String uid;
  final String profileUrl;
  final String accountType;
  final bool isOnline;
  final String isHide;

  UserEntity({
   required this.name,
   required this.email,
   required this.uid,
   required this.profileUrl,
   required this.accountType,
   required this.isOnline,
   required this.isHide,
  });
}
