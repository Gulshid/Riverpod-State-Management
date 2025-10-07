import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_state/viewModel/counter_viewmodel.dart';

final counter_provider = StateNotifierProvider((ref) {
  return CounterViewmodel();
});

class CounterView extends ConsumerStatefulWidget {
  const CounterView({super.key});

  @override
  ConsumerState<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends ConsumerState<CounterView> {
  @override
  Widget build(BuildContext context) {
    print("Build");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Counter App'),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              print("Build 5");
              final count = ref.watch(counter_provider);
              return Center(
                child: Text(count.toString(), style: TextStyle(fontSize: 20)),
              );
            },
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(counter_provider.notifier).increment();
                },
                child: Text("Incre"),
              ),

              ElevatedButton(
                onPressed: () {
                  ref.read(counter_provider.notifier).decrement();
                },
                child: Text("Decre"),
              ),

              ElevatedButton(
                onPressed: () {
                  ref.read(counter_provider.notifier).reset();
                },
                child: Text("Reset"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
