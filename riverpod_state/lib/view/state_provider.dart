// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';

// // final counter = StateProvider<int>((ref) => 0);
// final counter = StateProvider<int>((ref) {
//   return 0;
// });

// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     //this one is build all widget but we dont want all
//     print('Build');
//     final count = ref.watch(counter);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stateful Widget Riverpod'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('$count', style: const TextStyle(fontSize: 40)),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 ref.read(counter.notifier).state++;
//               },
//               child: Text('+'),
//             ),

//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 ref.read(counter.notifier).state--;
//               },
//               child: Text('-'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// this one will only build or change the state of specific widget
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final counter = StateProvider<int>((ref) {
  return 0;
});

final switc = StateProvider<bool>((ref) {
  return false;
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //this one is build all widget but we dont want all
    print('Build 1');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget Riverpod'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //counter
            Consumer(
              builder: (context, ref, child) {
                print('Build 2');
                final count = ref.watch(counter);
                return Text('$count', style: const TextStyle(fontSize: 40));
              },
            ),
            const SizedBox(height: 20),
            // switch
            Consumer(
              builder: (context, ref, child) {
                print('Build 3');
                final swi = ref.watch(switc);
                return Switch(
                  value: swi,
                  onChanged: (value) {
                    ref.read(switc.notifier).state = value;
                  },
                );
              },
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(counter.notifier).state++;
              },
              child: Text('+'),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(counter.notifier).state--;
              },
              child: Text('-'),
            ),
          ],
        ),
      ),
    );
  }
}
