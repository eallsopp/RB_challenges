=begin
Scrabble Score
Write a program that, given a word, computes the scrabble score for that word.
Letter Values

You'll need these:
Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10

Examples
"cabbage" should be scored as worth 14 points:

    3 points for C
    1 point for A, twice
    3 points for B, twice
    2 points for G
    1 point for E
And to total:

    3 + 2*1 + 2*3 + 2 + 1
    = 3 + 2 + 6 + 3
    = 5 + 9
    = 14
    PEdAC: take a string that will convert to an integer, each letter is a certain value, add all the values together
    
    Example 'grape'
    2 + 1 + 1 + 3 + 1
    Input isa string
    output is an integer (data structure could be an array or a hash (I will use a  hash ))
    
    ALGO:
    the word 'grape'
    each letter needs to be given its associated key when the value fo the letter is found inside the value
      iterate over the array of single characters
      if the array (hash_value) contains the letter given, return the key
      
    
    that key (integer value) could be placed in a new hash or an array
      into an array
    then whenc ompleted, it can then take the sum of all hash values and the number of times and multiply the keys by the hash values
    
    create a hash made of the keys as keys for the SCORES hash
    
    EDGE CAses values of the argument must be a string of a length al leas = 1
    cannot be nil, canno be an empty string, cannot be a blank space
      USE rEGEX for only [a-z downcase all the letters]
=end

SCORES = {1 => %w(a, e, i, o, u, l, n, r, s, t), 2 => %w(d, g), 3 => %w(b, c, m, p),
          4 => %w(f, h, v, w, y), 5 => %w(k), 8 => %w(j, x), 10 => %w(q, z) }
          
class Scrabble
  
  attr_reader :word
  def initialize(word)
    @word = word
  end
  
  def score
    return 0 unless word.is_a?(String) && word.strip.length >= 1
 
    score = 0
    
    #string is given as the argument to
    word.downcase.chars.each do |letter| 
      SCORES.each do |key, value| 
        value.each do |array| 
          array.include?(letter) ? score += key : next
      end
    end
    end
    score
  end
  
  def self.score(word)
    new(word).score
  end

end
start = Time.now

puts Scrabble.new('test').score
finish = Time.now

puts finish - start


