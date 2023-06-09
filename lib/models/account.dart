class Account {
  int? id;
  String username,
      role,
      fullname,
      gender,
      phone,
      email,
      profilePicture,
      location;
  DateTime dateOfBirth;

  Account({
    required this.id,
    required this.username,
    required this.role,
    required this.fullname,
    required this.gender,
    required this.dateOfBirth,
    required this.phone,
    required this.email,
    required this.profilePicture,
    required this.location,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
  return Account(
    id: json['userId'] as int?,
    role: json['roleName'] as String? ?? "",
    username: json['username'] as String,
    fullname: json['fullname'] as String,
    gender: json['gender'] as String,
    dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
    phone: json['phone'] as String,
    email: json['email'] as String,
    profilePicture: json['profilePicture'] as String? ?? "",
    location: json['location'] as String? ?? "",
  );
}


  Map<String, dynamic> toJson() {
    return {
      'userId': id,
      'username': username,
      'roleName': role,
      'fullname': fullname,
      'gender': gender,
      'phone': phone,
      'email': email,
      'profilePicture': profilePicture,
      'location': location,
      'dateOfBirth': dateOfBirth.toIso8601String(),
    };
  }
}
