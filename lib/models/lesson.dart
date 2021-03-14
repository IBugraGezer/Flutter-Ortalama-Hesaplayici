import 'package:flutter/material.dart';

class Lesson {
  String name;
  double grade;
  int credit;
  Lesson(name, grade, credit) {
    this.name = name;
    this.grade = grade;
    this.credit = credit;
  }
  Widget lessonRow() {
    String currentGradeValue = "AA";
    return Row(children: [
      Flexible(
          fit: FlexFit.tight,
          flex: 4,
          child: TextFormField(onSaved: (String value) {
            this.name = value;
          })),
      SizedBox(width: 30),
      Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: DropdownButton<String>(
            value: currentGradeValue,
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
              currentGradeValue = newValue;
              print(currentGradeValue);
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
              this.grade = grade;
              print(this.grade);
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
          child: DropdownButton<int>(
              value: 1,
              isExpanded: true,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (int newValue) {
                this.credit = newValue;
                print(this.credit);
              },
              items: <int>[1, 2, 3].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList())),
    ]);
  }

  String get getGradeAsString {
    var gradeAsString;
    if (this.grade == 4) {
      gradeAsString = "AA";
    }
    if (this.grade == 3.5) {
      gradeAsString = "BA";
    }
    if (this.grade == 3) {
      gradeAsString = "BB";
    }
    if (this.grade == 2.5) {
      gradeAsString = "CB";
    }
    if (this.grade == 2) {
      gradeAsString = "CC";
    }
    if (this.grade == 1.5) {
      gradeAsString = "DC";
    }
    if (this.grade == 1) {
      gradeAsString = "DD";
    }
    if (this.grade == 0.5) {
      gradeAsString = "FD";
    }
    if (this.grade == 0) {
      gradeAsString = "FF";
    }
    return gradeAsString;
  }
}
