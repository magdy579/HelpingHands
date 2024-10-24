import 'package:flutter/material.dart';
import 'package:donation/models/urequest.dart';
import '../payment/payment_details.dart';
import '../widget/CustomButton.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({
    Key? key,
    required this.name,
    required this.age,
    required this.title,
    required this.gender,
    required this.description,
    required this.amount,
    required this.email,
  }) : super(key: key);

  final UserRequest name;
  final UserRequest age;
  final UserRequest title;
  final UserRequest gender;
  final UserRequest description;
  final UserRequest amount;
  final UserRequest email;

  @override
  Widget build(BuildContext context) {
    double donationProgress = 0.5;

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
        backgroundColor: Colors.white,
        elevation: 0.1,
        centerTitle: true,


      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/donation.jpg'),
                      fit: BoxFit.cover,

                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40),
                  topRight: const Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 7),
                    Text(
                      title.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 7),
                    Row(
                      children: [
                        Text(
                          name.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                        ),
                      ],
                    ),

                    SizedBox(height: 7),
                    Text(
                      'About Campaign:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Target:',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        Text(
                          '\$${amount.amount}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Age: ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          age.age,
                          style: TextStyle(
                            fontSize: 12,


                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
                    Text(
                      email.email,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LinearProgressIndicator(
                              value: donationProgress,
                              backgroundColor: Colors.grey[500],
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Text(
                          '${(donationProgress * 100).toInt()}%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      textButton: 'Donate',
                      onTap: () {
                        Navigator.pushNamed(context, PaymentPage.id);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
