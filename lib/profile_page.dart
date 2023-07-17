import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/utitlies.dart';
class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  void initState(){
    super.initState();
    getEmail();
  }
  String userEmail ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile page",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30
      ),
      )
        ,backgroundColor: Colors.lightBlueAccent,
        centerTitle: true ,

      ),
      body: Text(userEmail),
    );
  }
  getEmail() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userEmail=prefs.getString("email")??"--";
    setState(() {

    });

  }
}
