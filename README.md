# Ruby Practice Programs

This is a ruby repo that holds all the programs used for practice for [The Odin Project](https://www.theodinproject.com).  

## Caesar's Cipher

This is a script that encrypts input by using the [Caesar's cipher](https://en.wikipedia.org/wiki/Caesar_cipher). It prompts you for input you want to encrypt and the shift amount and then prints out the encrypted text.  

## Stock Picker

This program finds the maximum difference between two numbers in the array and prints them such that the larger number appears after the smaller number. Think of it like each index represents a day and each element in the array is the price of the stock on a given day. The program should find the largest profit you can make by buying the stock on one day and selling it afterwards.  
This was done in O(n) time complexity and O(1) memory complexity by always keeping track of the current smallest element in the array and checking if the difference of the current element and the smallest element is greater than the maximum difference. If it is, it saves the indexes of those elements.