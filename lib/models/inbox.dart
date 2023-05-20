class Inbox {
  int userId, unreadMess;
  String name, image, newestMess;
  DateTime timestamp;
  bool read;

  Inbox({
    required this.userId,
    required this.name,
    required this.image,
    required this.newestMess,
    required this.timestamp,
    required this.read,
    required this.unreadMess,
  });
}
