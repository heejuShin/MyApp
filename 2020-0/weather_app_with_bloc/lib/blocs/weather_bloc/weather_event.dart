import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherEvent extends Equatable{
  //const WeatherEvent();
  WeatherEvent();

  @override
  List<Object> get props => [];
}

class PageLoaded extends WeatherEvent{
  @override
  String toString() => 'PageLoaded';
}