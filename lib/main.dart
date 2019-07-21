// import 'dart:async';

import 'package:flutter/material.dart';
import 'item.dart';

void main() =>  runApp(MyTodoApp());

class MyTodoApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    var materialApp = new MaterialApp(
          title: "ToDos Lists",
          theme: ThemeData(primarySwatch: Colors.cyan),
          home: HomePage()
        );
        return materialApp;
  }
}

class HomePage extends StatefulWidget {
  HomePageState home = HomePageState();
  @override
  HomePageState createState() => home;
}

class HomePageState extends State<HomePage> {
  var mylist = <Widget>[];

  @override
  void initState() {
    super.initState();
    mylist.add(MyItem(title: 'FirstItem', completed: false));
  }

  void printSample(){
    print(mylist.length);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(title: new Text("Welcome to Todos List app"), backgroundColor: Color.alphaBlend(Colors.deepOrangeAccent, Colors.pinkAccent),),
      body: ListView.builder(
        itemCount: mylist.length,
        itemBuilder: (BuildContext builder, int index) => mylist[index],
      ),
      persistentFooterButtons: <Widget>[
        // new FloatingActionButton(onPressed: () { _addTodoField(); }, tooltip: "Add task", child: new Icon(Icons.add)),
        new RaisedButton(
                child: Text("Add Item"),
                onPressed: () { _addTodoField(); },
                color: Colors.deepOrangeAccent,
                textColor: Colors.black,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.pinkAccent)
      ],
      drawer: Container(
        width: 150.0,
        color: Color.alphaBlend(Colors.deepOrangeAccent, Colors.pinkAccent),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ),
              ListTile(
                leading: Icon(
                  Icons.list,
                  color: Colors.black,
                ),
                title: Text(
                  'New List',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ),
              ListTile(
                leading: Icon(
                  Icons.storage,
                  color: Colors.black,
                ),
                title: Text(
                  'Saved Lists',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              )
            ],
          ),
        ),
      ),
      // body: Container (
      //   child: BottomAppBar(
      //     child: Column(
      //       //mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         ListView.builder(
      //           itemCount: mylist.length,
      //           itemBuilder: (BuildContext builder, int index) => mylist[index],
      //         )
      //         ,
      //       new RaisedButton(
      //           child: Text("Add Item"),
      //           onPressed: () { _addTodoField(); },
      //           color: Colors.deepOrangeAccent,
      //           textColor: Colors.black,
      //           padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      //           splashColor: Colors.pinkAccent),
      //       ]    
      // )
      // )
      // )
    );
  }

  void _addItem(String task) {
       if (task.length > 0) {
        mylist.add(MyItem(title: task, completed: false));
       }
   }

   void _totallyDeleteItem(String task) {
    setState(() {
       if (mylist.length > 0) {
        mylist.removeAt(mylist.indexOf(new Text(task)));
      }
    });
   }

   void _addTodoField() {
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
          setState(() {
          _addItem(myText);
          });
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

  void _popupDelete(String task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text("Are you sure to remove this item from your list permanently??"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                _totallyDeleteItem(task);
              Navigator.of(context).pop();
            }),
            new FlatButton(
              child: new Text("No"),
              onPressed: () {
                //DO NOTHING
                Navigator.of(context).pop();
              })
          ]
          );
        }
        );
  }
}


