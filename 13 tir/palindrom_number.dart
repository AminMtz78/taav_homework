import 'dart:io';

void main(){

  String? input;
  int? number;
  do{
    print('enter your number:\n (for exit please type: *exit)');
    input = stdin.readLineSync();
    if(input != null){
      number = int.tryParse(input);
    }
    // if(input == '*exit'){
    //   break;
    // }

  }
  while(number == null);

  // print(number);

  //reverse number


  int inverseNumber = 0;
  int temp = number;

  int remain;

  while(temp > 0){
    remain = temp % 10;
    inverseNumber = (inverseNumber * 10) + remain;
    temp = temp ~/ 10;
  }
  print(number);
  print(inverseNumber);

  if( number == inverseNumber){
    print('the number is palindrom');
  }
  else{
    print("the number isn't palindrom");
  }








}