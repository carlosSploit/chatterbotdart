import 'package:flutter/material.dart';
import 'views/insideView.dart';
import 'messegeview/view/messegeview.dart';
//import 'package:whatsappfrond/messegeview/view/messegeview.dart';
//import 'package:whatsappfrond/perfilview/view/perfildview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: messegeview(),
    );
  }
}
