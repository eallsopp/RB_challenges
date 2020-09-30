=begin
Anagrams

Write a program that, given a word and a list of possible anagrams, selects the correct 
sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists" "google" 
"inlets" "banana" the program should return a list containing 
"inlets". Please read the test suite for exact rules of anagrams.

PEDAC take an array of words that could be capital or othewise and
compare that to another single word
determine which word or words inthe array is an anagram of the given word
retun that in an array
capitalize the returned wor if the gigven word is capitalized

otherwise don't e concerned about capitalization

Example 
given word 'racecar'
array given %w('racecar', 'race', 'racecars')
return ['racecar']

D:ata input a string and an array of strings
output an array

A:logo
Need constants to determine if the first letter is CAPITALIZED or not

get the length of the given word
  - i can eliminate words in the array that are not the same length
brek the given word apart into an array of letters
   - do the same with the remaining words and determine if they contain those same letters
   
   if they are the same then pass the word that is the same as the given into an array
   return that array
   
   the same word cannot be the anagram
   capitalized version cannot be either
   capitalization does not matter
   
   array passed in the select and return the true value for anothe rmethod I creare
   all i should do is break it aprart into a simple array of sorted letters

=end


class Anagram
  
  attr_accessor :word
  def initialize(word)
    @keyword = word.downcase
  end

  def match(array)
    array.select { |word| compare(word) }
  end
  
  def compare(word)
    @keyword != word.downcase &&
    @keyword.chars.sort == word.downcase.chars.sort
  end

end
