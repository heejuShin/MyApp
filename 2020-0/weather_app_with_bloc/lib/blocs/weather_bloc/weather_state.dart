import 'package:meta/meta.dart';

@immutable
class WeatherState{
  final double lon;
  final double lat;
  final String main;
  final String description;
  final double speed;

  WeatherState(
  {@required this.lon,
  @required this.lat,
  @required this.main,
  @required this.description,
  @required this.speed});

  factory WeatherState.empty(){
    return WeatherState(
      lon: 0.0, lat: 0.0, main: "", description: "", speed: 0.0);
  }

  WeatherState update(
  {double lon, double lat, String main, String description, double speed}){
    return copyWith(
      lon: lon, lat: lat, main: main, description: description, speed: speed);
  }

  WeatherState copyWith(
  {double lon, double lat, String main, String description, double speed}
      ) {
    return WeatherState(
        lon: lon ?? this.lon,
        lat: lat ?? this.lat,
        main: main ?? this.main,
        description: description ?? this.description,
        speed: speed ?? this.speed
    );
  }

  @override
  String toString(){
    return "";
  }
}