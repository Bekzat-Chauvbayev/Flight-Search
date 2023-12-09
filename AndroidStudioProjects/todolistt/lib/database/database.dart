import 'package:hive_flutter/hive_flutter.dart';

class TodoBase{
  List todoList=[];
  List privateToDoList = [];
  final _myBox = Hive.box('myBox');
  var password = null;


  void createInitialData(){
      todoList = [
        ['Make tutorial', false]
      ];
  }
  void loadPassword(){
    password = _myBox.get("PASSWORD");
  }

  void updatePassword(){
    _myBox.put("PASSWORD", password);
  }

  void loadData(){

    todoList = _myBox.get("TODOLIST");

  }

  void loadPrivateData(){
    privateToDoList = _myBox.get("TODOPRIVATE");

  }
  void updateData(){
    _myBox.put("TODOLIST", todoList);

  }
  void updatePrivateData(){
    _myBox.put("TODOPRIVATE", privateToDoList);


  }
}