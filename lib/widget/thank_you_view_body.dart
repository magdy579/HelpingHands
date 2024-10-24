import 'package:donation/core/utils/stylr.dart';
import 'package:flutter/material.dart';

import '../widget/payment_info_item.dart';
import '../widget/total_price_widget.dart';
import '../widget/card_info_widget.dart';
import '../widget/custom_check_icon.dart';
import '../widget/custom_dashed_line.dart';
import '../widget/thank_you_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankYouViewBody extends StatelessWidget {
  ThankYouViewBody({required this.amount});

  final dynamic amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              color: const Color(0xFFEDEDED),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
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
                  const PaymentItemInfo(
                    title: 'Date',
                    value: '01/24/2023',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PaymentItemInfo(
                    title: 'Time',
                    value: '10:15 AM',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PaymentItemInfo(
                    title: 'To',
                    value: 'Sam Louis',
                  ),
                  const Divider(
                    height: 60,
                    thickness: 2,
                  ),
                  TotalPrice(title: 'Total', value: amount.toString()),
                  const SizedBox(
                    height: 30,
                  ),
                  const CardInfoWidget(),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        FontAwesomeIcons.barcode,
                        size: 64,
                      ),
                      Container(
                        width: 113,
                        height: 58,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1.50, color: Color(0xFF34A853)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'PAID',
                            textAlign: TextAlign.center,
                            style: style.style24
                                .copyWith(color: const Color(0xff34A853)),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            left: 20 + 8,
            right: 20 + 8,
            child: const CustomDashedLine(),
          ),
          Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}
