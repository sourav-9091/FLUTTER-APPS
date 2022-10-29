import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  // REFERENCE THE BOX
  final _myBox = Hive.box('mybox');

  // RUN FIRST TIME OPENING THSI APP
  void createInitialData() {
    toDoList = [
      ["START USING THE APP", false],
      ["SWIPE LEFT TO DELETE THE TASK", false],
    ];
  }

  //LOAD THE DATA FROM DATABASE
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //UPDATE THE DATABASE
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
