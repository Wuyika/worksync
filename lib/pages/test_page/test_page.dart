import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worklin/pages/test_page/bloc/test_bloc.dart';
import 'package:worklin/utils/app_alert.dart';
import 'package:worklin/utils/app_navigator.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestBloc(),
      child: Scaffold(
        body: BlocConsumer<TestBloc, TestState>(
          builder: (context, state) {
            final bloc = context.read<TestBloc>();

            if (state is TestLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (state is TestFinalState) ? '${state.count}' : "",
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        bloc.add(AddValue());
                      },
                      child: Text(
                        'Switch',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        bloc.add(AddValue());
                      },
                      child: Text(
                        'Switch',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          listener: (context, state) {
            if (state is TestFinalState) {
             AppAlerts.showInfoSnackBar("Hello");
            }
          },
        ),
      ),
    );
  }
}
