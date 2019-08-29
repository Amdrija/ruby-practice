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