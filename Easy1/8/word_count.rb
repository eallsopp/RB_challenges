=begin
Write a program that given a phrase can count the occurrences of each word in that phrase.

For example, if we count the words for the input "olly olly in come free", we should get:


olly: 2
in: 1
come: 1
free: 1

PEDAC
Probelm: take a string and count the instances of the words in the string
return teh values as a hash

omit non-letter characters if they are not an apostrophe
omit capitalization from the counts

the reutnr is the hash[word] += 1

Example phrase is 'honey I'm home for honey'
return is { 'honey' => 2, 'I'm' => 1, 'home' => 1, 'for' => 1 }

D:Ata input a strin
output is a hash with strings as keys (from the original string) and values as numeral

A:lgo
  omit non - characters and non- ' from the string if the '' are not at index first, last 
  
  extract to since words using .split
  
  hash = {}
  array.each {|word| hash[word] += 1}
  
  all hash words are downcased

=end

class Phrase 
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    count = Hash.new(0)
    @phrase.scan(/\b[A-Za-z0-9']+\b/) do |word|
      count[word.downcase] += 1
    end
    
    count
  end
end

word = Phrase.new("this is the phrase don't $!@! it up")
p word.word_count