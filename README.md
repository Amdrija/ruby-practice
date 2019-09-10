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

[Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game)) game recreated in terminal using Ruby. You can play as the decoder, trying to guess the computer generated code, or you can play as the coder and let the computer guess your code.  
Computer guessing was done by generating a pool of all possible codes, and randomly selecting one. When the computer gets feedback about the code, it removes all codes that can't possible have returned that feedback. Then, from the updated pool, it chooses a code at random and repeats the process until it either guessed the code or ran out of guesses.

## Fibonacci 
Recursive and iterative implementation of a function that returns the array of first n fibonacci numbers.

## Merge Sort
Recursive implementation of merge sort.

## Linked list
Linked list implementation in Ruby. The class has following methods:
- append(value): Inserts a node with the given value at the end of the list. Returns self.
- prepend(value): Insert a node with the given value at the beginning of the list. Returns self.
- to_s: Converts the list to a string in the format: (current.value) -> (next.value) etc. and returns it.
- size: Returns the size of the list.
- at(index): Returns the value at given index, if it doesn't exist or if index is out of bounds, returns nil.
- pop: Removes the last node in the list and returns it's value.
- contains?(value): Returns true if the list contains the value, otherwise returns false.
- find(value): Returns the index of the first occurance of the value, otherwise returns nil.
- insert_at(index, value): Inserts a node with the given value at the given index. If index is greater or equal than the size of the list it inserts the node at the end. If index is less than or equal to 0, the method inserts the node at the beginning of the list. Returns self.
- remove_at(index): Removes the node at the given index. Returns self unless the index is greater than or equal to size of the list, index is lower than 0, list is empty or list ha 1 node. In any of the mentioned cases it returns nil

## Binary Search Tree
Binary search tree implementation in Ruby. The class has following methods:
- build_tree(array): Builds a binary search tree from the given array.
- addNode(value): Adds node with the given value to the binary search tree
- print_ldr: Prints the tree using recursive inorder depth first search algorithm.
- bfs(value): Searches for the first occurance of the given value in the tree using breadth first search algorithm and returns that node. Returns nil if the value doesn't exist in the tree.
- dfs(value): Searches for the first occurance of the given value in the tree using iterative depth first search algorithm and returns that node. Returns nil if the value doesn't exist in the tree.