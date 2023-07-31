
import 'package:flutter/material.dart';
import 'package:login_design/models/todo_model.dart';

import '../../services/todo_service.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key, required String title});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<ToDo> todos=[];
  getTodesFromApi()async{
    todos=await TodoService().getTodos();
    setState(() {});

  }
  @override
  void initState() {
   
    super.initState();
     getTodesFromApi();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text(todos[index].title ??'--'),) ;
        
          
        }) ,);
      
  }
}