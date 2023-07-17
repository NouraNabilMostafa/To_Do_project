import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/models/to_do.dart';
import 'package:untitled1/services/todo_service.dart';
import 'package:untitled1/views/toDos/to_dos_cubit.dart';

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
      body:
      BlocProvider(
        create: (context) => ToDosCubit(),
        child:BlocConsumer<ToDosCubit,ToDosState>
          (builder: (context,state){
            if (state is ToDosLoading){
              return  const Center(
                child: CircularProgressIndicator(),
              );
            } else if(state is ToDosSuccess){
              return ListView.builder(
                  itemCount: context.watch<ToDosCubit>().titles.length,
                  itemBuilder: (BuildContext context, int index){
                return ListTile(
                  leading: Text(context.watch<ToDosCubit>().titles[index].id.toString()?? "--"),
                  title: Text(context.watch<ToDosCubit>().titles[index].title ??"--"),
                  trailing: Text("completed: "+context.watch<ToDosCubit>().titles[index].completed.toString() ),
                );

              },
            );
        } else{
              return const Center(
                child: Text("error in the screen"),
              );
            }
    },
            listener: (context,state){
               if (state is ToDosError){
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                   content: Text("we have error"),
                 ));
               }
            },
        ),
      )
      );
  }
}

/*isLoading
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

      ),*/