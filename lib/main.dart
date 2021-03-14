import 'package:flutter/material.dart';
import 'package:ortalama_hesaplayici/models/lesson.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

List<Lesson> lessonRows = [];

var formKey = GlobalKey<FormState>();
var lessonNumberInputText = "Ders sayısı";

class _MyAppState extends State<MyApp> {
  int dropDownValue;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Ortalama Hesaplayıcı")),
        body: Column(children: [
          Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: Form(
              key: formKey,
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Ders sayısı:"),
                  SizedBox(width: 20),
                  buildLessonNumberDropdown()
                ]),
                SizedBox(height: 20.0),
                buildLessonListHeader(),
                Column(
                  children: List.generate(lessonRows.length, (i) {
                    return lessonRows[i].lessonRow();
                  }),
                )
              ]),
            ),
          ),
        ]));
  }

  void noteInputCreator(int parse) {
    lessonRows.clear();
    setState(() {
      for (var i = 0; i < parse; i++) {
        lessonRows.add(new Lesson("", 4.0, 1));
      }
    });
  }

  Widget buildLessonListHeader() {
    return Row(children: [
      Flexible(fit: FlexFit.tight, flex: 4, child: Text("Ders Adı")),
      SizedBox(width: 70),
      Flexible(fit: FlexFit.tight, flex: 2, child: Text("Not")),
      SizedBox(width: 30),
      Flexible(fit: FlexFit.tight, flex: 2, child: Text("Kredi")),
    ]);
  }

  Widget buildLessonNumberDropdown() {
    return DropdownButton<int>(
      hint: Text(lessonNumberInputText),
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      value: dropDownValue,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (int newValue) {
        setState(() {
          dropDownValue = newValue;
          noteInputCreator(newValue);
        });
      },
      items: <int>[0, 1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}
