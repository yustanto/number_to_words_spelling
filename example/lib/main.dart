import 'package:flutter/material.dart';
import 'package:number_to_words_spelling/number_to_words_spelling.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _words_en='';
  String _words_id='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              onChanged: (val) {
                setState(() {
                  _words_en = NumberWordsSpelling.toWord(val,'en_US');
                  _words_id = NumberWordsSpelling.toWord(val,'id');
                });
              },
            ),
            Text(_words_id),
            Text(_words_en),
          ],
        ),
      )
    );
  }
}
