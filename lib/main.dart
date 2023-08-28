import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Media Query Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    MediaQueryData currentMedia = MediaQuery.of(context);

    List<String> mediaState = [
      'accessibleNavigation: ${currentMedia.accessibleNavigation}',
      'alwaysUse24hour: ${currentMedia.alwaysUse24HourFormat}',
      'devicePixelRatio: ${currentMedia.devicePixelRatio}',
      'displayFeatures: ${currentMedia.displayFeatures}',
      'gestureSettings: ${currentMedia.gestureSettings}',
      'navigationMode: ${currentMedia.navigationMode}',
      'orientation: ${currentMedia.orientation}',
      'padding: ${currentMedia.padding}',
      'runtimeType: ${currentMedia.runtimeType}',
      'size: ${currentMedia.size}',
      'systemGestureInserts: ${currentMedia.systemGestureInsets}',
      'textScaler: ${currentMedia.textScaler}',
      'viewInserts: ${currentMedia.viewInsets}',
      'viewPadding: ${currentMedia.viewPadding}',
    ];

    // This method is rerun every time setState is called,
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: Column(children: [
          const Text(
            "MediaQuery returned",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: mediaState.length,
              itemBuilder: (BuildContext contest, int index) {
                return ListTile(
                    title: Text(mediaState[index]),
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            style: BorderStyle.solid,
                            color: Color(0x40000000))),
                    tileColor: Colors.white70,
                    dense: true,
                    visualDensity: VisualDensity.compact);
              },
            ),
          ),
        ]));
  }
}
