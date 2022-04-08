


// import 'dart:isolate';

// import 'package:applify/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_foreground_task/flutter_foreground_task.dart';

// void main() {
//   runApp(const MyApp());
// }

// // The callback function should always be a top-level function.
// void startCallback() {
//   // The setTaskHandler function must be called to handle the task in the background.
//   FlutterForegroundTask.setTaskHandler(FirstTaskHandler());
// }

// class FirstTaskHandler extends TaskHandler {
//   @override
//   Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {//sender port isolate
//     // You can use the getData function to get the data you saved.
//     final customData = await FlutterForegroundTask.getData<String>(key: 'customData');
//     print('customData: $customData');
//   }

//   @override
//   Future<void> onEvent(DateTime timestamp, SendPort? sendPort) async {
//     // Send data to the main isolate.
//     sendPort?.send(timestamp);
//   }

//   @override
//   Future<void> onDestroy(DateTime timestamp) async {
//     // You can use the clearAllData function to clear all the stored data.
//     await FlutterForegroundTask.clearAllData();
//   }

//   @override
//   void onButtonPressed(String id) {
//     // Called when the notification button on the Android platform is pressed.
//     print('onButtonPressed >> $id');
//   }
// }

// class ExampleApp extends StatefulWidget {
//   const ExampleApp({Key? key}) : super(key: key);

//   @override
//   _ExampleAppState createState() => _ExampleAppState();
// }

// class _ExampleAppState extends State<ExampleApp> {
//   ReceivePort? _receivePort;

//   // ...

//   Future<bool> _startForegroundTask() async {
//     // You can save data using the saveData function.
//     await FlutterForegroundTask.saveData(key: 'customData', value: 'hello');

//     ReceivePort? receivePort;
//     if (await FlutterForegroundTask.isRunningService) {
//       receivePort = await FlutterForegroundTask.restartService();
//     } else {
//       receivePort = await FlutterForegroundTask.startService(
//         notificationTitle: 'Foreground Service is running',
//         notificationText: 'Tap to return to the app',
//         callback: startCallback,
//       );
//     }

//     if (receivePort != null) {
//       _receivePort = receivePort;
//       _receivePort?.listen((message) {
//         if (message is DateTime) {
//           print('receive timestamp: $message');
//         }
//       });

//       return true;
//     }

//     return false;
//   }

//   @override
//   void dispose() {
//     _receivePort?.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }



// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
