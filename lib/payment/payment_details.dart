import 'package:donation/core/utils/stylr.dart';
import 'package:donation/payment/payment_details_body_View.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});
  static String id = 'MyDonation';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
            child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        )),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Payment Details',
          textAlign: TextAlign.center,
          style: style.style25,
        ),
      ),
      body: PaymentBody(),
    );
  }
}
