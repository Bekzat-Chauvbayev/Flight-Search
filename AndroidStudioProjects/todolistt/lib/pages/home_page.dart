

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolistt/database/database.dart';
import 'package:todolistt/uti/dialogBox.dart';
import 'package:todolistt/uti/todo_tile.dart';
import 'package:todolistt/main.dart';
import 'package:todolistt/pages/privatePage.dart';

class HomePage extends StatefulWidget{
  TodoBase db = TodoBase();
  HomePage({
    super.key,
  });
  @override
  State<StatefulWidget> createState() => _HomePageState();





}
class _HomePageState extends State<HomePage>{
  @override
  final _myBox = Hive.box('myBox');

  TodoBase db = TodoBase();


  @override
  void initState() {
    if(_myBox.get("TODOLIST")==null){

      db.createInitialData();
    }else{
      db.loadData();
    }

    db.loadPassword();



    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }
  void saveNewTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        db.todoList.add([_controller.text, false]);
        _controller.clear();
      });
      db.updateData();
      Navigator.of(context).pop();
    }
  }
void createNewTask(){
  showDialog(
      context: context,
      builder: (context){
         return DialogBox(
            controller: _controller,
            save: saveNewTask,
            cancel: ()=> Navigator.of(context).pop(),
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
      icon: Icon(Icons.lock),
      onPressed: () => _showPasswordDialog(context),
      ),
        IconButton(
          icon: Icon(Icons.change_history),
          onPressed: () => _deletePasswordDialog(context),
        ),
      ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(taskname: db.todoList[index][0],
            taskComplete: db.todoList[index][1],

            onChanged: (value)=> checkBoxChanged(value!,index),
          deleteFunction: (context) => deleteTask(index),)

          ;
        },
      ),
    );
 }
void deleteTask(int index){
  setState(() {
    db.todoList.removeAt(index);
  });
  db.updateData();

}

  void _showPasswordDialog(BuildContext context) {
    if (db.password== null) {
      String newPassword = '';
      String confirmPassword = '';

      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text('Create Password'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    newPassword = value;



                  },
                  decoration: InputDecoration(
                    hintText: 'New Password',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    confirmPassword = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  if (newPassword == confirmPassword) {
                    setState(() {
                      db.password = newPassword;
                    });
                    db.updatePassword();

                    Navigator.pop(dialogContext); // Close dialog
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Incorrect Password'),
                        content: Text('Please enter the correct password.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                    );
                  }
                },
              ),
            ],
          );
        },
      );
    } else {
      String enteredPassword = '';

      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text('Enter Password'),
            content: TextField(
              obscureText: true,
              onChanged: (value) {
                enteredPassword = value;
              },
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  if (enteredPassword == db.password) {
                    Navigator.pop(dialogContext); // Close dialog
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => PrivatePage()), (route)=>false
                    );
                  } else {

                  }
                },
              ),
            ],
          );
        },
      );

    }
  }

  void _deletePasswordDialog(BuildContext context) {
    String enteredPassword = '';

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Delete Password'),
          content: TextField(
            obscureText: true,
            onChanged: (value) {
              enteredPassword = value;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Write Current Password',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel', style: TextStyle(color: Colors.black),),
              onPressed: () {
                Navigator.pop(dialogContext);
              },
            ),
            TextButton(
              child: Text('OK', style: TextStyle(color: Colors.black)),
              onPressed: () {
                if (enteredPassword == db.password) {
                  setState(() {
                    db.password = null;
                  });
                  db.updatePassword();

                  Navigator.pop(dialogContext);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.greenAccent,
                        title: Text('Incorrect Password', style: TextStyle(color: Colors.black)),
                        content: Text('Please enter the correct password.', style: TextStyle(color: Colors.black)),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK', style: TextStyle(color: Colors.black)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}