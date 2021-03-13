import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: myApp()));
}

Widget myApp() {
  return Scaffold(
      appBar: AppBar(title: Text("Ortalama Hesaplayıcı")),
      body: Center(
        child: Text("Ortalama Hesaplayıcı"),
      ));
}
