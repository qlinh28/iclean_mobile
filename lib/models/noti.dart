class Noti {
  int id;
  String details, status;
  DateTime timestamp;
  bool deleted, read;

  Noti({
    required this.id,
    required this.details,
    required this.status,
    required this.timestamp,
    required this.deleted,
    required this.read,
  });
}
