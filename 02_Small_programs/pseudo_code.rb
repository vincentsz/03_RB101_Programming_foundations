Example - Pseudo code

Given a collection of integers

Iterate through the collection one by one
  - save the first value as starting value
  - for each iteration, compare the saved value with the current value
  - if the saved value is greater, or it's the same
    -move to the next value in the collection
  - otherwise, if the current value is greater  
    -reassign the saved value as the current value

After iterating through the collection, return the saved value

Example - Formal Pseudo code

START

# Given a collection of integers called "numbers"

SET iterator = 1
SET saved_number = value within numbers collection at space 1

WHILE iterator <= length of numbers
  SET current_number = value within numbers collection at space "iterator"
  IF saved_number >= current_number
    go to the next iteration
  ELSE
    saved_number = current_number
  iterator = iterator + 1

PRINT saved_number

END

Exercise 1 - Pseudo code

Ask a first number from the user
  - assign it to a variable 
Ask a second number from the user
  - assign it to a variable 

Add the two variables together

Output the result

Exercise 1 - Formal pseudo code

START

GET variable1 from user
  -SET variable1
GET variable2 from user
  -SET variable2

Add variable1 and variable2 

SET result of sum

PRINT result

END

Exercise 2 - Pseudo code

An array of strings is given

Create an empty variable

Iterate through the collection one by one
For each value, concatenate it to the empty variable

After iterating through the collection, return the concatenated variable

Exercise 2 - Formal pseudo code

START

#an array of strings is given

SET concatenated_variable = ''
SET iterator = 1

WHILE iterator <= length of given array
  SET concatenated_variable = concatenated variable + current word
  iterator = iterator + 1

PRINT the variable

END

Exercise 3 - Pseudo code

An array of integers is given

Create an empty array

Iterate through the collection one by one
  -if the index is 0 or even, assign it to the empty array

After iterating through the collection, return the new array

Exercise 3 - Formal pseudo code


START

#an array of strings is given

SET iterator = 1
SET new_array = []

WHILE iterator <= number of items in given array
  IF index is even
   SET value to empty array

iterator = iterator + 1

PRINT new_array

END