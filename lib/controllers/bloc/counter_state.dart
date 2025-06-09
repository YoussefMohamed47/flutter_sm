part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  final int counter;

  const CounterState(this.counter);

  @override
  List<Object> get props => [counter];
}

class CounterInit extends CounterState {
  const CounterInit() : super(0);
}

class CounterUpdate extends CounterState {
  const CounterUpdate(super.counter);
}
