import 'package:flutter/material.dart';
import 'package:untitled1/HomePage.dart';
import 'package:untitled1/profile_page.dart';
import 'package:untitled1/setting_page.dart';




class HomaPage extends StatefulWidget {
  final String email;
  const HomaPage({super.key ,required this.email});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  int _selectedIndex = 0; // current selected index

  // Define the pages to be displayed when each item is selected
  List<Widget> page = [
    HomePage(),
    Profilepage(),
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(title: Text("Homaaa page",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30
      ),
      )
        ,backgroundColor: Colors.lightBlueAccent,
        centerTitle: true ,

      ),*/
      /*body: Row(
        children: [
          Text("Hi "),
          Text( widget.email),
          Text(" in the home page")
        ],
      ),*/
     body: page[_selectedIndex],
     bottomNavigationBar: BottomNavigationBar(
       showSelectedLabels: false,
       showUnselectedLabels: false,
       items: [
         BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
         BottomNavigationBarItem(icon: Icon(Icons.person),label: "home"),
         BottomNavigationBarItem(icon: Icon(Icons.settings),label: "home"),
       ],
       onTap: (pageIndex){
         _selectedIndex=pageIndex;
             setState(() {});
       },
     )



    );
  }
}
