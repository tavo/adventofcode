require 'pry'
require '../helpers'

@depth_measurements = Helpers.get_input_data(year: "2021", day: "1")

def first_part
  previous_depth = nil
  increased_count = 0

  @depth_measurements.each do |depth|
    if previous_depth && depth.to_i > previous_depth
      increased_count += 1
    end
    previous_depth = depth.to_i
  end

  puts "### Part 1"
  Helpers.print_answer(increased_count)
end

def second_part
  increased_count = 0
  previous_sum = nil

  @depth_measurements.each_with_index do |depth, index|
    if index >= 2
      current_sum = @depth_measurements[(index - 2)..index].map(&:to_i).sum
      if previous_sum && current_sum > previous_sum
        increased_count += 1
      end
      previous_sum = current_sum
    end
  end

  puts "### Part 2"
  Helpers.print_answer(increased_count)
end

first_part
# second_part


