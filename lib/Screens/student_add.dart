import 'package:flutter/material.dart';
import 'package:temelwidget/models/student.dart';
import 'package:temelwidget/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }

}

class _StudentAddState extends State with StudentValidationMixin{
  var student = Student.withoutInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
               buildFirstNameField(),
               buildLastNameField(),
               buildGradeField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Ramis"),
      validator: validateFirstName,
      onSaved: (String value){
        student.firsName = value;
      },
    );
  }
  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Soydı", hintText: "Yüksel"),
      validator: validateLastName,
      onSaved: (String value){
        student.lastName = value;
      },
    );
  }
  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Not", hintText: "65"),
      validator: validateGrade,
      onSaved: (String value){
        student.grade = int.parse(value);
      },
    );
  }
}