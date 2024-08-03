

import 'dart:io';

void main(){

// List<int> myList = getInputNumbers();
List<int> myList = [1,43,2,5,67,345,23,6,9,0];

int mostRepeat = 0;
List<int> counter = [];
int max  = 0;
int average = 0;


for ( int j = 0; j < myList.length; j++) {

  if (myList[j] >= max) {
    max = myList[j];
  }

  average += myList[j];
}





  int mostIndex = myList[mostRepeat];
  print('most repeat = $mostIndex');
  print('maximum = $max');
  print('average = $average');

}


List<int> getInputNumbers (){
  int? a ;
  String? input = '';
  List<int> numbersList =[];
  int count = 0;
  while(count < 10){
    print('enter numbers:');
    input = stdin.readLineSync();
    while(input == null){
      print('enter number:');
      input =stdin.readLineSync();
    }

    a = int.tryParse(input);
    if (a == null){
      continue;
    }
    else  {
      numbersList.add(a);
      count++;
    }
  }
  return numbersList;
}