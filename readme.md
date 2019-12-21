### Introduction
[The Odin project](https://www.theodinproject.com/) is a great way to learn web development, It limits the choices for you and provides well-chosen resources to start your journey as a web developer without getting lost.

### How it works?

1. Read and watch all the required contents and make sure you understand the topics on your own.
2. Test yourself by solving the quizzes provided at the end of each lesson and answering the outcome questions.
3. Do the assignments by putting all what you have learned to build mini projects.

This repository contains my solutions.
### Rules Must Follow: 
* Each project should not be a one-try solution, Each time I learn something new e.g: design patterns, coding styles and best practices I have to apply them on the previous projects.
* Each project must have the minimal tests to make sure it is working and I can refactor the code with a confidant.

### Projects:
+ [Knight's Travails](https://github.com/abachi/theodinproject/tree/master/building-projects/knights_travails)
 build a function knight_moves that shows the simplest possible way to get from one square to another by outputting all squares the knight will stop on along the way.
 For example:
     <blockquote>
      <p>> knight_moves([3,3],[4,3])</p>
      <p>  => You made it in 3 moves!  Heres your path:
            [3,3]
            [4,5]
            [2,4]
            [4,3]
      </p>
    </blockquote>
+ [Binary Search Trees](https://github.com/abachi/theodinproject/tree/master/building-projects/binary_search_trees)
A simple binary search tree implemention where the tree has the following methods:
  - #build_tree which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a balanced binary tree
  - #insert and #delete method which accepts a value to insert/delete
  - #find method which accepts a value and returns the node with the given value
  - #level_order method which accepts a block. The method traverse the tree in breadth-first level order and yield each node to the provided block
  - #inorder, #preorder, and #postorder methods which accept a block. Each method should traverse the tree in their respective depth-first order and yield each node to the provided block
  - #depth method which accepts a node and returns the depth(number of levels) beneath the node
  - #balanced? method which checks if the tree is balanced
  - #rebalance! method which rebalances an unbalanced tree
  Finally a simple [driver script](https://github.com/abachi/theodinproject/blob/master/building-projects/binary_search_trees/driver.rb) as an example to test these methods.
+ [Linked Lists](https://github.com/abachi/theodinproject/tree/master/building-projects/linked-list)
  - #append adds a new node to the end of the list
  - #prepend adds a new node to the start of the list
  - #size returns the total number of nodes in the list
  - #head returns the first node in the list
  - #tail returns the last node in the list
  - #at(index) returns the node at the given index
  - #pop removes the last element from the list
  - #contains? returns true if the passed in value is in the list and otherwise returns false.
  - #find(data) returns the index of the node containing data, or nil if not found.
  - #to_s represent your LinkedList objects as strings, The format should be: ( data ) -> ( data ) -> ( data ) -> nil
  - #insert_at(index) that inserts the node at the given index
  - #remove_at(index) that removes the node at the given index.
+ [Hangman](https://github.com/abachi/theodinproject/tree/master/building-projects/hangman)
A simple command line Hangman game where one player plays against the computer and he/she can save the game state and reload it anytime.
+ [Mastermind](https://github.com/abachi/theodinproject/tree/master/building-projects/mastermind)
Build a [Mastermind](http://en.wikipedia.org/wiki/Mastermind_(board_game)) game from the command line where you have 12 turns to guess the secret code, starting with you guessing the computer’s random code.

+ [Tic Tac Toe](https://github.com/abachi/theodinproject/tree/master/building-projects/tic-tac-toe)
Build a [tic-tac-toe](http://en.wikipedia.org/wiki/Tic-tac-toe) game on the command line where two human players can play against each other and the board is displayed in between turns.

+ [Caesar Cipher](https://github.com/abachi/theodinproject/tree/master/building-projects/caesar_cipher)
Implement a [caesar cipher](https://www.youtube.com/watch?v=36xNpbosfTY) that takes in a string and the shift factor and then outputs the modified string.

+ [Stock Picker](https://github.com/abachi/theodinproject/tree/master/building-projects/stock_picker)
Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
For Example:
    <blockquote>
      <p>stock_picker([17,3,6,9,15,8,6,1,10])</p>
      <p>=> [1,4]  # for a profit of $15 - $3 == $12</p>
    </blockquote>
 
 + [Substrings](https://github.com/abachi/theodinproject/tree/master/building-projects/substrings)
 Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.
 For Example:
    <blockquote>
      <p> > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"] </p>
      <p> => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]</p>
      <p> > substrings("below", dictionary) </p>
      <p> => { "below" => 1, "low" => 1 }</p>
    </blockquote>
 
 + [bubble_sort](https://github.com/abachi/theodinproject/tree/master/building-projects/bubble_sort)
 Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort methodology.
 For Example:
    <blockquote>
      <p> > bubble_sort([4,3,78,2,0,2]) </p>
      <p> => [0,2,2,3,4,78] </p>
    </blockquote>
  + [Enumerable Methods](https://github.com/abachi/theodinproject/tree/master/building-projects/enumerable)
  Rebuild the following methods:
    - #my_each
    - #my_each_with_index
    - #my_select
    - #my_all?
    - #my_any?
    - #my_none?
    - #my_map
    - #my_inject