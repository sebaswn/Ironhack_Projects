#######FIX BUZZ PRO!!!!######
# Use Lambdas and Procs for #
# the conditions used to    #
# solve fiz buzz problem    #
# Also with Jazz			      #
#############################


class FizzBuzz
  
  def initialize(conditions, lambda)
    @conditions = conditions
    @lambda = lambda
  end
  
  def run
    1.upto(100) do |i|
      print_number(i)
    end
  end
  
  def print_number(number)
    result = ""

    @conditions.each do |condition, string|
      condition_result = @lambda.call(number, condition, string)
      if condition_result
        result += condition_result
      end
    end
    
    if result == ""
      puts number
    else
      puts result
    end
  end
end

lambda = ->(i, condition, string) do
  if i % condition == 0
    return string
  end
end

conditions = {
  3 => "Fizz",
  5 => "Buzz",
  7 => "Jazz",
  2 => "Kizz"
}

FizzBuzz.new(conditions, lambda).run