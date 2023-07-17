
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/to_do.dart';
import '../../services/todo_service.dart';
part 'to_dos_state.dart';

class ToDosCubit extends Cubit<ToDosState> {
  ToDosCubit() : super(ToDosInitial()){
    getCompletness();
  }

  List<ToDo> titles=[];
  bool isLoading=true;

  getCompletness()async{
    emit(ToDosLoading());
    try{
      titles=await ToDo_service().getCompletnessdata();
      isLoading=false;
      //throw Exception();
      emit(ToDosSuccess());
    }catch (e){
      print(e.toString());
      emit(ToDosError());
  }

  }
}
