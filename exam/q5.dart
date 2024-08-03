import 'dart:io';


List<List<String>> todos =
[
  [],
  [],
  []
];
void main() {
// List<List<String>> todos =
// [
//   [],
//   [],
//   []
// ];


  while (true){
    print(
        'menu:\n'
        'for inset please enter :1 \n'
        'for update enter :2\n'
        'for delete enter:3\n'
        'for change situation enter:4\n'
        'for see todos enter:5\n'
        'for exit enter :-1\n'
    );
    int userEnter = getNumber();

    if (userEnter == 1){
      insertTodo();
      seeTodo(todos: todos) ;
      continue;
    }

    else if (userEnter == 2){
      updateTodo();
      seeTodo(todos: todos);
      continue;
    }

    else if (userEnter == 3){
      deleteTodos();
      seeTodo(todos: todos);
      continue;
    }

    else if (userEnter == 4){
      changeSituation();
      seeTodo(todos: todos);
      continue;
    }

    else if (userEnter == 5){
      seeTodo(todos: todos);
      continue;
    }

    else if (userEnter == -1) {
      break;
    }

    else  {
      continue;
    }

  }

}

List<List<String>> insertTodo (){
  print('enter name of todos');
  String name = getString();
  todos[0].add(name);
  print('enter description of todos');
  String description = getString();
  todos[1].add(description);


  todos[2].add('pending');




  return todos;
}


void seeTodo ({required List<List<String>> todos}){


  print('todos name list :');
  print(todos[0]);
  
  print('todos description List:');
  print(todos[1]);
  
  print('todos situation:');
  print(todos[2]);
}

void changeSituation(){
  print('please enter index:');
  int index = getNumber();

  if (todos[2][index] == 'pending'){
    todos[2][index] = 'done';
  }
}

void deleteTodos(){
  print('please enter index of todo for delete:');
  int index = getNumber();

  todos[0][index] = '';
  todos[1][index] = '';
  todos[2][index] = '';
}

void updateTodo(){
  print('please enter the index of todo for update:');
  int index = getNumber();

  print('enter new name:');
  String name =getString();
  todos [0][index] = name;

  print('enter description:'); String desc = getString();
  todos [1][index] =  desc;

  todos [2][index] = 'pending';
}


int getNumber (){
  int ? a;

  while(true){
    print('enter numbers:');
    var input = stdin.readLineSync();
    while(input == null){
      print('enter number:');
      input =stdin.readLineSync();
    }

    a = int.tryParse(input);
    if (a == null){
      continue;
    }
    else  {
      return a;
    }
  }


}

String getString(){
  String? input ;

  input = stdin.readLineSync();
  while (input == null){
    print('wrong input');
    input = stdin.readLineSync();
  }

  return input;
}
