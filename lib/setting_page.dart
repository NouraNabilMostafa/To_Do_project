import 'package:flutter/material.dart';
import 'package:untitled1/subjects.dart';
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting page",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30
      ),
      )
        ,backgroundColor: Colors.lightBlueAccent,
        centerTitle: true ,

      ),
      body: SubjectTask(),
    );
  }
}
