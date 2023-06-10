import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:iclean_flutter/dto/order_dto.dart';
import 'package:intl/intl.dart';

class EReceiptScreen extends StatefulWidget {
  final String barcodeData;
  final OrderDto orderDto;
  const EReceiptScreen(
      {Key? key, required this.barcodeData, required this.orderDto})
      : super(key: key);

  @override
  State<EReceiptScreen> createState() => _EReceiptScreenState();
}

class _EReceiptScreenState extends State<EReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Row(children: [
                    InkWell(
                      onTap: () {
                        int count = 6;
                        Navigator.of(context).popUntil((_) => count-- <= 0);
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      "E-Receipt",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 25),
                Text(
                  'Booking Code: ${widget.barcodeData}',
                  style: const TextStyle(fontSize: 16),
                ),
                Center(
                  child: BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: widget.barcodeData,
                    width: 200,
                    height: 100,
                    drawText: false,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Service",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              Text(
                                widget.orderDto.serviceName,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Worker",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              Text(
                                widget.orderDto.workerName,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Date & Time",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              Text(
                                DateFormat('MMM d, yyyy | hh:mm aaa')
                                    .format(DateTime.now()),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Working Hours",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                              ),
                            ),
                            Text(
                              widget.orderDto.workingHour.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "House Cleaning",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              Text(
                                "${NumberFormat('#,###').format(widget.orderDto.totalNotDiscount)} VNĐ",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Promo',
                                style: TextStyle(
                                  color: Colors.deepPurple.shade300,
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              Text(
                                "- ${NumberFormat('#,###').format(widget.orderDto.discount)} VNĐ",
                                style: TextStyle(
                                  color: Colors.deepPurple.shade300,
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              Text(
                                "${NumberFormat('#,###').format(widget.orderDto.sum)} VNĐ",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Date",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              Text(
                                DateFormat('MMM d, yyyy | hh:mm aaa')
                                    .format(DateTime.now()),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Status",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.shade100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "Paid",
                                style: TextStyle(
                                    color: Colors.deepPurple.shade400,
                                    fontSize: 13,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
