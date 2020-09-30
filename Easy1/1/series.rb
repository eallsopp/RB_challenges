=begin
Series
Write a program that will take a string of digits and give 
you all the possible consecutive number series of length n in that string.
For example, the string "01234" has the following 3-digit series:
- 012
- 123
- 234

And the following 4-digit series:
- 0123
- 1234

And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get. #an error

PEDAC
Problem:
Write a program
  - take s string of digits and give all consecutive numbers of length (n) in that string
  
E:xample
'01234' takes 3 digits
  - 012
  - 123
  - 234
'012345' asks for 7 digits
 raise an ArgumentError
 
D:ata Structure
there are several objects:
Input is an argument (n) for the number count of the string

Output is the number of consecutive digits in the string OR an Argument Error

Algorithim: 
Define the 'SEries' Class
  - initialize method
    - takes string as a parameter
    - @series is the instance of the number of digits
      - string object is passed in as the argument, but slices is returning integers
        - modify the instance for integer values
    
  - slices method
    - raises an ARgument Error if n's length is less than the argument passed in
    - passes the consecutive digits into an array if the argument is less than or equal to the length of the string for Series
    - so for (2) as an argument
      begin at the indx of the first object [0] and pass in [0 and 1], then [1 and 2] then [2 and 3] to the output
        the output will stop when the last value passed in is the last index value of the array
      
      upto the size of the array, pass ina block
      the block passes in the number of objects for the argument, into the output then increases by 1 until the final value is the last index number
=end

class Series
  attr_reader :length
  def initialize(string)
    raise ArgumentError unless string.is_a? String
    raise ArgumentError unless string.to_i >= 0
    @length = string.chars.map(&:to_i) #returns an arary of integers
  end
  
  def slices(num)
    raise ArgumentError, 'invalid slice' if num > @length.size #length.size will read the number of objects in the @length Array
    # output = []
    # 0.upto(@length.size - num) do |number|
    #     output << @length[number..(number + num - 1)]
    # end
    # output
    @length.each_cons(num).to_a
  end
end