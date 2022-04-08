// import 'package:flutter/material.dart';
// import 'package:flutter_foreground_task/flutter_foreground_task.dart';

// // Add WithForegroundTask widget to prevent the app from closing 
// //when the foreground service is running.
// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     // A widget that prevents the app from closing when the foreground service is running.
//     // This widget must be declared above the [Scaffold] widget.
//     home: WithForegroundTask(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter Foreground Task'),
//           centerTitle: true,
//         ),
//         body: buildContentView(),
//       ),
//     ),
//   );
// }