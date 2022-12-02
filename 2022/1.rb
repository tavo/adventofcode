require 'pry'
require './helpers'

@data = Helpers.get_input_file_data(year: "2022", day: "1")

def first_part
  most_calories = 0
  current_calories = 0

  @data.each do |calories|
    if calories != ""
      current_calories += calories.to_i
    else
      if current_calories > most_calories
        most_calories = current_calories
      end
      current_calories = 0
    end
  end

  puts '### Part 1'
  Helpers.print_answer(most_calories)
end

def second_part
  top_3 = [0, 0, 0]
  current_calories = 0

  @data.each do |calories|
    if calories != ""
      current_calories += calories.to_i
    else
      temp = top_3 + [current_calories]
      top_3 = temp.sort.reverse[0..2]
      
      current_calories = 0
    end
  end

  puts '### Part 2'
  Helpers.print_answer(top_3.sum)
end

first_part
second_part
