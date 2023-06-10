class Address {
  int id, userId;
  String addressName, description, street;
  bool isDefault;
  double longitude, latitude;

  Address(
      {required this.id,
      required this.userId,
      required this.addressName,
      required this.description,
      required this.isDefault,
      required this.street,
      required this.longitude,
      required this.latitude});
}
