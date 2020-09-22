/*
  -stful / stless template
  -convert to stateless/stateful (click and hover class)
  -Outline / tree view (Flutter symbol in left bar)

 */

import 'package:flutter/material.dart'; //flutter sdk
import 'add_todo_dialog.dart';
import 'to_do_item.dart';

void main() =>
    runApp(MaterialApp(home: ToDo())); // application that uses material design

/* 
  State of the app widget
 */
class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState(); // bind state to widget
}

/* 
  The app itself
 */
class _ToDoState extends State<ToDo> {
  
  Map<String, bool> todos = {
    'Kaffee holen': true,
    'Foliensatz erstellen': true,
    'Example App programmieren': true,
    'Fehlende Funktion einbauen': false,
    'Demo': false,
  };

  void addToDo(String key) {
    // update user interface
    setState(() {
      todos[key] = false;
    });
    Navigator.of(context).pop(); // close dialog
  }

  void deleteTodo(String key){
    setState(() {
      todos.remove(key);
    });
  }

  void newEntry() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AddToDoDialog(addToDo); // open dialog, pass function
      }
    );
  }

  void toggleDone(String key) {
    // update user interface
    setState(() {
      todos.update(key, (bool done) => !done);
    });
  }

  /* 
    define layout of the app in build method (scaffold = material design layout structure)
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('CCC Code Wild West Demo'), backgroundColor: Colors.grey[800]),
      body: Container(
        color: Colors.grey[800],
        child: ListView.builder( //build list with 1 element for each todo
            itemCount: todos.length,
            itemBuilder: (context, i) {
              String todo = todos.keys.elementAt(i);
              // return 1 ToDoItem Widget for each todo
              return ToDoItem(
                todo, //todo title
                todos[todo], //done
                () => toggleDone(todo), //toggle function
                () => deleteTodo(todo)
              );
            }),
      ),
      floatingActionButton:
          FloatingActionButton(
            onPressed: newEntry, 
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 40.0
            ),
            backgroundColor: Colors.lightBlue[300],
          ),
    );
  }
}