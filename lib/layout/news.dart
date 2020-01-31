import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gama_flutter_finish/include/detail_berita.dart';
import 'package:gama_flutter_finish/utils/ResponseBerita.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;


// import 'detail_berita.dart';
class News extends StatefulWidget{
  static String tag='data-berita';
  @override
  _News createState()=>new _News();
}

class _News extends State<News>{
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  Color _color=Colors.grey;
  String Base_Url = "https://www.bernas.id/api/android/v1/list?datewl=0000-00-00%2000:00:00&kategori=13&berita=baru";
  List<Berita> list;
  //api berita list
  Future<List<Berita>> _getBerita() async {
    var res = await http
        .get(Uri.encodeFull(Base_Url), headers: {"Accept": "application/json"});

    print(res.body);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["data"] as List;
      print(rest);
      list = rest.map<Berita>((json) => Berita.fromJson(json)).toList();
    }
    print("List Size: ${list.length}");
    return list;
  }

  // Future<Null> _refresh(){
  //   Completer<Null> completer=new Completer<Null>();
  //   Timer timer=new Timer(new Duration(seconds: 3), (){
  //     completer.complete();
  //   });
  //   return completer.future;
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('Berita Terkini'),
      //   backgroundColor: Colors.blue,
      //   //untuk menghilangkan back button
      //   automaticallyImplyLeading: false,
      // ),

      body: Container(
        child: FutureBuilder(
          future: _getBerita(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            print(snapshot.data);
            if(snapshot.data == null){
              return Container(
                  child: Center(
                      child:  CircularProgressIndicator(),
                  )
              );
            } else {
              return RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: ()async{
                  await new Future.delayed(const Duration(seconds: 1));
                  setState(() {
                    list.shuffle();
                  });
                },
                child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(5.0),
                    leading: Container(
                      width: 100.0,
                      height: 300.0,
                      child: Image.network('${snapshot.data[index].foto_besar}',fit: BoxFit.fill),
                    ),
                    title: Text(snapshot.data[index].berita_judul,
                      style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400,color: Colors.black),textAlign: TextAlign.justify,),
                    subtitle: Text(snapshot.data[index].berita_tayang,style: TextStyle(fontSize: 15.0,color: Colors.grey),),
                    trailing: IconButton(icon: Icon(FontAwesomeIcons.bookmark,),onPressed: (){
                      _color=Colors.black;
                    },),

                    onTap: (
                        ){
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => DetailBerita(snapshot.data[index].berita_id))
                      );
                    },
                  );
                },
              ),
              );
            }
          },
        ),
      )
    );
  }
}