import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gama_flutter_finish/utils/ResponseDetailBerita.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailBerita extends StatefulWidget{
  String berita_id;
  DetailBerita(this.berita_id);
  _DetailBerita createState()=>new _DetailBerita(berita_id);
}

class _DetailBerita extends State<DetailBerita>{
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  static String tag='detail-berita';
  String berita_id;
  _DetailBerita(this.berita_id);
  List<ResDetailBerita> list;
  // DetailBerita detailBerita=DetailBerita(",","","")
  Future<List<ResDetailBerita>> _getDetailBerita() async {
    String base_url = "https://www.bernas.id/api/android/v1/detail?id=${berita_id}";
    var res = await http
        .get(Uri.encodeFull(base_url), headers: {"Accept": "application/json"});
    // print(berita.berita_id);
    print(res.body);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var restponse = data["detail"] as List;
      print(restponse);
      list = restponse.map<ResDetailBerita>((json) => ResDetailBerita.fromJson(json)).toList();
    }
    print("List Size: ${list.length}");
    return list;
  }
  

  // Future<Null> _refresh(){
  //   Completer<Null> completer=new Completer<Null>();
  //    Timer timer=new Timer(new Duration(seconds: 3), (){
  //     completer.complete();
  //   });
  //   return completer.future;
  // }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: ()async{
              // var _refreshIndicatorKey;
              // _refreshIndicatorKey.currentState.show();
              await new Future.delayed(const Duration(seconds: 2));
              setState(() {
                list.shuffle();
              });
            }
          )
        ],
//        automaticallyImplyLeading: false,
      ),
      body: Container(
          child: FutureBuilder(
            future: _getDetailBerita(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              //print("data list : "+ snapshot.data);
              if(snapshot.data == null){
                return Container(
                    child: Center(
                        child: CircularProgressIndicator()
                    )
                );
              } else {
                return RefreshIndicator(
                  key: _refreshIndicatorKey,
                  onRefresh: ()async{
                  await new Future.delayed(const Duration(seconds: 3));
                  setState(() {
                    list.shuffle();
                  });
                },
                  child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Container(
                      width: double.maxFinite,
                      height: 270.0,
                      child: Image.network('${snapshot.data[0].foto_besar}'),
                      // child:Carousel(
                      //       images: [
                      //         NetworkImage('${snapshot.data[0].foto_besar}'),
                      //         NetworkImage('${snapshot.data[0].foto_besar}'),
                      //         NetworkImage('${snapshot.data[0].foto_besar}'),
                      //         //ExactAssetImage("assets/images/LaunchImage.jpg")
                      //       ],
                      //       dotSize: 4.0,
                      //       dotSpacing: 15.0,
                      //       dotColor: Colors.lightBlue,
                      //       indicatorBgPadding: 5.0,
                      //       dotBgColor: Colors.transparent,
                      //       borderRadius: false,
                      //     )
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(snapshot.data[0].berita_judul,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600),textAlign: TextAlign.left),
                          Container(
                            padding: EdgeInsets.all(2.0),
                            color: Colors.blue,
                            child: Text(snapshot.data[0].kategori,style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w400),textAlign: TextAlign.left,),
                          ),
                          Text(snapshot.data[0].berita_tayang,style: TextStyle(fontSize: 20.0),textAlign: TextAlign.left),
                          SizedBox(height: 20.0),
                          // Html(data: snapshot.data[0].berita_isi,defaultTextStyle: TextStyle(fontSize: 17.0),),
                          Text('Penulis : '+snapshot.data[0].author,style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),textAlign: TextAlign.left),
                          InkWell(
                            child: new Text('Sumber : '+snapshot.data[0].link,style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400,color: Colors.blue),),
                            onTap: (){
                              launch(snapshot.data[0].link);
                            }
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
                );          
              }
            },
          )
      ),
    );
  }
}