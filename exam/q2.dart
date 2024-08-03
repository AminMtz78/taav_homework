//Done
import 'dart:io';


void main(){
  // List<int> myList = [1,43,2,5,67,345,23,6,9,0];
  List<int> myList = getInputNumbers();

  int max1 = myList[0];
  int max2 =myList[1];
  int temp ;

  if (max1 < max2){
    temp = max1;
    max1 = max2;
    max2 =temp;
  }

  for (int i = 0; i < myList.length; i++){
    if( myList[i] > max1){
      max2 = max1;
      max1 = myList[i];
    }

    if (myList[i] > max2 && myList[i] < max1){
      max2 = myList[i];
    }
  }

  print('max 2 = $max2');

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