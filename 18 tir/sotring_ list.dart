

void main(){

  List<String> myList = ['amin', 'ali','mohammad reza', '', 'alireza', 'mohammad', 'sahar','ma','a','lia'];
  List<String> sortedList =sortingList(list: myList);
  print(sortedList);

}

List<String> sortingList ({required List<String> list }){

  List<String> result = [];

  int listLength =  list.length;
  int count = 0;

  while ( count < listLength){

    int min = list[0].length;
    int minIndex = 0;

    for (int i = 1; i < list.length; i++){
      if (min > list[i].length){
        min = list[i].length;
        minIndex = i;
      }
    }

    result.add(list[minIndex]);
    list.removeAt(minIndex);
    count++;
  }

  return result;
}



