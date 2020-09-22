import 'package:flutter/material.dart'; //flutter sdk

class AddToDoDialog extends StatefulWidget {

  final void Function(String txt) addToDo;
  const AddToDoDialog(this.addToDo);

  @override
  _AddToDoDialogState createState() => _AddToDoDialogState();
}

class _AddToDoDialogState extends State<AddToDoDialog> {

  final GlobalKey<FormState> formKey = GlobalKey();
  String todo;

  void save(){
    if(formKey.currentState.validate()){ // validate input (true if all validators return null)
      widget.addToDo(todo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title: Text("Hinzufügen"),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min, // form as small as possible
              children: <Widget>[
                TextFormField(
                  onChanged: (String input) => todo = input,
                  onFieldSubmitted: (String input) => save(),
                  validator: (String input) {
                    if(input.isEmpty){
                      return 'Pflichtfeld';
                    }
                    return null;
                  },
                ),
                RaisedButton(
                  onPressed: save,
                  color: Colors.red,
                  child: Text("Speichern", style: TextStyle(color: Colors.white, fontSize: 20))
                )
              ],
            )
          )
        );
  }
}