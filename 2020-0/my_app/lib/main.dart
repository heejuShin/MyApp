import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc/counter_bloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Bloc 적용1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bloc 적용1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}): super(key:key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc _counterBloc;

  @override
  void initState() {
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _counterBloc,
        builder: (BuildContext context, CounterState state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'count:',
                  ),
                  Text(
                    '${state.count}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            ),

            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat,
            //store btn
            floatingActionButton: Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: FloatingActionButton(
                      child: Icon(Icons.remove),
                      onPressed: () {
                        _counterBloc.add(DecrementBtnPressed());
                      },
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () {
                        _counterBloc.add(IncrementBtnPressed());
                        //print(state.count);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}