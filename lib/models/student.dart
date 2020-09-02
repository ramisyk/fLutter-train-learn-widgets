import 'dart:io';

class Student{
  int id;
  String firsName;
  String lastName;
  int grade;
  String _status;

  Student.withId(int id, String firsName, String lastName, int grade){
    this.id = id;
    this.firsName = firsName;
    this.lastName = lastName;
    this.grade = grade;
  }
  Student(String firsName, String lastName, int grade){
    this.firsName = firsName;
    this.lastName = lastName;
    this.grade = grade;
  }
  Student.withoutInfo(){

  }
  String get getFirtsName{
    return "OGR - " + this.firsName;
  }
  void set setFirstName(String value){
    firsName = value;
  }

  String get getStatus{
    String message = "";
    if(this.grade >= 50){
      message = "Geçti";
    }
    else if(this.grade >= 40){
      message = "Bütünleme";
    }
    else{
      message = "Kaldı";
    }
    return message;
  }
}