=begin
Write a program that can generate 
the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.
PEDAC

Problem: test suite dictates the exected outcome of string
write a program that generates the lyrics to 99 bottles of beer


2 main programs, lyrics and verses
VERSES
first arguemnt is the starting verse from 99-0
second is the end verse
if only 1 argument is given, the end is the same verse 99, 99 

how do I get the verses to begin and end at the arguments given?
start verse == num
end verse=num2  (these are inclusive nubers so 2, 0 is the 2, 1, 0)


lyrics are the lyrics to the entire song
0 pertains to No bottles fo beer on the wall, and the final verse restarts the song at 99

otherwise all values are indicative of their #of bottles
 "99 bottles of beer on the wall, 99 bottles of beer.\n" \
      "Take one down and pass it around, 98 bottles of beer on the wall.\n" \...
      would be #{bottles} of beer on the wall...#{bottles}

      take one down... #{bottles-1}
        but this wont work with the last because at 0 it is 'No bottles'

the vereses will be the 
"#{number} bottles of beet on the wall, #{number} bottles of beer\n" \
      "Take one down and pass it around, #{number-1] bottle of beer on the wall.\n" \
      "\n" \
      2 bottles of beer on the wall goes does to...1 bottle <-singuler
      1 bottle of beer on the wall
      
=end
class BeerSong
  SECOND_LAST_VERSE = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
  "Take one down and pass it around, 1 bottle of beer on the wall.\n" \

  BEFORE_LAST_VERSE = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
  "Take it down and pass it around, no more bottles of beer on the wall.\n" \

  LAST_VERSE = "No more bottles of beer on the wall, no more bottles of beer.\n" \
  "Go to the store and buy some more, 99 bottles of beer on the wall.\n" \

def verse(number)
  case number
        when 2 then SECOND_LAST_VERSE
        when 1 then BEFORE_LAST_VERSE
        when 0 then LAST_VERSE
        else
  "#{number.to_s} bottles of beer on the wall, #{number.to_s} bottles of beer.\n" \
  "Take one down and pass it around, #{(number - 1).to_s} bottles of beer on the wall.\n" \

  end
end

  def verses(beginverse, endverse)
    #2 integer values rep different verses in the story
    
    lyrics = ''
    beginverse.downto(endverse).each do |number| 
      case number
        when 2 then lyrics << SECOND_LAST_VERSE + "\n"
        when 1 then lyrics << BEFORE_LAST_VERSE + "\n"
        when 0 then lyrics << LAST_VERSE  + "\n"
      else
        lyrics << verse(number) + "\n"
      end
    end
    
    lyrics.chomp
  end
  
    
  def lyrics #to_s?
    verses(99, 0)
  end
end

puts BeerSong.new.verses(2, 0)