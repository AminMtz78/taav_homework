import 'dart:io';

import 'todo.dart';

List<Todo> myList = [];

void main(){

  while (true){
    showTodo();

    print('for insert todo enter :1\n'
        'for update todo enter :2\n'
        'for delete todo enter:3\n'
        'for change state of todo enter:4\n'
        'for exit enter:0 ');

    int input = getInt();
    if (input == 1){
      insertTodo();
      continue;
    }
    else if (input == 2){
      updateTodo();
      continue;
    }
    else if (input == 3){
      deleteTodo();
      continue;
    }

    else if (input == 4){
      changeState();
      continue;
    }
    else if (input == 0){
      break;
    }
    else {
      print('wrong input');
      continue;
    }

  }

}


void insertTodo(){
  while (true){
    print('please enter title of todo (if you want to exit please type :exit)');
    String title = getString();
    if (title == 'exit'){
      break;
    }
    print('please enter description of todo');
    String description = getString();
    print('please enter score of todo');
    int score = getInt();
    Todo myTodo = Todo(title: title, description: description, score: score);
    myList.add(myTodo);
    break;
  }
  
}

String getString (){
  String? input;
  do{
    input = stdin.readLineSync();
  }while (input == null);

  return input;
}

int getInt (){
  int? digit;
  do{
    String input = getString();
    digit = int.tryParse(input);
  }while (digit == null);

  return digit;
}

void showTodo (){
  print(myList);
}

void changeState(){
  int length = myList.length;
  int input;
  do{
    print('enter the index of todo (between 0 and $length)');
     input = getInt();
  }while (input < 0 && input > length);

  myList[input].state = 'done';
  print('complete');


}

void deleteTodo(){
  int length = myList.length;
  int input;
  do{
    print('enter the index of todo (between 0 and $length)');
    input = getInt();
  }while (input < 0 && input > length);

  myList.removeAt(input);
}

void updateTodo(){
  int length = myList.length;
  int input;
  do{
    print('enter the index of todo you want to update (between 0 and $length)');
    input = getInt();
  }while (input < 0 && input > length);


  while (true) {
    print('please enter title of todo (if you want to exit please type :exit)');
    String title = getString();
    if (title == 'exit') {
      break;
    }
    print('please enter description of todo');
    String description = getString();
    print('please enter score of todo');
    int score = getInt();
    Todo myTodo = Todo(title: title, description: description, score: score);
    myList[input] = myTodo;
    break;
  }

}