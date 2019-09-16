import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/state/bloc_state_demo.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void didUpdateWidget(MainPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {"blocStateDemoPage": (context) => BlocStateDemoPage()},
        home:  HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter学习"),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            OutlineButton(
              child: Text('Bloc状态'),
              onPressed: () {
//                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BlocStateDemoPage()));
                Navigator.pushNamed(context, 'blocStateDemoPage');
              },
            )
          ],
        )));
  }
}
