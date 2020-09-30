=begin
Phone Number

Write a program that cleans up user-entered phone numbers so that they can be 
sent as SMS messages.

The rules are as follows:
If the phone number is less than 10 digits assume that it is bad number
  If the phone number is 10 digits assume that it is good
  If the phone number is 11 digits and the first number is 1, trim the 1 
  and use the last 10 digits
  If the phone number is 11 digits and the first number is not 1, 
  then it is a bad number
  If the phone number is more than 11 digits assume that it is a bad number

Problem:
create a program that takes a steing of numbers and determines its validity
the number must be 10 digits to be valid
if there are 11 digits and the first is 1, chop the 1st digit '1'
in order to validate the area code etc...


METHODS ARE:
validate first
if there is anything other than 0-9and ( ) - ' ' ., anything outside that
then its invalid

validate by omitting all special non digit characeters.
it needs to be 10 or 11, if 11 the first needs to be 1


when you confirm those, and strip it down to just #'s its
invalid if its size if > 11...or if its 11 and the first isn't a '1'

if the number is less than 10 or more than 11, or 11 with a # other than 1 as first, 
it is invalid, return 0000000000 (@number = 000000000)

area_code

number_to_s
converts it to (111) 111-3333

=end

class PhoneNumber
  ALPHABET = ('a'..'z').to_a
  attr_accessor :phone_number
  
  def initialize(phone_number)
    @phone_number = phone_number
  end
  
  def clean_number
    phone_number.gsub!(/[()-\. a-zA-Z]?/, '')
  end
  
  def number
    case
    when phone_number.include?('a') then invalid_number
    when clean_number.size == 11 && clean_number[0] == '1'
      then phone_number.slice(1..-1)
    when clean_number.size == 10 then clean_number
    else
      invalid_number
    end
  end
  
  def area_code
    clean_number
    phone_number[0..2]
  end
  
  def invalid_number
    '0000000000'
  end
  
  def to_s
    '(' + number[0..2] + ')' + ' ' + number[3..5] + '-' + number[6..9]
  end
end

number = PhoneNumber.new('1a2a3a4a5a6a7a8a9a0a')
puts number.phone_number

puts number.clean_number

