=begin
Sieve of Eratosthenes
Write a program that uses the Sieve of Eratosthenes to find all the primes 
from 2 up to a given number.

The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime 
numbers up to any given limit. It does so by iteratively marking as composite 
(i.e. not prime) the multiples of each prime, starting with the multiples of 2.

Create your range, starting at two and continuing up to and including the given limit. 
(i.e. [2, limit]).

The algorithm consists of repeating the following over and over:

    take the next available unmarked number in your list (it is prime)
    mark all the multiples of that number (they are not prime)

Repeat until you have processed each number in your range. When the algorithm terminates, 
all the numbers in the list that have not been marked are prime. The wikipedia article has 
a useful graphic that explains the algorithm.

Notice that this is a very specific algorithm, and the tests don't check that you've 
implemented the algorithm, only that you've come up with the correct list of primes.

Problem: 
Get the primes from 2 to a limit
Use the Sieve of Eratosthenes
  - marks all multiples of non-prime numbers upon the instance of the first primt
  
  Example 2..14
  2 3 are prime
  4 is marked as not prime, along with multples of 4, in this case 8, 12
  5 is prime
  6 is marked as not prime
  7 is prime
  8 is skipped since it is already marked
  9 is marked etc...
  
  Input is an array of numbers
  output is an array of prime numbers by removing 'marked' numbers
  
  Algo
  create a class called Sieve
  initialize method
    take an argument
    instance is equal to an array of numbers from 2 until the argument
  
  primes method
    MARK all multiples of the number if it is not prime
      mark_number if number % 2 == 0 unless the number is 2
      all numbers that are marked must be iterated thoguh 2, 3, 4, 5, 6, 7 ,8 to find the multiples
      until the last number in the range / the number given is hit you must loop 2,3, 4 etc...
      
    return the unmarked numbers, which are prime
     - if numbers in the array contain numbers in the amrked numbers array, omit those numbers
    
=end

class Sieve
  attr_reader :numbers
  def initialize(num)
    raise ArgumentError if num < 2
    @numbers = (2..num).to_a
  end
  
  def primes
    numbers.each do |prime|
      numbers.reject! { |num| num != prime && num % prime == 0 }
    end
  end
  
  # def primes
  #   marked = []
  #   all_numbers = @numbers.clone
    
  #   all_numbers.each do |vals|
  #     (vals + 1 ..@numbers[-1]).each do |another_number|
  #       marked << another_number if another_number % vals == 0
  #     end
  #   end
  #   all_numbers - marked
  # end
end


test = Sieve.new(10)
p test.primes