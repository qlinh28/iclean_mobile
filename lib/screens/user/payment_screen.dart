import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool showContent = false;

  void toggleContentVisibility() {
    setState(() {
      showContent = !showContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "iClean Payment",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey[400],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        const Text(
                          '1. Vào ứng dụng ngân hàng của bạn trên điện thoại và chọn chức năng quét mã QR',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '2. Quét mã QR bên dưới',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '3. Nhập số tiền bạn nạp vào tài khoản iClean Pay',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: const TextSpan(
                            text: '4. Nội dung chuyển tiền: ',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'ICLEAN a3xz',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '5. Hoàn tất quá trình chuyển tiền (tên người nhận tiền là NGUYEN PHUONG NHAT LINH)',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Sau khoảng 1, 2 phút xử lí tài khoản bạn sẽ được cộng tiền.',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Image.asset(
                            'assets/images/qr-code.jpg',
                            height: 300,
                            width: 300,
                          ),
                        ),
                        GestureDetector(
                          onTap: toggleContentVisibility,
                          child: RichText(
                            text: const TextSpan(
                              text: 'Nếu không quét mã được, ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              children: [
                                TextSpan(
                                  text:
                                      'bấm vào đây để xem thông tin chuyển tiền',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: showContent,
                          child: Column(
                            children: [
                              const SizedBox(height: 8),
                              const Text(
                                'Chú ý trong app ngân hàng chọn Chuyển tiền nhanh (Naspas) thì giao dịch mới được thực hiện ngay lập tức (nếu không sẽ phải chờ nhân viên ngân hàng xử lý):',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Ngân hàng Thương mại Cổ phần Tiên Phong (TPBank)',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Số tài khoản: 0412 9156 501',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Tên người nhận: NGUYEN PHUONG NHAT LINH',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              RichText(
                                text: const TextSpan(
                                  text: 'Nội dung chuyển tiền: ',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: 'ICLEAN a3xz',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Chú ý nhập đúng nội dung chuyển tiền để hệ thống tự động xử lý cộng tiền vào tài khoản bạn!',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          children: [
            Divider(
              thickness: 0.5,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 16,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
