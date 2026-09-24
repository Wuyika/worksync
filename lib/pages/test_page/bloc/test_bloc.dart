import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitialState()) {
    on<AddValue>(addValue);
  }

  Future<void> addValue(AddValue event, Emitter<TestState> emit) async {
    emit(TestLoadingState());
    final url = Uri.https('reqbin.com', "echo");
    final response = await http.get(url);
    emit(TestFinalState(count: response.statusCode));
  }

}
