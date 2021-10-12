import 'package:flutter/material.dart';
import '../../visualimageview/view/visualimageview.dart';

void main() {
  runApp(mainvisualimage());
}

class mainvisualimage extends StatelessWidget {
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
      home: visualimageview(),
    );
  }
}
