require 'pry'
require './helpers'

@data = Helpers.get_input_file_data(year: "2022", day: "3")

def first_part
  priority = []
  
  @data.each do |input|
    chars = input.chars
    size = chars.size
    first_compartment = chars[0..(size/2 - 1)]
    second_compartment = chars[(size/2)..size]

    priority += (first_compartment & second_compartment)
  end

  solution = sum_of_priorities(priority)

  puts '### Part 1'
  Helpers.print_answer(solution)
end

def second_part
  priority = []
  
  @data.each_slice(3) do |group|
    first, second, third = group

    priority += (first.chars & second.chars & third.chars)
  end

  solution = sum_of_priorities(priority)

  puts '### Part 2'
  Helpers.print_answer(solution)
end

def sum_of_priorities(priority)
  lowercase_diff = 96 
  uppercase_diff = 38

  priority.sum do |item_code|
    if item_code.ord < 97
      item_code.ord - uppercase_diff
    else
      item_code.ord - lowercase_diff
    end
  end
end

# first_part
second_part
