=begin
Secret Handshake

Write a program that will take a decimal number, and convert it to the appropriate 
sequence of events for a secret handshake.

There are 10 types of people in the world: Those who understand binary, and those 
who don't. You and your fellow cohort of those in the "know" when it comes to 
binary decide to come up with a secret "handshake".

1 = wink (1)
10 = double blink (2)
100 = close your eyes (4)
1000 = jump (8)

10000 = Reverse the order of the operations in the secret handshake. (16)

handshake = SecretHandshake.new 9
handshake.commands # => ["wink","jump"]

andnthen command what they do

handshake = SecretHandshake.new "11001"
handshake.commands # => ["jump","wink"]

reverse that if it is over 10000

The program should consider strings specifying an invalid binary as 
the value 0.

Binaray is 9*10^0 = 9
PEDAC: 
Binary is a representation of the number as (Digitin tens * 2^1)+ (digit in ones * 2^0)
Take a number that is given and convert it to the given assignments, to the lowest
available options... 6 would be 110, 100 + 10 so [close your eyes, double blink]
7 would be 111...100 + 10 +1 which is close your eyes, doulbe blink wink

Input is an integer,
output is an array of strings rep
dissect the number into a binary representation

Algorithim:
Convert the numearl into an array of binary digits
5 needs to convert to [1, 0, 1]


Working backwrads from an array of binary digits.... [1,0,1]
The basic mathi is ___ * 2^(array.size-1) + ___ * 2^(array.size-2)
array.size is the size of the array of binary digits [1,0,1] would be 3
the numerals for -1, -2... are counters


input
- take a decimal number
- take a string

validation:
- the program shoud consider stings specificying an invalid binary as value 0

logic:
and convert it to the appropriate sequence of events for a secret handshake

1 = wink
10 = double blink
100 = close your eyes
1000 = jump

10000 = reverse the order of the operations in the secret handshake

model the problem:
convert teh decimal into a binary string, and into a dequence of commands
  - "0111", -> reverse the string -> '1110' -> ["wink',  "double blink", "close your eyes"]
      
      reverse, no jump, close your eyes, double blink, wink
      
  if the first digit is 1, then reverse

Data structure
["wink', 'double blink', 'close your eyes', 'jump']


Edge Cases: 
if the number exceeds 32 as input, should I throw an exception or take the last 5 digits?
any string character that is not '0' or '1' return decimal 0

=end

class SecretHandshake
  
  MOVEMENTS = ['wink', 'double blink', 'close your eyes', 'jump'].freeze
    
    attr_accessor :number
  def initialize(number)
    @number = number
  end
  
  def commands 
    self.number = number.is_a?(Integer) ? number.to_s(2).reverse : validate.reverse # reassign @number via self, to a 
    #base 2 number string if it already is an Integer, or validate if it is not an integer
   
    handshake = MOVEMENTS.select.with_index do |_, idx|
      number[idx] == '1'
    end
    #is number bigger than 4?  if so reverse the returned array
    number.size > 4 ? handshake.reverse : handshake
  end
  
  def validate #is the input number a binary string already, or is it not, allow it to pass through ad return an empty array
    number.each_char { |char| return '0' unless ('0'...2.to_s).cover?(char) } #is the char a '0' or a '1'? if not return '0' for that char, then that string is returned to be self.number
  end
end

SecretHandshake.new(1).commands



  
  
  
  
