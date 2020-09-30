=begin

input is first normalized: The spaces and punctuation are removed from the 
English text and the message is down-cased.

Then, the normalized characters are broken into rows. These rows can be 
regarded as 
forming a rectangle when printed with intervening newlines.

The size of the square (number of columns) should be decided by the 
length of the message. If the message is a length that creates a perfect 
square (e.g. 4, 9, 16, 25, 36, etc), use that number of columns. If the 
message doesn't fit neatly into a square, choose the number of columns 
that corresponds to the smallest square that is larger than the number 
of characters in the message.

For example, a message 4 characters long should use a 2 x 2 square.
A message that is 81 characters long would use a square that is 9 
columns wide. A message between 5 and 8 characters long should use a 
rectangle 3 characters wide.

Output the encoded text grouped by column.

All code is instantiaed objet ith instance variable
methods:
normalize_plaintext: this removes whitespace, lowercases and removed punctuation
use regex t remove all the stuff
gsub all instances of \A[a-zA-Z0-9]

size
size is equal to the size of the square... so 4 is 2x2, 9 is 3x3
in ebtween is the larger of the squares
case statement for sting.size / 2
take the size of the string and divmod it by perfect squares...4, 9, 16, 25, 36, 49, 64


plaintext_segments
turn the string into the segment without confusing it
returns an array of strings that is the length of the size of the lines
from size...
so if it is size 2, strign lengths are 2
so if size is 3, string length are 3
4 etc... untl the string is done

  'thisisastring' 13 is length, square is 4
  
  
  returns
  'this' 'isas' 'trin' 'g'

ciphertext
all of the index values of the plaintext segments, smutshed to
returns a string, into a cipher
from 'this is is a string' which is 

['this'. 'isas'. 'trin'. 'g'].....
returns
'titghsriaissn'


how do i tolerate the string that is not the same length?/cant use index value
 I can add spaces to the strings that don't have the ssame number...iterate 
 across those words since they are even, using the inde value and then

pop? shift?

iterate over the array of arrays


normalize_ciphertext
placing a space between each word that is established from ciphertect, at each 4, then 
remoev the space at the end by iteration
=end

class Crypto
  SQUARES = [4, 9, 16, 25, 36, 49, 64, 81, 100, 121]
  
  attr_accessor :string, :string_array
  
  def initialize(string)
    @string = string.downcase
  end
  
  def normalize_plaintext
    string.gsub!(/[^a-z0-9]/, '')
  end

  def size
    normalize_plaintext
    
    (1..string.size).each do |num|
      return num if num**2 >= string.size
    end
  end
  
  def plaintext_segments
    string_length = size
    string_array = []
    word = ''

    string.chars do |letter|
        if word.length == string_length
          string_array << word
          word = ''
        end
        word << letter
      end
      
    string_array << word
    string_array
  end
  
  def ciphertext
    ciphertext = ''

    (0...size).each do |i|
      equalize_strings.each do |word|
        ciphertext << word[i] unless word[i].nil?
      end
    end
    ciphertext.gsub(/[ ]/, '')
  end
  
  def normalize_ciphertext
    cipher = []
    complete_cipher = []
    cipher_length, remainder = ciphertext.size.divmod(size)
    
    if remainder > 0 
      cipher_length += 1
    end
    
    0.upto(ciphertext.size - 1) do |number|
      cipher << ciphertext[number]
      
      if cipher.length == cipher_length
        complete_cipher << cipher
        cipher = []
      end
    end
    
    complete_cipher.map(&:join).join(' ')
  end
  
  def equalize_strings
    array = plaintext_segments
      until array[-1].length == array[0].length
      array[-1] += ' '
      end
    array
  end
end

   crypto = Crypto.new(
      'If man was meant to stay on the ground god would have given us roots',
    )
    p crypto.ciphertext.size
    p crypto.size
