import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../constes/constk.dart';
import '../models/massege.dart';

class chatBot extends StatefulWidget {
  const chatBot({
    Key? key,
  }) : super(key: key);

  @override
  State<chatBot> createState() => _chatBotState();
}

class _chatBotState extends State<chatBot> {
  TextEditingController _userinput = TextEditingController();
  static final apikey = 'AIzaSyDUwGqyZ2vkuKsDeduKJ2zdUWjlALfDVTc';
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apikey);
  final List<Message> messages = [];
  Future<void> talkWithGemini() async {
    final usermassege = _userinput.text;
    setState(() {
      messages.add(
       Message(isuser: true, message: usermassege, date: DateTime.now().toString())
      );
    });


    final content = Content.text(usermassege);
    final response = await model.generateContent([content]);
    // print('response from Gemini ai :$response');
    setState(() {
      messages.add(
          Message(isuser: false, message: response.text??'', date: DateTime.now().toString())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,

              )),

        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Helper Bot'),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length, // Specify itemCount
              itemBuilder: (context, index) {
                final message = messages[index];
                return Messages(isUser: message.isuser, massage: message.message, date: message.date);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 15,
                  child: TextFormField(
controller: _userinput,

                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        label: Text('Enter Your Message'),
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                    padding: EdgeInsets.all(12),
                    iconSize: 30,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(CircleBorder())
                    ),
                    onPressed: (){
                      talkWithGemini();
                      _userinput.clear();
                    },
                    icon: Icon(Icons.send))
              ],
            ),



    ),

        ],
      ),
    );
  }
}
