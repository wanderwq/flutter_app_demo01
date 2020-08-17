import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './detail.dart';

Dio dio = new Dio();

class MovieList extends StatefulWidget {
  //固定用法
  MovieList({Key key, @required this.mt}) :super(key: key);
  final String mt;

  @override
  _MovieListState createState() {
    return new _MovieListState();
  }
}

//有状态控件，必须结合一个状态管理类 来进行实现
class _MovieListState extends State<MovieList> {
  int page = 1;
  int pageSize = 10;
  var mlist = [];
  var total=0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMoviList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build 
    return ListView.builder(
        itemCount: mlist.length,
        itemBuilder: (BuildContext ctx,int i){
          //每次循环
         var mitem= mlist[i];
//         return Text(mitem['title']);R
          //列
         return GestureDetector(onTap: (){
           //路由  跳转详情
           Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx){
             //返回页面
              return new MovieDetail(
                  id:mitem['id'] ,
                  title:mitem['title']);
           }))   ;
         },child: Container(
           height: 200,
           decoration: BoxDecoration(color: Colors.white,border: Border(top: BorderSide(color: Colors.black12))),
           child: Row(children: [
             Image.network(mitem['images']['small'],width: 130,height: 180,fit: BoxFit.cover,),
             Container(
               padding: EdgeInsets.only(left: 10),
               height: 200,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Text("电影名称:${mitem["title"]}"),
                   Text("上映年份:${mitem["year"]}年"),
                   Text("电影类型:${mitem["genres"].join(',')}"),
                   Text("豆瓣评分:${mitem["rating"]['average']}分"),
                   Text("主要演员:${mitem["title"]}")
                 ],),
             )
           ],),
         ),);
        });
  }

  getMoviList() async{
    int offset=(page-1)*pageSize;
    //偏移量
   var response=await dio.get('http://www.liulongbin.top:3005/api/v2/movie/${widget.mt}?start=$offset#count=$pageSize');
   var result=response.data;
   print(result);

   //今后只要为私有数据赋值，都要把数据
   setState(() {
    mlist=result["subjects"];
    total=result["total"];
   });
  }
}