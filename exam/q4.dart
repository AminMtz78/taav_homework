import 'dart:io';

void main(){

  // List<int> myList = [67,67,67,67,67,67,67,6,23,67];

  // List<int> newList = [...myList];
  List<int> myList = getInputNumbers();

  int length =myList.length;

  for (int i = 0; i < length; i++){
    for (int j = 1; j < myList.length; j++){
      if (myList[i] == myList[j]){
        myList.remove(myList[j]);
      }
    }
  }

  print(myList);
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