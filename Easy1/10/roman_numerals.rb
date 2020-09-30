=begin
Roman Numerals

The Romans were a clever bunch. They conquered most of Europe and ruled it for 
hundreds of years. They invented concrete and straight roads and even bikinis. 
One thing they never discovered though was the number zero. This made writing 
and dating extensive histories of their exploits slightly more challenging, but 
the system of numbers they came up with is still in use today. For example the BBC 
uses Roman numerals to date their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these letters
have lots of straight lines and are hence easy to hack into stone tablets).

 1  => I
10  => X
 7  => VII

There is no need to be able to convert numbers larger than about 3000. (The Romans 
themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each digit 
separately starting with the left most digit and skipping any digit with a 
value of zero.

To see this in practice, consider the example of 1990. In Roman numerals 1990 is MCMXC:

1000=M
900=CM
90=XC

2008 is written as MMVIII:

2000=MM
8=VIII

PEDAC
create a class tat converts the integer given, to the string equivilent

E:xample:
3 is 'III'
4 is 'IV'

Data: input an integer output a string that is the equivilant value

ALGO:
0 doesn't count
Edge CAses
all numbers prior to  one value below a multiple of 5
I is 1
V is 5
X is 10
L is 50
C is 100
D is 500
M is 1000

OUTLIERS
IV is 4
IX is 9
XIX is 19
IL is 49
XL is 40
IC is 99

CD is 400
CM is 900

Consider the start:
the ones)
convert the ones
multiplier and a numeral = number.divmod(value) 2 variables which will indicate the multiplier
and the value, then number.divmod(value)

takes the whole number and returns the multiple (times divided, and remainder) fora  given
value

there is a number that neesd to be established as a component to the numeral

take the number, deconstruct it to values with .digits?
3 is [3]
1324 is [4, 2, 3, 1]

the last digit is the highest value
how do you get ones 8 -VIII? 8.divmod (5)'V' +... 1, 3  3.divmod(1) III
ones 4 IV
tens 2 XX 
hundreds 3 CCC
thousands 1 .... M

=end

class Integer
  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }
#the only ones we have multipels of are i, x, c, 

def to_roman
  result = ''
  number = self
    ROMAN_NUMERALS.each do |key, value|
      numeral, remainder = number.divmod(value)
      if numeral > 0 
        result += (key * numeral)
      end
      number = remainder
     end
    result
  end
end

