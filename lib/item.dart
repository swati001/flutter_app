// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'main.dart' as main;
// void main() =>  runApp(MyTodoApp());

class MyItem extends StatefulWidget{
  final String title;
  bool completed;
  MyItem({this.title, this.completed});

  
  @override
  State<MyItem> createState() => MyItemState();
}


class MyItemState extends State<MyItem> {
  
  main.HomePageState home;
  @override
  void initState() {
    super.initState();
    home= new main.HomePageState();
    home.printSample();
  }
  @override
  Widget build(BuildContext context) {
      // return new ListTile (
      // title: new Text(widget.title, style: TextStyle(decoration: widget.completed ? TextDecoration.lineThrough: TextDecoration.none, color: widget.completed ? Colors.grey: Colors.black)),

      // onTap: ()
      // {
      //   // setState(() {
      //   //   widget.completed = !widget.completed;
      //   // });
      //   _popupRemoveTodo(widget.title);
      // },
      // // onLongPress: () { _popupDelete(widget.title); },
      // );

      return new Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: Container(
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigoAccent,
                child: new Icon(Icons.list),
                foregroundColor: Colors.white,
              ),
              title: new Text(widget.title, style: TextStyle(decoration: widget.completed ? TextDecoration.lineThrough: TextDecoration.none, color: widget.completed ? Colors.grey: Colors.black)),
              // subtitle: Text('SlidableDrawerDelegate'),
            ),
          ),
          actions: <Widget>[
            IconSlideAction(
              caption: 'Archive',
              color: Colors.blue,
              icon: Icons.archive,
              // onTap: () => home.printSample(),
            ),
            IconSlideAction(
              caption: 'Share',
              color: Colors.indigo,
              icon: Icons.share,
            ),
          ],
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'More',
              color: Colors.black45,
              icon: Icons.more_horiz,
              onTap: () => _popupMore('More'),
            ),
            IconSlideAction(
              caption: 'Mark', 
              color: Colors.red,
              icon: Icons.strikethrough_s,
              onTap: () => _popupRemoveTodo(widget.title),
            ),
          ],
        );
    }

    _popupMore(String a) {
      return showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Delete'),
                content: Text('Item will be deleted'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              );
            },
          );
    }

  // void _addItem(String task) {
  //    setState(() {
  //      if (task.length > 0) {
  //       // _todoItems.add(task);
  //       MyItem(title: task, completed: false);
  //       widget.completed = !widget.completed;
  //      }
  //    });
  //  }

   void _removeItem(String task) {
     setState(() {
       if (!widget.completed) {
          widget.completed = !widget.completed;
       }
     });
   }

   void _keepItem(String task) {
     setState(() {
       if (widget.completed) {
          widget.completed = !widget.completed;
       }
     });
   }

   void _popupRemoveTodo(String task) {
    showDialog (
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text("Do you want to mark this task \"${task}\" ?"),
          actions: <Widget>[
          new FlatButton(child: new Text("Complete it"),
          onPressed: () {
            _removeItem(task);
            Navigator.of(context).pop();
          }),
          new FlatButton(
          child: new Text("Keep it"),
          onPressed: () {
            _keepItem(task);
            Navigator.of(context).pop();
            }
        )
        ],
        
        );
      }
    );
  }

  

  //  Widget _buildTodoList() {
  //   return new ListView.builder(
  //     itemBuilder: (context, index) {
  //       if(index < _todoItems.length) {
  //         return _buildTodoItem(_todoItems[index], index);
  //       }
  //     },
  //   );
  // }

  // Widget _buildTodoItem(String todoText, index) {
  //   return new ListTile (
  //     title: new Text(todoText, style: TextStyle(decoration: TextDecoration.none)),
  //     onTap: () => _popupRemoveTodo(index)
  //     );

  // void _addTodoField() {
  //   String myText = "";
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return new AlertDialog(
  //         title: new Text("Add a new task"),
  //         content: new Row(
  //         children: <Widget>[
  //           new Expanded(
  //               child: new TextField(
  //             autofocus: true,
  //             decoration: new InputDecoration(
  //                 hintText: 'Write here your todo task',
  //                 contentPadding: const EdgeInsets.all(20.0)),
  //             onChanged: (val) {
  //               myText = val;
  //             },
  //           ))
  //         ],
  //       ),
  //       actions: <Widget>[
  //       new FlatButton(child: new Text("Submit"),
  //       onPressed: () {
  //         _addItem(myText);
  //         Navigator.of(context).pop();
  //       }
  //       ),
  //       new FlatButton(
  //       child: new Text("Cancel"),
  //       onPressed: () {
  //         Navigator.of(context).pop();
  //         }
  //     )
  //     ],
  //       );
  //     }
  //   );
  // }
  }


            
  

  




