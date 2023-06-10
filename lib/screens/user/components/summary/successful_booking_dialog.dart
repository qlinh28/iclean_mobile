import 'package:flutter/material.dart';
import 'package:iclean_flutter/dto/order_dto.dart';
import 'package:iclean_flutter/screens/user/e-receipt_sceen.dart';

class BookingSuccessDialog extends StatefulWidget {
  final String bookingCode;
  final OrderDto orderDto;
  const BookingSuccessDialog(
      {Key? key, required this.bookingCode, required this.orderDto})
      : super(key: key);
  @override
  State<BookingSuccessDialog> createState() => _BookingSuccessDialogState();
}

class _BookingSuccessDialogState extends State<BookingSuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.deepPurple.shade300,
              size: 80.0,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Booking Successful!',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 20.0,
                color: Colors.deepPurple.shade300,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'You have successfully made payment and book the services.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Lato',
              ),
            ),
            const SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EReceiptScreen(
                            barcodeData: widget.bookingCode,
                            orderDto: widget.orderDto)));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 14,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    "View E-Receipt",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple.shade300,
              ),
              child: const Text(
                'Close',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
