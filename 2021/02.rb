require 'pry'
require './helpers'

@data = Helpers.get_input_data(year: "2021", day: "2")

def first_part
  position = 0
  depth = 0

  @data.each do |input|
    direction, movement = input.split(" ")
    movement = movement.to_i

    if direction == "forward"
      position += movement
    else
      if direction == "down"
        depth += movement
      else
        depth -= movement
      end
    end
  end

  puts "### Part 1"
  Helpers.print_answer(position * depth)
end

def second_part
  position = 0
  depth = 0
  aim = 0

  @data.each do |input|
    direction, movement = input.split(" ")
    movement = movement.to_i

    if direction == "forward"
      position += movement
      depth += aim * movement
    else
      if direction == "down"
        aim += movement
      else
        aim -= movement
      end
    end
  end

  puts "### Part 2"
  Helpers.print_answer(position * depth)
end

# first_part
second_part


