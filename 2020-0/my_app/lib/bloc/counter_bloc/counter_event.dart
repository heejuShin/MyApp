import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CounterEvent extends Equatable {
  CounterEvent([List props = const []]) : super(props);
}

class PageLoaded extends CounterEvent{
  @override
  String toString(){
    return 'page loaded';
  }
}

class IncrementBtnPressed extends CounterEvent{
  @override
  String toString(){
    return "Increment button pressed";
  }
}

class DecrementBtnPressed extends CounterEvent{
  @override
  String toString(){
    return "Decrement button pressed";
  }
}