class Account {
  int? id;
  String username,
      role,
      fullname,
      gender,
      phone,
      email,
      profilePicture,
      locationName,
      description,
      street;
  double longitude, latitude;
  int point;

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
    required this.locationName,
    required this.description,
    required this.street,
    required this.longitude,
    required this.latitude,
    required this.point,
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
      locationName: json['locationName'] as String? ?? "",
      description: json['description'] as String? ?? "",
      street: json['street'] as String? ?? "",
      longitude: json['longitude'] as double? ?? 0,
      latitude: json['latitude'] as double? ?? 0,
      point: json['point'] as int? ?? 0,
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
      'locationName': locationName,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'description': description,
      'street': street,
      'longitude': longitude,
      'latitude': latitude,
      'point': point,
    };
  }
}
