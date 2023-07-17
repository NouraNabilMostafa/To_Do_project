import 'package:dio/dio.dart';
import 'package:untitled1/models/to_do.dart';

class ToDo_service{
  String url="https://jsonplaceholder.typicode.com/todos";

  Future<List<ToDo>>getCompletnessdata()async{
    List<ToDo>completness=[];
    final dio = Dio();
    final response = await dio.get(url);
    var data=response.data;
    data.forEach((jsonElement){
      ToDo title =ToDo.fromJson( jsonElement);
      completness.add(title);
    });
    return completness;
    }

  }
