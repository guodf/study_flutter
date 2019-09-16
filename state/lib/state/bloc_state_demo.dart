import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlocStateDemoPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _BlocStateDemoPage();
  }
}

class _BlocStateDemoPage extends State<BlocStateDemoPage>{
  int clickTimes=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('点击页面'),
      ),
      body:InkWell(
        onTap: (){
          clickTimes++;
          setState(() {

          });
        },
        child: Center(
          child: Text('点击次数:$clickTimes'),
        ),
      )
    );
  }
}