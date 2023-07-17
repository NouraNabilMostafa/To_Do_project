import 'package:flutter/material.dart';
import 'package:untitled1/models/to_do.dart';
import 'package:untitled1/services/todo_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<ToDo> titles=[];
  bool isLoading=true;
  getCompletness()async{
    titles=await ToDo_service().getCompletnessdata();
    setState(() {});
    isLoading=false;
  }
  @override
  void initState(){
    super.initState();
    getCompletness();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home page",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30
      ),
      )
        ,backgroundColor: Colors.lightBlueAccent,
        centerTitle: true ,

      ),
      body: isLoading
          ? Center(
             child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: titles.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: Text(titles[index].id.toString()?? "--"),
            title: Text(titles[index].title ??"--"),
            trailing: Text("completed: "+titles[index].completed.toString() ),);

        },

      ),
    );

  }
}

