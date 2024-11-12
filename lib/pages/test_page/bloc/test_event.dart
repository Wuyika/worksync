part of 'test_bloc.dart';

class TestEvent extends Equatable {

  const TestEvent();

  @override
  List<Object?> get props => [];
}

class AddValue extends TestEvent {}


class SubtractValue extends TestEvent {
  final int count;
  const SubtractValue({required this.count});

  @override
  List<Object> get props => [count];
}
