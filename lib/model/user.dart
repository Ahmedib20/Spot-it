class UserObject {
  final String? fullName;
  final String? email;
  final String? profilePicUrl;

  UserObject(
      {required this.fullName,
      required this.email,
      required this.profilePicUrl});

  factory UserObject.fromJson(Map<String, dynamic> json) {
    var fullName = json['fullName'];
    var email = json['email'];
    var profilePicUrl = json['profilePicUrl'] ?? '';

    return UserObject(
        email: email, fullName: fullName, profilePicUrl: profilePicUrl);
  }
}
