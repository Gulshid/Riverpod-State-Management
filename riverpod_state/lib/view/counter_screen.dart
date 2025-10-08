import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_state/viewModel/Counter_VModel.dart';

final counter_pro = StateNotifierProvider((ref) {
  return CounterVmodel();
});

class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    print('Build');

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(3),
            bottomRight: Radius.circular(3),
          ),
        ),
        backgroundColor: Colors.blue,
        title: Text('Counter App', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(8),
            ),

            child: Consumer(
              builder: (context, ref, child) {
                final count = ref.watch(counter_pro);
                print(" Build 1");
                return Center(
                  child: Text(
                    count.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  print(" Build 2 ");
                  return GestureDetector(
                    onTap: () {
                      ref.read(counter_pro.notifier).decrement();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),

                      child: Center(
                        child: Text(
                          '-',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  );
                },
              ),

              Consumer(
                builder: (context, ref, child) {
                  print(" Build 3 ");
                  return GestureDetector(
                    onTap: () {
                      ref.read(counter_pro.notifier).reset();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(4),
                      ),

                      child: Center(
                        child: Text(
                          '@',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  );
                },
              ),

              Consumer(
                builder: (context, ref, child) {
                  print(" Build 4 ");
                  return GestureDetector(
                    onTap: () {
                      ref.read(counter_pro.notifier).increment();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),

                      child: Center(
                        child: Text(
                          '+',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
