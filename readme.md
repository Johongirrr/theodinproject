## My efforts while learning and practicing the odin project:

[The Odin project](https://www.theodinproject.com/) is a great way to learn web development, It limits the choices for you and provides a well choosen resources to start your journey as a web developer without getting lost.

### How it works?

1. You start reading and watching all the required content and make sure you understand the topics by yourself.
2. Test yourself by sovling the quizzes provided at the end of each lesson and answering the outcome questions.
3. Do the assignments, putting all what you learned and build projects.

I decided to take this challenge and this reposetory contains my assignments solutions.
### Rules Must Follow: 
* Each project should not be one-try solution, Each time I learn something new e.g: design patterns, coding styles and best practices I should apply them to the previous projects.
* Each project must have the minimal tests to make sure its working and to make is easy for me to refactor with a confident.

### Projects:
+ [Tic Tac Toe](https://github.com/abachi/theodinproject/tree/master/building-projects/tic-tac-toe)
Build a [tic-tac-toe](http://en.wikipedia.org/wiki/Tic-tac-toe) game on the command line where two human players can play against each other and the board is displayed in between turns.

+ [Caesar Cipher](https://github.com/abachi/theodinproject/tree/master/building-projects/caesar_cipher)
Implement a [caesar cipher](https://www.youtube.com/watch?v=36xNpbosfTY) that takes in a string and the shift factor and then outputs the modified string.

+ [Stock Picker](https://github.com/abachi/theodinproject/tree/master/building-projects/stock_picker)
Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
Example:
    <blockquote>
      <p>stock_picker([17,3,6,9,15,8,6,1,10])</p>
      <p>=> [1,4]  # for a profit of $15 - $3 == $12</p>
    </blockquote>
 
 + [Substrings](https://github.com/abachi/theodinproject/tree/master/building-projects/substrings)
 Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.
 Example:
    <blockquote>
      <p> > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"] </p>
      <p> => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]</p>
      <p> > substrings("below", dictionary) </p>
      <p> => { "below" => 1, "low" => 1 }</p>
    </blockquote>
 
 + [bubble_sort](https://github.com/abachi/theodinproject/tree/master/building-projects/bubble_sort)
 Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort methodology.
 Example:
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