
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'customTextField.dart';

class CustomCreditCard extends StatefulWidget {
  CustomCreditCard({
    Key? key,
    required this.formKey,
    required this.autovalidateMode,
    required this.onAmountChanged,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  final Function(String) onAmountChanged;

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (value) {},
        ),
        CreditCardForm(
          isHolderNameVisible: true,
          autovalidateMode: widget.autovalidateMode,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange: (carditCardModel) {
            cardHolderName = carditCardModel.cardHolderName;
            expiryDate = carditCardModel.expiryDate;
            cvvCode = carditCardModel.cvvCode;
            cardNumber = carditCardModel.cardNumber;
            showBackView = carditCardModel.isCvvFocused;
            setState(() {});
          },
          formKey: widget.formKey,
        ),
        CustomTextField(
          hintText: 'Enter Amount',
          onChanged: (value) {
            // Update the amount variable
            widget.onAmountChanged(value);
          },
        ),
      ],
    );
  }
}
