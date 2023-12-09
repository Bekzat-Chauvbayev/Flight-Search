import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskname;
  final bool taskComplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;



  ToDoTile(
      {super.key,
      required this.taskname,
      required this.taskComplete,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 25, right: 25, top: 25),
        child: Slidable(
          endActionPane: ActionPane(motion: StretchMotion(),
            children: [
              SlidableAction(onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),)
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: taskComplete,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Text(
                  taskname,
                  style: TextStyle(
                      fontFamily: 'Proxima' ,
                      fontSize: 35,
                      decoration: taskComplete
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ],
            ),
          ),
        ));
  }
}
