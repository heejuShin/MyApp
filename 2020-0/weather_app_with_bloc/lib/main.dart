import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/weather_bloc/bloc.dart';


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
      debugShowCheckedModeBanner: false,
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
  WeatherBloc _weatherBloc = WeatherBloc();

  @override
  void initState() {
    super.initState();
    _weatherBloc.add(PageLoaded());
  }

  @override
  void dispose() {
    _weatherBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder(
          bloc: _weatherBloc,
          builder: (BuildContext context, WeatherState state){
            if(state.main==""){
              return Center(
                child: Text("불러올 정보가 없습니다.")
              );
            }
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("좌표: "),
                    Text('${state.lon} ${state.lat}'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("날씨: "),
                    Text('${state.main} ${state.description}'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("바람: "),
                    Text('${state.speed}'),
                  ],
                ),
              ],
            );
          }
      ),
    );
  }
}