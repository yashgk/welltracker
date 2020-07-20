import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Welcome"),
      elevation: 0 ,
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
      ),
      flexibleSpace: Container(decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.blue, Colors.grey])
    ),
    ),
    ),
    body: Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Text("Name :"),
            TextFormField(),
            Text("Age :"),
            TextFormField(),
            Text("Height :"),
            TextFormField(),
            Text("Weight :"),
            TextFormField(),
          ],
        ),
      ),
  ),
  );
  }
}
