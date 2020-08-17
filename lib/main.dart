import 'package:flutter/material.dart';
import './movie/list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHome(
      ),
    );
  }
}

class MyHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length:3,
        child:
        Scaffold(
          appBar: AppBar(
            title: Text("电影列表"),
            centerTitle:true,
            actions: <Widget>[
              IconButton(
                icon: new Icon(Icons.search),
                onPressed: (){},
              )
            ],
          ),
          drawer: new Drawer(
            child: new ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName:Text("wander"),
                  accountEmail:Text("111111"),
                  currentAccountPicture:CircleAvatar(
                      backgroundImage:new NetworkImage(
                          "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg"
                      )
                  ),
                  decoration: BoxDecoration(

                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "http://img8.zol.com.cn/bbs/upload/23765/23764201.jpg")),
                  ),

                ),
                ListTile(title:Text("用户反馈"),trailing: Icon(Icons.feedback),),
                ListTile(title:Text("系统设置"),trailing: Icon(Icons.settings),),
                ListTile(title:Text("我要发布"),trailing: Icon(Icons.send),),
                Divider(color:Colors.blue),
                ListTile(title:Text("注销"),trailing: Icon(Icons.exit_to_app),),
              ],),
          ),
          //底部
          bottomNavigationBar: Container(
            decoration:BoxDecoration(color: Colors.blue),
            height: 50,
            child: TabBar(
              labelStyle: TextStyle(
                height: 0,
                fontSize: 12
              ),
              tabs: <Widget>[
              Tab(icon: Icon(Icons.movie_filter),text: "正在上映",),
              Tab(icon: Icon(Icons.movie_creation),text: "即将上映",),
              Tab(icon: Icon(Icons.local_movies),text: "Top25",),
            ],),
          ),
          body: TabBarView(children: [
            MovieList(mt: "in_theaters",),
            MovieList(mt: "coming_soon",),
            MovieList(mt: "top250",),
          ],),
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
