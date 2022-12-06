require 'pry'
require './helpers'

@data = Helpers.get_input_file_data(year: "2022", day: "5")

def input_stacks
  input_stacks = []
  input_stacks << ["F", "R", "W"].reverse
  input_stacks << ["P", "W", "V", "D", "C", "M", "H", "T"].reverse
  input_stacks << ["L", "N", "Z", "M", "P"].reverse
  input_stacks << ["R", "H", "C", "J"].reverse
  input_stacks << ["B", "T", "Q", "H", "G", "P", "C"].reverse
  input_stacks << ["Z", "F", "L", "W", "C", "G"].reverse
  input_stacks << ["C", "G", "J", "Z", "Q", "L", "V", "W"].reverse
  input_stacks << ["C", "V", "T", "W", "F", "R", "N", "P"].reverse
  input_stacks << ["V", "S", "R", "G", "H", "W", "J"].reverse
end

def message(stacks)
  stacks.reduce("") do |solution, stack|
    solution += stack.last
  end
end

def first_part
  stacks = input_stacks

  @data[10..].each do |input|
    move = input.split(" ")

    amount = move[1].to_i
    stack_origin = move[3].to_i
    stack_destiny = move[5].to_i

    moving_crates = stacks[stack_origin - 1].pop(amount)
    stacks[stack_destiny - 1] += moving_crates.reverse
  end

  solution = message(stacks)

  puts '### Part 1'
  Helpers.print_answer(solution)
end

def second_part
  stacks = input_stacks

  @data[10..].each do |input|
    move = input.split(" ")

    amount = move[1].to_i
    stack_origin = move[3].to_i
    stack_destiny = move[5].to_i

    moving_crates = stacks[stack_origin - 1].pop(amount)
    stacks[stack_destiny - 1] += moving_crates
  end

  solution = message(stacks)

  puts '### Part 2'
  Helpers.print_answer(solution)
end

first_part
second_part
