import 'package:flutter/material.dart';
import 'package:roslibdart/roslibdart.dart';
import 'dart:async';
import 'dart:convert';

import 'dart:math' as math;

import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
// import 'package:gallery/demos/material/material_demo_types.dart';

/*
This app will publishes int x and y cordinates which is 
take as input from the text box
eg : x : <input>
     y : <input> and a publish button
     publishes this value to the topic 
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Grafito Control Panel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Ros ros;
  late Topic topic;
  final RestorableDouble _continuousValue = RestorableDouble(25);
  final RestorableDouble _discreteValue = RestorableDouble(20);
  int x = 0;
  int y = 0;
  double _currentSliderValue = 0;

  // set the value of x and y from the text box
  void _setX(String x) {
    setState(() {
      this.x = int.parse(x);
    });
  }

  void _setY(String y) {
    setState(() {
      this.y = int.parse(y);
    });
  }

  // publish the value of x and y to the topic
  void _publish() {
    setState(() {
      topic.publish({'x': x, 'y': y, 'z': 0});
    });
  }

  @override
  void initState() {
    ros = Ros(url: 'ws://127.0.0.1:9090');
    topic = Topic(
      ros: ros,
      name: '/chatter',
      type: 'geometry_msgs/Vector3',
      reconnectOnClose: true,
      queueLength: 10,
      queueSize: 10,
    );
    super.initState();
    ros.connect();
  }

  // create two text box for x and y and a publish button
  @override
  Widget build(BuildContext context) {
    // final localizations = GalleryLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'x cordinat :',
            ),
            TextField(
              onChanged: _setX,
            ),
            Text(
              'y :',
            ),
            TextField(
              onChanged: _setY,
            ),
            ElevatedButton(
              onPressed: _publish,
              child: const Text('Publish'),
            ),
            Slider(
              // change width of slider
              value: _currentSliderValue,
              min: 0,
              max: 100,
              divisions: 100,
              label: _currentSliderValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            // Text(localisations.demoSlidersDiscrete)
          ],
        ),
      ),
    );
  }
}
