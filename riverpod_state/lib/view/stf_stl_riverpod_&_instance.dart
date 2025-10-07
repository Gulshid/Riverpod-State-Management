// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// // riverpod / provider instance iitialization
// // to read constant value
// final hello = Provider<String>((ref) {
//   return 'Hello To me and my friends';
// });

// // to read constant value
// final age = Provider<int>((ref) {
//   return 23;
// });

// // // this is for state less widget
// // class HomeScreen extends ConsumerWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final hell = ref.watch(hello);
// //     final Age = ref.watch(age);
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Stateless Widget Riverpod'),  centerTitle: true,),

// //       body: Column(
// //         children: [
// //           Center(child: Text(hell)),
// //           Center(child: Text(Age.toString())),
// //         ],
// //       ),
// //     );
// //   }
// // }
// // // this is for state ful widget
// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final hell = ref.watch(hello);
//     final Age = ref.watch(age);
//     return Scaffold(
//       appBar: AppBar(title: Text('Stateful widget Riverpod '), centerTitle: true,),

//       body: Column(
//         children: [
//           Center(child: Text(hell)),
//           Center(child: Text(Age.toString())),
//         ],
//       ),
//     );
//   }
// }
