class Profile {
  String employeeName, srcPicture, location, description, jobName;
  int price, employeeId, jobId, countRate;
  double averageRate;
  String? thumnailImg;

  Profile({
    required this.employeeId,
    required this.jobId,
    required this.employeeName,
    required this.srcPicture,
    required this.description,
    required this.countRate,
    required this.averageRate,
    required this.location,
    required this.jobName,
    required this.price,
  });
}
