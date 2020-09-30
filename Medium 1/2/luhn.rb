=begin
The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, 

Problem:
The formula verifies a number against its included check digit, which is usually appended to a 
partial number to generate the full number. This number must pass the following test:

Logic:
    Counting from rightmost digit (which is the check digit) and moving left, double the value of
    every second digit.
    
    
    For any digits that thus become 10 or more, subtract 9 from the result.
        1111 becomes 2121.
        8763 becomes 7733 (from 2×6=12 → 12-9=3 and 2×8=16 → 16-9=7).
        
    Add all these digits together.
        1111 becomes 2121 sums as 2+1+2+1 to give a checksum of 6.
        8763 becomes 7733, and 7+7+3+3 is 20.
        
checksum is the validation number
if checksum % 10 is 0 it is valid, otherwise it is not

If the total (the checksum) ends in 0 (put another way, if the total modulo 10 is congruent to 0), 
then the number is valid according to the Luhn formula; else it is not valid. So, 1111 is not valid (as 
shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).

LOGIC:
    Can check if it is valid per the Luhn formula. This should treat, for example, "2323 2005 7766 3554" 
    as valid.
    Can return the checksum, or the remainder from using the Luhn method.
    Can add a check digit to make the number valid per the Luhn formula and return 
    the original number plus that digit. This should give "2323 2005 7766 3554" in response 
    to "2323 2005 7766 355".

Problem: assert the checksum digit of a number given.
from the rightmost digit begin.
double every 2nd digit
if that value becomes 10 or greater, subtract 9 exp: 9.. doubled is 18 - 9 = 9

the checksum is the sum of all those values

if the total ends in 10, num % 10 is 0, it is valid

2323 2005 7766 3554 % 10 == 0

Write a program that, given a number

    Can check if it is valid per the Luhn formula. 
    This should treat, for example, "2323 2005 7766 3554" as valid.
    Can return the checksum, or the remainder from using 
    the Luhn method.
    Can add a check digit to make the number valid per the 
    Luhn formula and return the original number plus that digit. 
    This should give "2323 2005 7766 3554" in response to 
    "2323 2005 7766 355".


=end

puts [4, 1, 5, 6, 6, 3, 7, 5, 5, 0, 0, 4, 3, 4, 3, 4].reduce(&:+)

class Luhn
  
  attr_accessor :number
  def initialize(number)
    @number = number
  end
  
  def addends #returning array of digits
    self.number = number.digits

    number.map.with_index do |number, idx|
      if idx.odd?
        product = number * 2 
          if product > 9
            product -= 9
          end
        product
      else
        number
      end
    end.reverse
  end
  
  def checksum #returning Integer
    addends.reduce(:+)
  end

  def valid? #reutnring true or false
    checksum % 10 == 0
  end
  
  def self.create(number) #reutrning integer which adds a number on end to turn number into a valid number
    new_base_number = number * 10
    
    if new(new_base_number).valid? #validates the given number?
      new_base_number
    else
      remainder = new(new_base_number).checksum % 10
      new_base_number + (10 - remainder)
    end
    
  end
end
