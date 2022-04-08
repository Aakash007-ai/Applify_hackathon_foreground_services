// import 'package:flutter/material.dart';
// import 'package:flutter_foreground_task/flutter_foreground_task.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Future<void> _initForegroundTask() async {
//     await FlutterForegroundTask.init(
//       androidNotificationOptions: AndroidNotificationOptions(
//         channelId: 'notification_channel_id',
//         channelName: 'Foreground Notification',
//         channelDescription:
//             'This notification appears when the foreground service is running.',
//         channelImportance: NotificationChannelImportance.LOW,
//         priority: NotificationPriority.LOW,
//         iconData: const NotificationIconData(
//           resType: ResourceType.mipmap,
//           resPrefix: ResourcePrefix.ic,
//           name: 'launcher',
//         ),
//         buttons: [
//           const NotificationButton(id: 'sendButton', text: 'Send'),
//           const NotificationButton(id: 'testButton', text: 'Test'),
//         ],
//       ),
//       iosNotificationOptions: const IOSNotificationOptions(
//         showNotification: true,
//         playSound: false,
//       ),
//       foregroundTaskOptions: const ForegroundTaskOptions(
//         interval: 5000,
//         autoRunOnBoot: true,
//         allowWifiLock: true,
//       ),
//       printDevLog: true,
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     _initForegroundTask();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: WithForegroundTask(//WithForegroundTask widget to prevent the app
//        //from closing when the foreground service is running.
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Flutter Foreground Task'),
//             centerTitle: true,
//           ),
//           body: buildContentView(),
//         ),
//       ),
//     );
//     // return Scaffold(
//     //   appBar: AppBar(),
//     //   body: Center(
//     //     child: Column(
//     //       mainAxisAlignment: MainAxisAlignment.center,
//     //       children: [Text("Starting checkpoint 1")],
//     //     ),
//     //   ),
//     // );
//   }
// }

