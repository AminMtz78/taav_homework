import 'dart:io';

void main () {
  List<List<String>> matrix = [
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' ']
  ];

  String currentPlayer = 'X';

  int row , column;
  
  int roundCounter = 0; 
  
  bool endGame = false;
  
  // main loop of the game
  while (! endGame){
    printScreen(matrix: matrix);

    if ( currentPlayer == 'X'){
      print('It is the turn of the first player (X)');
    }
    else{
      print('It is the turn of the second player (Y)');
    }

    (row , column ) = inputRowAndColumn();
    // print(row);
    // print(column);

    if (! checkEmpty(matrix: matrix, row: row, column: column)){
      print('the entered row and column is full please try another one');
      continue;
    }

    matrix[row][column] = currentPlayer;
    roundCounter ++;

    endGame = checkWinner(currentPlayer: currentPlayer, matrix: matrix);

    if (endGame){
      printScreen(matrix: matrix);

      if (currentPlayer == 'X'){
        print('player 1 ($currentPlayer) wins');
        
      }
      else {
        print('player 2 ($currentPlayer) wins');
      }
      
      break;
    }
    
    //check draw 
    if (roundCounter == 9){
      if (! checkWinner(currentPlayer: currentPlayer, matrix: matrix)){
        printScreen(matrix: matrix);
        print('Game over. It\'s a draw!');
        break;
      }
    }
    print('conter : $roundCounter');

    currentPlayer = changePlayer(currentPlayer: currentPlayer);

  }


}


// draw the matrix (Game table)
void printScreen ({required List<List<String>> matrix}){

  for (int i = 0; i < 3; i++){
    for (int j = 0; j < 3; j++){
      stdout.write(matrix[i][j]);
      if (j < 2){
        stdout.write(' | ');
      }

    }
    print('');
    print('----------');
  }
}

//get the numbers of row and column from players
(int, int )inputRowAndColumn () {


  while (true){
    print('Please enter two numbers {1 or 2 or 3} separated by a space.\nfirst number = row, second number = column\nfor example:2 3 ');
    String? input = stdin.readLineSync();
    if (input == null || input.length != 3){
      print('wronge input');
      continue;
    }
  
    int? row = int.tryParse(input[0]) ;
    int? column = int.tryParse(input[2]);

    if (row != null && column != null){
      
      if ((row == 1 || row == 2 || row ==3) && (column == 1 || column == 2 || column ==3) ){
        return (row -1 , column -1 );
      }

      else{
        print('wronge input');
        continue;
      }

    }

  }



}

// Checking the rows and columns entered by the players in the matrix are empty or not
bool checkEmpty ({required  List<List<String>> matrix , required int row ,required int column}){
  if (matrix[row][column] == ' '){
    return true;
  }
  else {
    return false;
  }
}

//changing players
String changePlayer ({required String currentPlayer}){

  // if (currentPlayer == 'X'){
  //   return 'Y';
  // }
  // else  {
  //   return 'X';
  // }

  switch (currentPlayer){

    case 'X':
      currentPlayer = 'Y';

    case 'Y' :
      currentPlayer = 'X';
  }

  return currentPlayer;
}

//Check the rows and columns and diagonals of the matrix to find the winner
bool checkWinner ({required String currentPlayer, required List<List<String>> matrix}){


  for (int i = 0; i < 3; i++){

    //check rows
    if (matrix[i][0] == currentPlayer && matrix[i][1] == currentPlayer && matrix[i][2] == currentPlayer) {
      return true;
    }

    //check columns
    else if (matrix[0][i] == currentPlayer && matrix[1][i] == currentPlayer && matrix[2][i] == currentPlayer ) {
      return true;
    }
  }

  //check diagonals
  if (matrix[0][0] == currentPlayer && matrix[1][1] == currentPlayer && matrix[2][2] == currentPlayer ){
    return true;
  }

  if (matrix[0][2] == currentPlayer && matrix[1][1] == currentPlayer && matrix[2][0] == currentPlayer ){
    return true;
  }

  return false;

}

