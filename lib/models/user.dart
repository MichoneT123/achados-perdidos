class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final UserType type;
  final String institution;
  final String profilePicture;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.type,
    required this.institution,
    required this.profilePicture,
  });
}

enum UserType {
  admin,
  regular,
}
