import 'package:applify/app_usage.dart';
import 'package:applify/screen_stat.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Applify hackathon",
      home: MyAppState(),
    );
  }
}

class MyAppState extends StatefulWidget {
  const MyAppState({Key? key}) : super(key: key);

  @override
  State<MyAppState> createState() => _MyAppStateState();
}

class _MyAppStateState extends State<MyAppState> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ScreenStat()));
                  },
                  child: const Text("Screen Status")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AppStat()));
                  },
                  child: const Text("AppUsaqge"))
            ],
          ),
        ),
      ),
    );
  }
}

// class _MyAppState extends State<MyApp> {
//   List<AppUsageInfo> _infos = [];

//   @override
//   void initState() {
//     super.initState();
//   }

//   void getUsageStats() async {
//     try {
//       DateTime endDate = DateTime.now();
//       DateTime startDate = endDate.subtract(Duration(hours: 1));
//       List<AppUsageInfo> infoList =
//           await AppUsage.getAppUsage(startDate, endDate);
//       setState(() {
//         _infos = infoList;
//       });

//       for (var info in infoList) {
//         print(info.toString());
//       }
//     } on AppUsageException catch (exception) {
//       print(exception);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('App Usage Example'),
//           backgroundColor: Colors.green,
//         ),
//         body: ListView.builder(
//             itemCount: _infos.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                   title: Text(_infos[index].appName),
//                   trailing: Text(_infos[index].usage.toString()));
//             }),
//         floatingActionButton: FloatingActionButton(
//             onPressed: getUsageStats, child: const Icon(Icons.file_download)),
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:screen_state/screen_state.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// class ScreenStateEventEntry {
//   ScreenStateEvent event;
//   DateTime? time;

//   ScreenStateEventEntry(this.event) {
//     time = DateTime.now();
//   }
// }

// class _MyAppState extends State<MyApp> {
//   Screen _screen = Screen();
//   late StreamSubscription<ScreenStateEvent> _subscription;
//   bool started = false;
//   List<ScreenStateEventEntry> _log = [];

//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     startListening();
//   }

//   void onData(ScreenStateEvent event) {
//     setState(() {
//       _log.add(ScreenStateEventEntry(event));
//     });
//     print(event);
//   }

//   void startListening() {
//     try {
//       _subscription = _screen.screenStateStream!.listen(onData);
//       setState(() => started = true);
//     } on ScreenStateException catch (exception) {
//       print(exception);
//     }
//   }

//   void stopListening() {
//     _subscription.cancel();
//     setState(() => started = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Screen State Example app'),
//         ),
//         body: Center(
//             child: ListView.builder(
//                 itemCount: _log.length,
//                 reverse: true,
//                 itemBuilder: (BuildContext context, int idx) {
//                   final entry = _log[idx];
//                   return ListTile(
//                       leading: Text(entry.time.toString().substring(0, 19)),
//                       trailing: Text(entry.event.toString().split('.').last));
//                 })),
//         floatingActionButton: FloatingActionButton(
//           onPressed: started ? stopListening : startListening,
//           tooltip: 'Start/Stop sensing',
//           child: started ? Icon(Icons.stop) : Icon(Icons.play_arrow),
//         ),
//       ),
//     );
//   }
// }

