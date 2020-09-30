=begin
set of charaters
letters, spaces and a pointa t the end
words are 1 or more letters, no more than 20
separated by spaces (1 or more)
input reads from the first letter of the first word throug the point
outpu text has single spaces between words and ends with a point
odd words are copied in reverse order and evens are not

Bonus points are awarded for single letters printed 1 at a time

PEDAC
Problem: take a string that has words in it, and they could have more than 1 space between words, it ends with a .
don't count the .

Example 'I have nests of yellow  hornets.'
Return expected I have stsen of yellow stenroh.

Input a string of words separated by spaces, could be more than 1 space
Output a string of words with has the words contains odd number of letters reversed

ALGO:
Create an array of words, if there are additional spaced, I will have to use split on each of the words
.map on words

the take that array and iterate over it to see if the word is odd... if so, reverse
.select on array



=end

class OddWords
  attr_reader :string
  def initialize(string)
    @string = string
  end
  
  def odd_word
    define_odd.join(' ') + '.'
  end
  
  def create_array
    string.split(' ').map {|word| word.strip.delete('.')}
  end
  
  def define_odd
    create_array.each {|word| 
    word.reverse! if word.length.odd? }
  end
    
  def to_s
    result = ''
    array = odd_word.split('')
    
    (0...array.size).each do |idx|
      result += array[idx]
      puts result
    end
    result
  end
end

test = OddWords.new('I    have nests of    yellow  hornets.')
p test.to_s