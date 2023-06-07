class FeedbackOrder {
  int id, rate /*, user_id*/, employeeId;
  String detail, profilePicture, username;
  DateTime timestamp;
  FeedbackOrder({
    required this.id,
    required this.rate,
    // required this.user_id,
    required this.employeeId,
    required this.detail,
    required this.profilePicture,
    required this.username,
    required this.timestamp,
  });
}
