// import 'dart:collection';
import 'dart:io';
import 'dart:math';

void main(){

  List<String> words = ['frontend',
    'dart', 'developer', 'flutter', 'python', 'string', 'class', 'inheritance', 'recursive', 'stack'];

  List<String> guessedLetters =[];
  List<String> wrongLetters = [''];

  final random =  Random();

  List<String> element = words[random.nextInt(words.length)].split('');
  print(element.join());


  for (int i = 0; i < element.length; i++){
    guessedLetters.add('_');
  }
  print(guessedLetters.join());

  if (element.length == guessedLetters.length)
    {
      print('true');
    }



  while (element.join() != guessedLetters.join()){
  
    print('please enter a letter: ');
    String letter = inputString();
   guessedLetters =  wordGuessing(wrongLetters: wrongLetters, guessedLetters: guessedLetters, element: element, inputLetter: letter);

  }
  String word = element.join();
  print('congratulations');
  print('the answer is : $word');
  print('wrong characters : $wrongLetters');






}

  List<String> wordGuessing ({required List<String> wrongLetters, required List<String> guessedLetters , required List<String> element, required String inputLetter }){


  int counter = 0;
  for (int i = 0; i < element.length; i++){
    if (element[i] == inputLetter){

      guessedLetters[i] = inputLetter;
    }

    else if (element[i] != inputLetter){
      counter ++;
    }
  }
  if (counter == element.length ){
    wrongLetters.add(inputLetter);
  }

  print(guessedLetters.join());
  print('wrong : $wrongLetters');
  return guessedLetters ;
  }


  String inputString(){

  String? input = stdin.readLineSync();

  while ( input == null || input.length > 1){
    print('please enter a letter');
    input = stdin.readLineSync();
  }

  return input.toLowerCase();
}







