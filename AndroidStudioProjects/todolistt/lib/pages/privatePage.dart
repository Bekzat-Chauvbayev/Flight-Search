import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolistt/database/database.dart';
import 'package:todolistt/uti/dialogBox.dart';
import 'package:todolistt/uti/todo_tile.dart';
import 'package:todolistt/main.dart';
import 'package:todolistt/pages/home_page.dart';

class PrivatePage extends StatefulWidget{
  const PrivatePage({super.key});
  @override
  State<StatefulWidget> createState() => _PrivatePage();





}
class _PrivatePage extends State<PrivatePage> {
  @override
  final _myBox = Hive.box('myBox');
  TodoBase db = TodoBase();

  @override
  void initState() {
    if (_myBox.get("TODOPRIVATE") == null) {
      db.createInitialData();
    } else {
      db.loadPrivateData();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.privateToDoList[index][1] = !db.privateToDoList[index][1];
    });
    db.updatePrivateData();
  }

  void saveNewTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        db.privateToDoList.add([_controller.text, false]);
        _controller.clear();
      });
      db.updatePrivateData();
      Navigator.of(context).pop();
    }
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            save: saveNewTask,
            cancel: () => Navigator.of(context).pop(),
          );
        });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        title: Text('To do List'),
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.public),
              onPressed: () =>
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => HomePage()),(route)=>false)
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),),
      body: ListView.builder(
        itemCount: db.privateToDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(taskname: db.privateToDoList[index][0],
            taskComplete: db.privateToDoList[index][1],

            onChanged: (value) => checkBoxChanged(value!, index),
            deleteFunction: (context) => deleteTask(index),)

          ;
        },
      ),
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.privateToDoList.removeAt(index);
    });
    db.updatePrivateData();
  }
}
