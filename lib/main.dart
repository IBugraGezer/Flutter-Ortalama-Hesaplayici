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
var lessonNumberInputText = "Ders Sayısı";

class _MyAppState extends State<MyApp> {
  int dropDownValue;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Burranın Ortalama Hesaplayıcısı")),
      body:
          ListView(shrinkWrap: true, padding: EdgeInsets.all(15.0), children: [
        Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Form(
            key: formKey,
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Ders Sayısı:"),
                SizedBox(width: 20),
                buildLessonNumberDropdown()
              ]),
              SizedBox(height: 20.0),
              Text("(Ders adı girmek zorunlu değildir)",
                  style: TextStyle(color: Colors.red)),
              SizedBox(height: 20.0),
              buildLessonListHeader(),
              Column(
                children: List.generate(lessonRows.length, (i) {
                  return buildLessonRow(lessonRows[i]);
                }),
              ),
            ]),
          ),
        ),
      ]),
      bottomNavigationBar:
          Container(height: 60, child: buildCalculateButton(context)),
    );
  }

  void noteInputCreator(int parse) {
    lessonRows.clear();
    setState(() {
      for (var i = 0; i < parse; i++) {
        Lesson newLesson = Lesson("", 4.0, 1.0);
        lessonRows.add(newLesson);
        buildLessonRow(newLesson);
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
          print(newValue);
          dropDownValue = newValue;
          noteInputCreator(newValue);
        });
      },
      items: <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
          .map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }

  Widget buildLessonRow(Lesson lesson) {
    return Row(children: [
      Flexible(
          fit: FlexFit.tight,
          flex: 4,
          child: TextFormField(onSaved: (String value) {
            lesson.name = value;
          })),
      SizedBox(width: 30),
      Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: DropdownButton<String>(
            value: lesson.getGradeAsString,
            isExpanded: true,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              double grade = gradeStringToInt(newValue);

              setState(() {
                lesson.grade = grade;
                print(lesson.grade);
              });
            },
            items: <String>[
              'AA',
              'BA',
              'BB',
              'CB',
              'CC',
              'DC',
              'DD',
              'FD',
              'FF'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )),
      SizedBox(width: 30),
      Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: DropdownButton<double>(
              value: lesson.getCredit,
              isExpanded: true,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (double newValue) {
                setState(() {
                  lesson.credit = newValue;
                  print(lesson.credit);
                });
              },
              items: <double>[
                1,
                1.5,
                2,
                2.5,
                3,
                3.5,
                4,
                4.5,
                5,
                5.5,
                6,
                6.5,
                7,
                7.5,
                8,
                8.5,
                9,
                9.5,
                10
              ].map<DropdownMenuItem<double>>((double value) {
                return DropdownMenuItem<double>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList())),
    ]);
  }

  double gradeStringToInt(String newValue) {
    double grade;
    switch (newValue) {
      case 'AA':
        {
          grade = 4;
        }
        break;

      case 'BA':
        {
          grade = 3.5;
        }
        break;

      case 'BB':
        {
          grade = 3;
        }
        break;

      case 'CB':
        {
          grade = 2.5;
        }
        break;

      case 'CC':
        {
          grade = 2;
        }
        break;

      case 'DC':
        {
          grade = 1.5;
        }
        break;

      case 'DD':
        {
          grade = 1;
        }
        break;

      case 'FD':
        {
          grade = 0.5;
        }
        break;

      case 'FF':
        {
          grade = 0;
        }
        break;
    }
    return grade;
  }

  Widget buildCalculateButton(BuildContext context) {
    return RaisedButton(
        color: Colors.blueAccent,
        child: Text("Hesapla",
            style: TextStyle(color: Colors.white, fontSize: 17)),
        onPressed: () {
          if (lessonRows.length < 1) {
            alert(context, "Hata", "Ders sayısı 0 olamaz");
          } else {
            double grade;
            double credit;
            double sumGrade = 0;
            double sumCredits = 0;
            lessonRows.forEach((element) {
              grade = element.grade;
              credit = element.credit;
              sumCredits += credit;
              sumGrade += grade * credit;
            });
            double result = sumGrade / sumCredits;
            String formattedValue = result.toStringAsFixed(2);
            alert(context, "Sonuç", "Ortalamanız: " + formattedValue);
          }
        });
  }

  void alert(BuildContext context, String title, String content) {
    var alert = AlertDialog(
      title: Text(title),
      content: Text(content),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
