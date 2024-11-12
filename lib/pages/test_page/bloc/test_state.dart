part of 'test_bloc.dart';

class TestState extends Equatable {
  const TestState();

  @override
  List<Object?> get props => [];
}

final class TestInitialState extends TestState {}

final class TestLoadingState extends TestState {}

final class TestFinalState extends TestState {
  final int count;
  const TestFinalState({required this.count});

  @override
  List<Object> get props => [count];
}

