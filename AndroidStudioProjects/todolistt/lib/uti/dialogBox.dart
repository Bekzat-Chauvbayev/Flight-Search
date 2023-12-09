import 'package:flutter/material.dart';
import 'package:todolistt/uti/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
   VoidCallback save;
   VoidCallback cancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.save,
      required this.cancel});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller:  controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Buttons(text: 'Save', onpressed: save),
                Buttons(text: 'Cancel', onpressed: cancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
