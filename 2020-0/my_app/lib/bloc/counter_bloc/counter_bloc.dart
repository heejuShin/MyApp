import 'package:bloc/bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  // TODO : implement initialState
  CounterState get initialState => CounterState.empty();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is PageLoaded) yield* _mapPageLodaedToState();
    else if (event is IncrementBtnPressed) yield* _mapIncrementBtnPressedToState();
    else if (event is DecrementBtnPressed) yield* _mapDecrementBtnPressedToState();
  }

  Stream<CounterState> _mapPageLodaedToState() async* {
    yield state.update(count: 0);
  }

  Stream<CounterState> _mapIncrementBtnPressedToState() async* {
    yield state.update(count: state.count + 1);
  }

  Stream<CounterState> _mapDecrementBtnPressedToState() async* {
    yield state.update(count: state.count - 1);
  }
}