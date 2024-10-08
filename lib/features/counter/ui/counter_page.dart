// ignore_for_file: type_literal_in_constant_pattern

import 'package:bloc_counter/features/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterBloc counterBloc = CounterBloc(); // instance of bloc
  @override
  void initState() {
    // as soon as the counter_page screen is rendered, it is going to add my increment event
    // for default to show 1 (else Not found)
    counterBloc.add(CounterIncrementEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter Page")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          counterBloc.add(CounterIncrementEvent());
        },
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        bloc: counterBloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CounterIncrementState:
              final successState = state as CounterIncrementState;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      successState.value.toString(),
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              );
            default:
              return const Center(
                child: Text("Not Found"),
              );
          }
        },
      ),
    );
  }
}
