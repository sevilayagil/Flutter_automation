import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Automation Testing',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Automation Testing'),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Color(0xFFA35D59),
    leading: BackButton(),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.more_vert,
        ),
        onPressed: () {},
      )
    ],
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Uyari !"),
          content: Text("Mevcut şarkı sayisi :" + _counter.toString(),
              key: ValueKey("alert_text")),
          actions: <Widget>[
            new FlatButton(
              child: new Text(
                "Close",
                key: ValueKey("close_button"),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Theme buildBottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF222326),
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(caption: new TextStyle(color: Colors.redAccent))),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 12.0),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text(
                'Search',
                style: TextStyle(fontSize: 12.0),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text(
                'Your Library',
                style: TextStyle(fontSize: 12.0),
              )),
        ],
        currentIndex: 2,
        fixedColor: Colors.white,
        onTap: null,
      ),
    );
  }

  Padding buildCoverImage() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Image(
        image: AssetImage('assets/images/beatles.jpeg'),
        width: 200.0,
        height: 200.0,
      ),
    );
  }

  BoxDecoration buildGradientDecoration() {
    return BoxDecoration(
      gradient: new LinearGradient(
          colors: [Color(0xFFA35D59), Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.center,
          tileMode: TileMode.clamp),
    );
  }

  Padding buildFollowerCountText() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'BY SPOTIFY • 379,634 FOLLOWERS',
        style: TextStyle(fontSize: 12.0, color: Colors.grey),
      ),
    );
  }

  Padding buildAlbumTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'This Is Beatles',
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNavigationBar(context),
      body: Container(
        decoration: buildGradientDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildCoverImage(),
            buildAlbumTitle(),
            buildFollowerCountText(),
            Text(
              'Müzik listesinde yaptığınız degisiklik sayisi:',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              ),
              key: ValueKey("counterText"),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  key: Key("add"),
                  padding: const EdgeInsets.all(12.0),
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    _showDialog();
                  },
                  child: new Text("Ekle"),
                ),
                new RaisedButton(
                  key: Key("subtract"),
                  onPressed: _decrementCounter,
                  textColor: Colors.white,
                  color: Colors.grey,
                  padding: const EdgeInsets.all(12.0),
                  child: new Text(
                    "Çıkar",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
