class Lesson {
  String name;
  double grade;
  double credit;
  Lesson(name, grade, credit) {
    this.name = name;
    this.grade = grade;
    this.credit = credit;
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

  double get getCredit {
    return this.credit;
  }
}
