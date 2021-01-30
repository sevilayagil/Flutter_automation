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
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Automation Testing'),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Color(0x8B008B),
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
          key: ValueKey("uyari"),
          content: Text("Mevcut mama sayisi :" + _counter.toString(),
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

  Theme buildNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF222326),
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(caption: new TextStyle(color: Colors.grey))),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Ana Sayfa',
                style: TextStyle(fontSize: 12.0),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              // ignore: deprecated_member_use
              title: Text(
                'Favoriler',
                style: TextStyle(fontSize: 12.0),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.pets),
              // ignore: deprecated_member_use
              title: Text(
                'Kişisel',
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
      padding: EdgeInsets.all(12.0),
      child: Image(
        image: AssetImage('assets/images/cat.jpeg'),
        width: 200.0,
        height: 200.0,
      ),
    );
  }

  BoxDecoration buildGradientDecoration() {
    return BoxDecoration(
      gradient: new LinearGradient(
          colors: [Color(0x8B008B), Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.center,
          tileMode: TileMode.clamp),
    );
  }

  Padding buildCountText() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'BY SEVILAYAGIL • 500,634 HAYRAN',
        style: TextStyle(fontSize: 12.0, color: Colors.grey),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Muhtar\'ın Mama Kabı',
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
      bottomNavigationBar: buildNavigationBar(context),
      body: Container(
        decoration: buildGradientDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildCoverImage(),
            buildTitle(),
            buildCountText(),
            Text(
              'Mama miktarında yaptığınız degisiklik sayisi:',
              style: TextStyle(
                fontSize: 15.0,
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
            TextField(
              key: ValueKey('inputKey'),
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  backgroundColor: Color.fromRGBO(204, 204, 255, 50)),
              decoration: InputDecoration(
                hintText: 'İsminizi giriniz',
              ),
              textAlign: TextAlign.center,
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
                  child: new Text("Mama Miktarı Göster"),
                ),
                new RaisedButton(
                  key: ValueKey("subtract"),
                  onPressed: _decrementCounter,
                  textColor: Colors.white,
                  color: Colors.redAccent,
                  padding: const EdgeInsets.all(12.0),
                  child: new Text(
                    "Mama Miktarı Azalt",
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
