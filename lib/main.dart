// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
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
  var mylist = <MyItem>[];

  @override
  void initState() {
    super.initState();
    mylist.add(MyItem(title: 'FirstItem', completed: false, onDelete: _totallyDeleteItem));
  }

  void printSample(){
    // print(mylist.length);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      
      appBar: new AppBar(title: new Text("Welcome to Todos List app"), backgroundColor: Color.alphaBlend(Colors.deepOrangeAccent, Colors.pinkAccent),),
      body: new Swiper(
      // ListView.separated(
        // itemCount: mylist.length,
        // itemBuilder: (BuildContext builder, int index) => mylist[index],
        
        // separatorBuilder: (context, index) {
        //   return Divider(indent: 0.0, height: 0.6 ,color: Colors.white,);
        // }
        
        itemBuilder: (BuildContext context,int index){
       return new Container(
            color: Colors.blue[50],
            // child: new Center(
            // child: new Text("sdssdfsdfsd"),),
        child: ListView.separated(
        itemCount: mylist.length,
        itemBuilder: (BuildContext builder, int index) => mylist[index],
        
        separatorBuilder: (context, index) {
          return Divider(indent: 0.0, height: 0.6 ,color: Colors.white,);
        }
        )

    );
          // return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
         
        },
        itemCount: 1,
        // pagination:  new SwiperPagination(
        //   margin: new EdgeInsets.all(20.0),
        // ),
        // control: new SwiperControl(),
      ),
      
      persistentFooterButtons: <Widget>[
        // new FloatingActionButton(onPressed: () { _addTodoField(); }, tooltip: "Add task", child: new Icon(Icons.add)),
        new RaisedButton(
                child: Text("Add Item"),
                onPressed: () { _addTodoField(); },
                color: Colors.deepOrangeAccent,
                textColor: Colors.black,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.pinkAccent),
        new RaisedButton(
                child: Text("Clear All"),
                onPressed: () { _clearList(); },
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
        mylist.add(MyItem(title: task, completed: false, onDelete: _totallyDeleteItem));
       }
   }

   void _totallyDeleteItem(String task) {
    setState(() {
       if (mylist.length > 0) {
        // mylist.removeAt(0);

        mylist.removeAt(mylist.indexWhere( ( e) => e.title == task));
        
      }
    });
   }

   void _clearAll() {
    setState(() {
       if (mylist.length > 0) {
        mylist.clear();
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

   void _clearList() {
    String myText = "";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text("Are you sure to delete your list??"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                _clearAll();
              Navigator.of(context).pop();
            }),
            new FlatButton(
              child: new Text("No"),
              onPressed: () {
                //DO NOTHING
                Navigator.of(context).pop();
              })
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


