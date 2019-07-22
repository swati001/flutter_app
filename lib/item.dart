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
            color: Colors.grey[350],
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Colors.indigoAccent, child: new Icon(Icons.list),foregroundColor: Colors.white,),
              title: new Text(widget.title, style: TextStyle(decoration: widget.completed ? TextDecoration.lineThrough: TextDecoration.none, color: widget.completed ? Colors.grey: Colors.black)),
              
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


//         ListView.separated({
//   Key key,
//   Axis scrollDirection = Axis.vertical,
//   bool reverse = false,
//   ScrollController controller,
//   bool primary,
//   ScrollPhysics physics,
//   bool shrinkWrap = false,
//   EdgeInsetsGeometry padding,
//   @required IndexedWidgetBuilder itemBuilder,
//   @required IndexedWidgetBuilder separatorBuilder,
//   @required int itemCount,
//   bool addAutomaticKeepAlives = true,
//   bool addRepaintBoundaries = true,
//   bool addSemanticIndexes = true,
//   double cacheExtent,
// }) : assert(itemBuilder != null),
//      assert(separatorBuilder != null),
//      assert(itemCount != null && itemCount >= 0),
//      itemExtent = null,
//      childrenDelegate = SliverChildBuilderDelegate(
//        (BuildContext context, int index) {
//          final int itemIndex = index ~/ 2;
//          Widget widget;
//          if (index.isEven) {
//            widget = itemBuilder(context, itemIndex);
//          } else {
//            widget = separatorBuilder(context, itemIndex);
//            assert(() {
//              if (widget == null) {
//                throw FlutterError('separatorBuilder cannot return null.');
//              }
//              return true;
//            }());
//          }
//          return widget;
//        },
//        childCount: _computeSemanticChildCount(itemCount),
//        addAutomaticKeepAlives: addAutomaticKeepAlives,
//        addRepaintBoundaries: addRepaintBoundaries,
//        addSemanticIndexes: addSemanticIndexes,
//        semanticIndexCallback: (Widget _, int index) {
//          return index.isEven ? index ~/ 2 : null;
//        },
//      ),
//      super(
//        key: key,
//        scrollDirection: scrollDirection,
//        reverse: reverse,
//        controller: controller,
//        primary: primary,
//        physics: physics,
//        shrinkWrap: shrinkWrap,
//        padding: padding,
//        cacheExtent: cacheExtent,
//        semanticChildCount: _computeSemanticChildCount(itemCount),
//      );
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
 
  }


            
  

  




