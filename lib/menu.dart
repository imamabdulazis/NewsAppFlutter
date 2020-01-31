import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gama_flutter_finish/layout/akun.dart';
import 'package:gama_flutter_finish/layout/bookmark.dart';
import 'package:gama_flutter_finish/layout/home.dart';
import 'package:gama_flutter_finish/layout/news.dart';
import 'package:gama_flutter_finish/layout/video.dart';


class HomePage extends StatefulWidget {
  @override
  _homepage createState() => new _homepage();
}

class _homepage extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //
  int selectedIndex = 0;
  final layoutPage = [Home(), Video(),News(),Bookmark(),Akun()];

  void onTabItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search,color: Colors.grey[400],),
                    
                    Text(
                      "Cari Berita....",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications_active),iconSize: 28.0,color: Colors.grey[500],
          onPressed: (){

          },),
          IconButton(icon: Icon(Icons.new_releases),iconSize: 20.0,color: Colors.grey[500],
          onPressed: (){

          },)
        ],
      ),
      body: layoutPage.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.youtube), title: Text("Video")),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.fire), title: Text("Terkini")),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), title: Text("Bookmart")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("Akun")),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onTabItem,
      ),
    );
  }
}
