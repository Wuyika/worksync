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
    var url = Uri.https('reqbin.com', "echo");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    emit(TestFinalState(count: response.statusCode));
  }

}
