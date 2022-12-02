require 'pry'
require './helpers'

@data = Helpers.get_input_data(year: "2021", day: "3")

def first_part
  positions = []
  12.times { positions << [0,0] }

  @data.each do |input|
    input.chars.each_with_index do |bit, index|
      position = positions[index]
      if bit == "0"
        position[0] += 1
      else
        position[1] += 1
      end
    end
  end

  gama_rate = ""
  epsilon_rate = ""

  positions.each do |position|
    if position[0] > position[1]
      gama_rate += "0"
      epsilon_rate += "1"
    else
      epsilon_rate += "0"
      gama_rate += "1"
    end
  end
  
  puts "### Part 1"
  Helpers.print_answer(gama_rate.to_i(2) * epsilon_rate.to_i(2))
end

def second_part
  

  puts "### Part 2"
  Helpers.print_answer()
end

first_part
# second_part


