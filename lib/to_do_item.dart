import 'package:flutter/material.dart'; //flutter sdk
import 'package:circular_check_box/circular_check_box.dart'; // https://pub.dev/packages/circular_check_box
import 'detail_screen.dart';

/*
  Single ToDo item
 */
class ToDoItem extends StatelessWidget {

  final String title;
  final bool done;
  final Function toggleDone;
  final Function remove;

  const ToDoItem(this.title, this.done, this.toggleDone, this.remove); // DEMO

  /* 
    define layout of a single ToDo item
  */
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[700],
        boxShadow: [
          BoxShadow(color: Colors.grey[800], spreadRadius: 1),
        ],
      ),
      child: ListTile( // https://api.flutter.dev/flutter/material/ListTile-class.html
        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
        leading: CircularCheckBox(
          value: done,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          onChanged: (bool value) => toggleDone(),
          activeColor: Colors.green[400],
        ),
        title: Text(this.title,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: done // change style depending on done state
                  ? Colors.grey
                  : Colors.white,
                decoration: done // change decoration depending on done state
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            )
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline), 
          onPressed: () => remove(),
          color: Colors.red,
          iconSize: 40,
        ),
        onTap: () { // open route for detail screen
          Navigator.push<Widget>(
            context, 
            MaterialPageRoute(
              builder: (BuildContext context) => DetailScreen(title, done)
            )
          );
        },
      ),
    );
  }
}