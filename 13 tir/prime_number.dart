import 'dart:io';
void main(){


  print(2);

  for(int number = 3; number <= 100; number++){

    int counter = 0;

    for(int j = 2; j < number;j++){
      if(number % j != 0){
        counter++;
      }
    }

    if(counter == number - 2){
      print(number);
    }
  }



}