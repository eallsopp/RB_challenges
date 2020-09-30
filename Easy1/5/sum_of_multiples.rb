=begin
Sum of Multiples

Write a program that, given a number, can find the sum of all the multiples of 
particular numbers up to but not including that number.

If we list all the natural numbers up to but not including 20 that are multiples of 
either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

Write a program that can find the sum of the multiples of a given set of numbers. 
If no set of numbers is given, default to 3 and 5.

sum of the multiples of a given set of numbers
PEDAC
P program gets a number and returns the sum of all numbers that are multiples
of a given ...up to  but not including that number. 
If no numbers are given default to 3 and 5

Q's for a number like 18 given, 15 is a multiple of 3 and 5, would I could them independently?
i.e. 15 is counted twice?

Example given a number 18, retrn the sum of all the numbers up to 18 that are 
multiple of 3 and 5

D:ata
give a number 18
need an array of values for 3 and 5 as the multiples of those numbers
inputs are 18, [3, 5]
output would be 3: [3, 6, 9, 12, 15]
5: [5, 10, 15]
return is 3, 6, 9, 12, 15(sum + 5 10 15 sum = 45 + 35 = 80

ALGO:
starting at 1 up to but not including 18
iterate through the numbers
check if the number is a multiple of 3 or 5...or a given set of numbers
if it is add those values together
return the sum at the end

to:(given_number)
  
  iterate through the numer given 1 to the nuber -1
  pass it into a block
      iterate throughthe array of multiples using .each
    if those numbers are given_number % num == 0
    
    num in thise case is the multiple
    number % multiple == 0
    or number % other_multiple == 0 
    or number % other_other_multiple == 0 etc.. etc...
      multiples[0] 
      multiples[1]
      multiples[2] etc...
      
    pass the num into an array
    once all iterations are complete


find_multiples:




class SumOfMultiples
  attr_reader :multiples, :number
  
  def initialize(*multiples)
    @multiples = multiples
    @multiples = [3, 5] if multiples.empty?
  end
  
  def self.to(number) #the fault here is it assumes no class variable...can a Class hold variables for the multiples?
    return 0 if number < 4 # I suppose I could pass in @@multiples value if so.
    sum = 0

    1.upto(number - 1) do |num|
      case
        when num % 3 == 0 then sum += num
        when num % 5 == 0 then sum += num
      end
    end
    sum
  end
  
  def to(number)
    return 0 if number < 4
    sum = 0

    1.upto(number - 1) do |num|
    sum += find_multiples(num)
    end
    sum
  end
  
  def find_multiples(num)
    value = 0
    @multiples.each do |multiple|
      value = num if num % multiple == 0
    end
    value
  end
end




I can also 
select the varieblaes that are the result of a block in select (returning an array)
  within that I can check the values of the vlock
    number passes in 
    do multiples.any? retrn 0
      return 0 block is { |val| (num % val).zero? }
      
  ultimately, i want to return an integer from an array and a value
  the value is the exclusive end of the numbers it is looking at
  the array contains the multiples, up to that number, that I want to add togther
  
  I need validate that the array contains values, otherwise it is [3, 5]
  
  I need to check every value up to the number given, to see if it is a mutiple
  of anyof the items in the array
  
  I need to return the final sum of all of those multiples
    - add all the vlues together that have been returned as multiples of the given numbers
      .reduce(:+)
      I can yse a block to get there that checks the number given % multiple = 0
      { |mult| val % mult == 0 }.reduce(:+)
      
      That given value needs to come from an exclusive range of numbers, or upto number- 1
        1...number.each/select/map
        or
        
        def to(number)
        1.upto(number - 1) {|val| multiples.any? {|mult| val % mult == 0 }.reduce(:+)
        reutns an integer for upto
        so i could pass it into an array... for each of the values or I could
        retun an array utliize the explicit range (1...number).select
      end
      
      need class method and need to initializethe objects
      
      class  method could call self.to(number)
        then instantialize a new object for the call
        SumOfMultiples.new.to(number)
      
=end
class SumOfMultiples
  attr_reader :multiples
  
  def initialize(*multiples)
    @multiples = multiples
    @multiples = [3, 5] if multiples.empty?
  end
  
  def to(number)
    return 0 if number < 4
    (1...number).select {|val| multiples.any? {|mult| (val % mult) == 0 }}.reduce(:+)
  end

  def self.to(number)
    SumOfMultiples.new.to(number)
  end
end
