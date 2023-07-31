import 'package:dio/dio.dart';
import 'package:login_design/models/todo_model.dart';
class TodoService {
  String url ='https://jsonplaceholder.typicode.com/todos';
 Future<List<ToDo>> getTodos() async {
 List<ToDo> todos =[];
 Response response = await Dio().get(url);
 var data=response.data;
 data.forEach((element){
  ToDo todo=ToDo.fromJson(element);
  todos.add(todo);
 });
 
 return todos;
 }
}

