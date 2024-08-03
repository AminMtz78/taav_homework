import 'dart:io';

void main(){

  List<int> myList = [1,4,2,5,98776,34,56,87,6,9,2,345,987,654,34,56,];

  int max = 0;

  for(int i = 0; i < myList.length -1 ; i++){
    if(max < myList[i]){
      max = myList[i];
    }
  }

  print('maximum is : $max');


}