import 'package:DevQuiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage  extends StatefulWidget {
  HomePage({Key? key }) : super(key: key);

  @override
   _HomePage_State createState() =>  _HomePage_State();
}

// ignore: camel_case_types
class _HomePage_State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
    );
  }
}