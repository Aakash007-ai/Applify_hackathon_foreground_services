import 'dart:async';
import 'package:flutter/material.dart';
import 'package:screen_state/screen_state.dart';

class ScreenStat extends StatefulWidget {
  const ScreenStat({Key? key}) : super(key: key);

  @override
  State<ScreenStat> createState() => _ScreenStatState();
}

class ScreenStateEventEntry {
  ScreenStateEvent event;
  DateTime? time;

  ScreenStateEventEntry(this.event) {
    time = DateTime.now();
  }
}

class _ScreenStatState extends State<ScreenStat> {
  Screen _screen = Screen();
  late StreamSubscription<ScreenStateEvent> _subscription;
  bool started = false;
  List<ScreenStateEventEntry> _log = [];

  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    startListening();
  }

  void onData(ScreenStateEvent event) {
    setState(() {
      _log.add(ScreenStateEventEntry(event));
    });
    print(event);
  }

  void startListening() {
    try {
      _subscription = _screen.screenStateStream!.listen(onData);
      setState(() => started = true);
    } on ScreenStateException catch (exception) {
      print(exception);
    }
  }

  void stopListening() {
    _subscription.cancel();
    setState(() => started = false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Screen State Example app'),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: _log.length,
                reverse: true,
                itemBuilder: (BuildContext context, int idx) {
                  final entry = _log[idx];
                  return ListTile(
                      leading: Text(entry.time.toString().substring(0, 19)),
                      trailing: Text(entry.event.toString().split('.').last));
                })),
        floatingActionButton: FloatingActionButton(
          onPressed: started ? stopListening : startListening,
          tooltip: 'Start/Stop sensing',
          child: started ? Icon(Icons.stop) : Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}

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
  // Screen _screen = Screen();
  // late StreamSubscription<ScreenStateEvent> _subscription;
  // bool started = false;
  // List<ScreenStateEventEntry> _log = [];

  // void initState() {
  //   super.initState();
  //   initPlatformState();
  // }

  // // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initPlatformState() async {
  //   startListening();
  // }

  // void onData(ScreenStateEvent event) {
  //   setState(() {
  //     _log.add(ScreenStateEventEntry(event));
  //   });
  //   print(event);
  // }

  // void startListening() {
  //   try {
  //     _subscription = _screen.screenStateStream!.listen(onData);
  //     setState(() => started = true);
  //   } on ScreenStateException catch (exception) {
  //     print(exception);
  //   }
  // }

  // void stopListening() {
  //   _subscription.cancel();
  //   setState(() => started = false);
  // }

  // @override
  // Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Screen State Example app'),
    //     ),
    //     body: Center(
    //         child: ListView.builder(
    //             itemCount: _log.length,
    //             reverse: true,
    //             itemBuilder: (BuildContext context, int idx) {
    //               final entry = _log[idx];
    //               return ListTile(
    //                   leading: Text(entry.time.toString().substring(0, 19)),
    //                   trailing: Text(entry.event.toString().split('.').last));
    //             })),
    //     floatingActionButton: FloatingActionButton(
    //       onPressed: started ? stopListening : startListening,
    //       tooltip: 'Start/Stop sensing',
    //       child: started ? Icon(Icons.stop) : Icon(Icons.play_arrow),
    //     ),
    //   ),
    // );
//   }
// }
