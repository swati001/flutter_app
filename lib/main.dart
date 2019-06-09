// import 'dart:async';

import 'package:flutter/material.dart';

void main() =>  runApp(MyTodoApp());

class MyTodoApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    var materialApp = new MaterialApp(
          title: "ToDos Lists",
          theme: ThemeData(primarySwatch: Colors.cyan),
          home: new MyState()
        );
        return materialApp;
  }
}

class MyState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyTodoState();
  }
}

class MyTodoState extends State<MyState> {
  List<String> _todoItems = [];
  TextDecoration _decorationVar = TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold (
            appBar: new AppBar(title: new Text("Welcome to Todos List app")),
            body: _buildTodoList(),
            // floatingActionButton: new FloatingActionButton(onPressed: _addTodoField, tooltip: "Add task", child: new Icon(Icons.add)),
            persistentFooterButtons: <Widget>[
              new FloatingActionButton(onPressed: _addTodoField, tooltip: "Add task", child: new Icon(Icons.add)),
            ],
            );
  }

   void _addItem(String task) {
     setState(() {
       if (task.length > 0) {
        _todoItems.add(task);
       }
     });
   }
   void _removeItem(int index) {
    //  var mytext = _todoItems[index];
    
     setState(() {
      //  _decorationVar = TextDecoration.lineThrough;
       _todoItems.removeAt(index);
       
     });
   }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if(index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }
  Widget _buildTodoItem(String todoText, index) {
    return new ListTile (
      title: new Text(todoText, style: TextStyle(decoration: _decorationVar)),
      onTap: () => _popupRemoveTodo(index)
      );
  }
  
  @override
  void initState() {
    // decorationVar = false;
  }
          
  
            
  void _addTodoField() {
    // Navigator.of(context).push(
    //   new MaterialPageRoute(builder: (context) {
    //   return new Scaffold (
    //     appBar: new AppBar(title: new Text("Add a new Todo task")),
    //     body: new TextField(autofocus: true, onSubmitted:  (val) {
    //       _addItem(val);
    //       Navigator.pop(context); //this removes the field after done writing
    //     },
    //     decoration: new InputDecoration(
    //       hintText: "Write here your todo task", 
    //       contentPadding: const EdgeInsets.all(20.0)
    //     ),
    //   )
    //   );
    //   }
    //   )
    // );

    String myText = "";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text("Add a new task"),
          content: new Row(
          children: <Widget>[
            new Expanded(
                child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                  hintText: 'Write here your todo task',
                  contentPadding: const EdgeInsets.all(20.0)),
              onChanged: (val) {
                myText = val;
              },
            ))
          ],
        ),
        actions: <Widget>[
        new FlatButton(child: new Text("Submit"),
        onPressed: () {
          _addItem(myText);
          Navigator.of(context).pop();
        }
        ),
        new FlatButton(
        child: new Text("Cancel"),
        onPressed: () {
          Navigator.of(context).pop();
          }
      )
      ],
        );
      }
    );
  }


  void _popupRemoveTodo(int index) {
    showDialog (
      context: context,
    builder: (BuildContext context) {
      
      return new AlertDialog(
        title: new Text("Do you want to remove task \"${_todoItems[index]}\" ?"),
        actions: <Widget>[
        new FlatButton(child: new Text("Complete it"),
        onPressed: () {
          _removeItem(index);
          Navigator.of(context).pop();
        }),
        new FlatButton(
        child: new Text("Keep it"),
        onPressed: () {
          Navigator.of(context).pop();
          }
      )
      ],
      
      );

    }
    );

  }
}


