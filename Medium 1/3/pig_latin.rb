=begin
    Rule 1: If a word begins with a vowel sound, 
    add an "ay" sound to the end of the word.
    Rule 2: If a word begins with a consonant sound, 
    move it to the end of the word, and then add an "ay" 
    sound to the end of the word.

considerations
multiple consonents ahead of vowel eltter?
  all consonenty go to end + 'ay'
  

treat phrase?
string.split ('')
dize > 1 ? run another method : run method

input is a string
output is a string concatnated wih 'ay'

ALGO:
when is the first vowel of a given string?

  - determine this, and start range with that index letter
    - end range at the last letter
    - return that range + the 0..range + 'ay'

  -  if q preceds a u... q and u are taken
    unless index+1 == u wth q
  
edge cases
x and y...
when either precede a consonent, treat like a vowel
when either precede a vowel, treat as a consonent

if it starts with qu like quack, they turn to ackquay

#I need each character to pass into a regex key
if it matches then the index .. -1 + the amtch + 'ay'


=end

class PigLatin
  
  def self.translate(string)
    self.phrase(string) > 1 ? self.multi_word(string) : self.special_cases?(string)
  end
  
  def self.phrase(string)
    string.split.size
  end
  
  def self.special_cases?(string)
    string.match(/x[^aeiou]|y[^aeiou]/) || string.match(/qu/) ? 
    self.cases(string) : self.single_word(string)
  end
  
  def self.cases(string)
    string.match(/qu/) ? self.word_with_q(string) : self.x_y(string)
  end
  
  def self.x_y(string)
    string + 'ay'
  end
  
  def self.single_word(string)
    append = ''
    idx = 0
      until string[idx].match(/[aeiou]/)
        append << string[idx]
        idx += 1
      end
      
    string[idx..-1] + append + 'ay'
  end
  
  def self.word_with_q(string)
    append = ''
    idx = 0
    until append.match(/qu/)
      append << string[idx]
      idx += 1
    end
    
    string[idx..-1] + append + 'ay'
  end
    
  def self.multi_word(string)
    string.split.map do |word|
      PigLatin.translate(word)
    end.join(' ')
  end
end


