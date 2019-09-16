import 'package:channel_example/my_channel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  MyChannel _channel = MyChannel("mychannel", StringCodec());
  TextEditingController controller;
  String value = "";
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    print(value);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('channel学习')),
        body: Column(
          children: <Widget>[
            TextField(
              controller: controller,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(value)),
            OutlineButton(
              child: Text("mychannel"),
              onPressed: () {
                _channel.eventStream(controller.text).listen((data){
                  setState(() {
                    print(value);
                   value=data; 
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
