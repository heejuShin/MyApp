import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Simple Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Simple Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}): super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData == false){
            return Container();
          }
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("좌표: "),
                  Text(snapshot.data["coord"].toString()),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("날씨: "),
                  Text(snapshot.data["weather"].toString()),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("바람: "),
                  Text(snapshot.data["wind"].toString()),
                ],
              ),
            ],
          );
        }
      ),
    );
  }

  Future<Map<String, dynamic>> fetchData() async{
    Map<String, dynamic> result;
    http.Response response;

    try {
      response = await http.get(
          'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
      result = json.decode(response.body);
    }catch (e){
      print(e);
      result = null;
    }
    return result;
  }
}