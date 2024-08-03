// /Done
import 'dart:io';


void main(){
  // List<int> myList = [1,43,2,5,67,345,23,6,9,0];
  List<int> myList = getInputNumbers();


  int max ;



  List<int> newList = [];

  int counter = 0;

  int length = myList.length;

  while (counter < length){
    max = myList[0];
    for (int i = 0; i < myList.length; i++){
      if (max < myList[i]){
        max = myList[i];
      }
    }
    newList.add(max);

    myList.remove(max);

    counter++;

  }

 print(newList);


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
