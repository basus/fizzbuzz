#!/usr/bin/python

# Write a program that prints the numbers from 1 to 100. But for multiples of
# three print "Fizz" instead of the number and for the multiples of five print
# "Buzz". For numbers which are multiples of both three and five print "FizzBuzz"

for x in range (101):
    if x % 15 == 0:
        print "FizzBUzz"
    elif x % 3 == 0:
        print "Fizz"
    elif x % 5 == 0:
        print "Buzz"
    else:
        print x
        
