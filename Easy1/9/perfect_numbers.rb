
=begin
Perfect Number

The Greek mathematician Nicomachus devised a classification scheme for 
natural numbers, identifying each as belonging uniquely to the categories of 
abundant, perfect, or deficient. A perfect number equals the sum of its positive 
divisors — the pairs of numbers whose product yields the target number, excluding 
the number itself. This sum is known as the Aliquot sum.

    Perfect: Sum of factors = number
    Abundant: Sum of factors > number
    Deficient: Sum of factors < number

Examples:

    6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
    28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
    Prime numbers 7, 13, etc are deficient by the Nicomachus classification.

Write a program that can tell if a number is perfect, abundant or deficient.
extrat the divisors that have whole values .divmod

PEDAC 
Problem: 
retunrs a string of 'deficient' 'perfect' or 'abundent'
based on the sum of a number's factors

find the multples of the numbers in an array
find the sum of that array
return the strings if the su is perfect (equal to the number given
abundent (greater thant he number given))
or deficient (less than the number given)

iterate through all numbers that lead up to but not including the number given
for i in 1...number do |num|
divisors = []



=end


class PerfectNumber
  
def self.classify(number)
  raise StandardError if number < 0
  divisors = []
  
  for i in 1...number do
    divisors << i if number % i == 0
  end
    
  case 
  when divisors.inject(:+) < number then 'deficient'
  when divisors.inject(:+) == number then 'perfect'
  when divisors.inject(:+) > number then 'abundant'
  end
end
  
end