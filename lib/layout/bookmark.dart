import 'package:flutter/material.dart';

class Bookmark extends StatefulWidget {
  Bookmark({Key key}) : super(key: key);

  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(
         child:Center(
          child: Text("Bookmark"),
         )
       )
    );
  }
}