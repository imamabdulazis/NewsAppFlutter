import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget slide=new Container(
    child: CarouselSlider(
      items: <Widget>[
         new Image.network('https://cms.qz.com/wp-content/uploads/2018/08/GettyImages-1024878106.jpg?quality=75&strip=all&w=1100&h=733'),
            new Image.network('https://images.koovs.com/uploads/home/Unisex-WebBanner-sROR5w.jpg'),
            new Image.network('https://images.koovs.com/uploads/home/Unisex-Tie&Dye-Web-foGoTd-SkMT7C-OydwCb.jpg'),
            new Image.network('https://images.koovs.com/uploads/home/HP-r5dvDt.jpg'),

      ],
        height: 400,
        aspectRatio: 16/9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        pauseAutoPlayOnTouch: Duration(seconds: 10),
        enlargeCenterPage: true,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          //gambar
          slide,
        ],
      ),
    );
  }
}