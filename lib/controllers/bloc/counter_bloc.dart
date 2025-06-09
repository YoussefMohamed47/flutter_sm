import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBLoc extends Bloc<CounterEvent, CounterState> {
  CounterBLoc() : super(CounterInit()) {
    on<IncrementCounterEvent>((event, emit) {
      emit(CounterUpdate(5));
    });

    on<DecrementCounterEvent>((event, emit) {
      emit(CounterUpdate(5));
    });
  }
}
