import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  @override
  WeatherState get initialState => WeatherState.empty();

  @override
  Stream<WeatherState> mapEventToState(
      WeatherEvent event,
      ) async*{
    if(event is PageLoaded){
      yield* _mapPageLoadedToState();
    }
  }

  Stream<WeatherState> _mapPageLoadedToState() async* {
    Map<String, dynamic> result;
    http.Response response;

    try{
      response = await http.get(
          'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
      result = json.decode(response.body);
    }catch(e){
      print(e);
      result=null;
    }

    if (result==null){
      yield state.update();
    }else{
      yield state.update(
        lon: result["coord"]["lon"],
        lat: result["coord"]["lat"],
        main: result["weather"][0]["main"],
        description: result["weather"][0]["description"],
        speed: result["wind"]["speed"]
      );
    }

  }
}