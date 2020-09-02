
import 'package:flutter/material.dart';
import 'package:temelwidget/models/student.dart';
import 'package:temelwidget/Screens/student_add.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp()//çalışacak olan kod
  ));
}

class MyApp extends StatefulWidget{

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Student selectedStudent = Student.withId(0, "", "", 0);

  List<Student> students = [new Student.withId(1, "Ramis", "Yüksel", 25), Student.withId(2, "Kerem", "Varış", 80), Student.withId(3, "Halil", "Duymaz", 45)];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String mesaj = "Öğrenci Takip Sistemi";
    int not = 65;
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context)
    );
  }

  void mesajGoster(BuildContext context, String mesaj){
    var alert = AlertDialog(
      title: Text("Uyarı"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2020/07/07/13/52/woman-5380651_1280.jpg"),
                    ),
                    title: Text(students[index].firsName + " " + students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not: " + students[index].grade.toString() + " ["+students[index].getStatus+"]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: (){
                      setState(() {
                        selectedStudent = students[index];
                        print(selectedStudent.firsName);
                      });

                    },

                    //onTap: ,
                  );
                  //return Text(students[index].firsName);
                })
        ),
        Text("Seçili Öğrenci : " + selectedStudent.firsName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: RaisedButton(
                  color: Colors.amberAccent,
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 5.0,),
                      Text("Yeni Öğrenci"),
                    ],
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StudentAdd()));
                  },
                ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: RaisedButton(
                color: Colors.black12,
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 5.0,),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: (){
                  var mesaj = "Güncellendi";
                  mesajGoster(context, mesaj);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5.0,),
                    Text("Sil"),
                  ],
                ),
                onPressed: (){
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  var mesaj = "Öğrenci Silindi : " + selectedStudent.firsName;
                  mesajGoster(context, mesaj);
                },
              ),
            ),
          ],
        )


      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if(grade >= 50){
      return Icon(Icons.done);
    }
    else if(grade>=40){
      return Icon(Icons.album);
    }
    else{
      return Icon(Icons.clear);
    }
  }
}