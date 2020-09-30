=begin
Trinary

Write a program that will convert a trinary number, represented as a string 
(e.g. '102012'), to its decimal equivalent using first principles (without 
an existing method or library that can work with numeral systems).

Trinary numbers can only contain three symbols: 0, 1, and 2. Invalid 
trinary entries should convert to decimal number 0.

The last place in a trinary number is the 1's place. The second to last is the 3's 
, the third to last is the 9's place, etc.

=end

class Trinary
  BASE = 3
  INVALID = /\D|[3-9]/
  
  attr_reader :tri_string
  
  def initialize(tri_string)
    @tri_string = tri_string
  end
  
  def to_decimal
    tri_string =~ INVALID ? 0 : calculate
  end
  
  private
  
  def calculate
    number = @tri_string.chars.map(&:to_i)
    exponent = number.size
      
      number.each_with_index.map do |num, idx|
      num * BASE**(exponent - idx - 1) end.reduce(:+)
    
  end
end
