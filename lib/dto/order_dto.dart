class OrderDto {
  String serviceName, workerName;
  DateTime orderDate, workDateTime;
  int renterId, employeeId, jobId;
  int workingHour;
  int sum;
  int totalNotDiscount;
  int discount;

  OrderDto(
      {required this.serviceName,
      required this.workerName,
      required this.orderDate,
      required this.renterId,
      required this.employeeId,
      required this.jobId,
      required this.workingHour,
      required this.sum,
      required this.workDateTime,
      required this.totalNotDiscount,
      required this.discount});
}
