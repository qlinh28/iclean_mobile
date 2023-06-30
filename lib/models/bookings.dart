class Booking {
  int id, userId, empId, jobId, workTime, price;
  String username,
      empName,
      status,
      location,
      jobName,
      description,
      jobImage,
      imgRenter,
      imgEmployee;
  DateTime timestamp;
  double longitude, latitude;
  Booking(
      {required this.id,
      required this.userId,
      required this.empId,
      required this.jobId,
      required this.workTime,
      required this.price,
      required this.username,
      required this.empName,
      required this.status,
      required this.location,
      required this.jobName,
      required this.description,
      required this.jobImage,
      required this.timestamp,
      required this.imgEmployee,
      required this.longitude,
      required this.latitude,
      required this.imgRenter});
}
