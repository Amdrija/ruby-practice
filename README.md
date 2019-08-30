# Ruby Practice Programs

This is a ruby repo that holds all the programs used for practice for [The Odin Project](https://www.theodinproject.com).  

## Caesar's Cipher

This is a script that encrypts input by using the [Caesar's cipher](https://en.wikipedia.org/wiki/Caesar_cipher). It prompts you for input you want to encrypt and the shift amount and then prints out the encrypted text.  

## Stock Picker

This program finds the maximum difference between two numbers in the array and prints them such that the larger number appears after the smaller number. Think of it like each index represents a day and each element in the array is the price of the stock on a given day. The program should find the largest profit you can make by buying the stock on one day and selling it afterwards.  
This was done in O(n) time complexity and O(1) memory complexity by always keeping track of the current smallest element in the array and checking if the difference of the current element and the smallest element is greater than the maximum difference. If it is, it saves the indexes of those elements.  

## Substring

This script counts all occurancies of words in array dictionary which are also contained in a given text. It return a hash with dictionary words as keys and how many were counted in the text as values. It doesn't add words that haven't appeared in the text to the hash.  

## Bubble Sort

This script uses [Bubble sort](https://en.wikipedia.org/wiki/Bubble_sort) to sort an array. It has 2 methods:   
- bubble_sort! which uses bubble sort to sort the array in place by using the ">" comparison between elements
- bubble_sort_by! which sorts the array in place by using a comparison provided by the block. If it wasn't given a block, it returns [] and puts out the error : "Error: No comparison given."  

## Enumerable, my implementation

This is used for practicing Ruby by implementing some of the methods from Enumerable module, it works only on Arrays:
- my_each : Takes a block, executes the block for every element in the object that called it and returns the original object. The block takes 1 argument, the current element. If it's not given a block, returns self.
- my_each_with_index : Same as my_each, except the block takes 2 arguments, current element and current index.
- my_select : Takes a block, executes it for every element and returns an array of values for which the block returned true. The block takes 1 argument, the current element. If it's not given a block, returns self.
- my_all? : Takes a block, executes it for every element and returns true if the block returned true for all elements, otherwise returns false. If it's called without a block, it recursively calls itself while passing the block { | el | el }
- my_any? : Takes a block, executes it for every element and returns true if the block returned true for any elements, otherwise returns false. If it's called without a block, it recursively calls itself while passing the block {|el| el}
- my_none? : Takes a block, executes it for every element and returns true if the block returned false for all elements, otherwise returns true. If it's called without a block, it recursively calls itself while passing the block {|el| el}
- my_count : Takes an object, a block or no arguments. If it is called with an object, it returns how many elements equal that object. If it is called with a block, it returns how many elements returned true when passed to the block. If it is called without arguments, it returns the number of elements in object.
- my_map : Takes a proc or a block and applies it to the every element, returning an array of modified elements.
- my_inject : Takes an accumulator and a block. It executes the block for every element and returns the result of calling the block on elements and accumulator. The block takes 2 arguments, accumulator and current element. If my_inject is called without an argument, it takes the first element as the accumulator. If it's called without a block, it returns nil.

## Tic-Tac-Toe

Tic-Tac-Toe recreated in terminal using Ruby.

## Mastermind

[Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game)) game recreated in terminal using Ruby. For now you can only play as the decoder, trying to guess the code that the computer has generetaed.