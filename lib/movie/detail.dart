import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  //固定用法
  MovieDetail({Key key, @required this.id,@required this.title}) :super(key: key);
  final String id;
  final String title;
  @override
  _MovieDetailState createState() {
    return new _MovieDetailState();
  }
}
class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(appBar: AppBar(title: Text(widget.title),centerTitle: true,),);
//  return Text("detail---${widget.id}");
}
}