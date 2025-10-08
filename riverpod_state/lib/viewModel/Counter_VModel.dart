import 'package:flutter_riverpod/legacy.dart';

class CounterVmodel extends StateNotifier<int> {
  CounterVmodel() : super(0);

  //function for increment
  void increment() {
    state++;
  }

  //function for decrement
  void decrement() {
    state--;
  }

  //function for reset
  void reset() {
    state = 0;
  }
}
