import 'package:donation/constes/constk.dart';

class UserRequest{
  final String title;
  final String name;
  final String age;
  final String gender;
  final String description;
  final String amount;
  final String email;

  UserRequest(this.title,this.name, this.age, this.gender, this.description,this.amount, this.email);
  factory UserRequest.fromjson(jsonData)
  {
    return UserRequest(jsonData['title'],jsonData[kname],jsonData[kage],jsonData[kgender],jsonData[kdescription],jsonData[kamount],jsonData[kemail]) ;
  }

}
