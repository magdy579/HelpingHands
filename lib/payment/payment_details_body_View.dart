import 'dart:developer';

import 'package:donation/core/utils/stylr.dart';
import 'package:donation/widget/CustomButton.dart';
import 'package:donation/widget/Custom_cradit_cart.dart';
import 'package:donation/widget/payment_method_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/card_info_widget.dart';
import '../widget/payment_info_item.dart';
import '../widget/payment_methods_list_view.dart';
import '../widget/total_price_widget.dart';


class PaymentBody extends StatefulWidget {
  const PaymentBody({Key? key}) : super(key: key);

  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String amount = ''; // Initialize amount variable

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PaymentMethodsListView(),
          CustomCreditCard(
            formKey: formKey,
            autovalidateMode: autovalidateMode,
            // Pass the callback function to CustomCreditCard
            onAmountChanged: (value) {
              // Update the amount variable
              setState(() {
                amount = value;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
              child: CustomButton(
                textButton: 'Pay',
                onTap: () {
                  // Validate the form
                  if (formKey.currentState!.validate()) {
                    // Get current date and time
                    DateTime now = DateTime.now();
                    String date = '${now.day}/${now.month}/${now.year}';
                    String time = '${now.hour}:${now.minute}';

                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFEDEDED),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25, left: 22, right: 22),
                            child: Column(
                              children: [
                                const Text(
                                  'Thank you!',
                                  textAlign: TextAlign.center,
                                  style: style.style25,
                                ),
                                Text(
                                  'Your transaction was successful',
                                  textAlign: TextAlign.center,
                                  style: style.style18,
                                ),
                                const SizedBox(
                                  height: 42,
                                ),
                                PaymentItemInfo(
                                  title: 'Date',
                                  value: date,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                PaymentItemInfo(
                                  title: 'Time',
                                  value: time,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // const PaymentItemInfo(
                                //   title: 'To',
                                //   value: 'Sam Louis',
                                // ),
                                const Divider(
                                  height: 60,
                                  thickness: 2,
                                ),
                                TotalPrice(
                                  title: 'Total',
                                  value: amount.toString(),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomButton(
                                  textButton: 'ok',
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    // If the form is not valid, enable auto-validation
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },

              ),
            ),
          ),
        ],
      ),
    );
  }
}
