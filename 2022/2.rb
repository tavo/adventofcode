require 'pry'
require './helpers'

@data = Helpers.get_input_file_data(year: "2022", day: "2")

def first_part
  plays_to_win = {
    "A" => "Z",
    "B" => "X",
    "C" => "Y",
    "X" => "C",
    "Y" => "A",
    "Z" => "B"
  }

  points = {
    "X" => 1,
    "Y" => 2,
    "Z" => 3,
  }
  total_score = 0

  @data.each do |input|
    opponent, me = input.split(" ")

    if plays_to_win[me] == opponent
      total_score += 6
    elsif plays_to_win[opponent] != me
      total_score += 3
    end

    total_score += points[me]
  end

  puts '### Part 1'
  Helpers.print_answer(total_score)
end

def second_part
  # X = loss, Y = draw, Z = win

  win = {
    "A" => "Y",
    "B" => "Z",
    "C" => "X"
  }
  loss = {
    "A" => "Z",
    "B" => "X",
    "C" => "Y"
  }
  points = {
    "X" => 1,
    "Y" => 2,
    "Z" => 3,
    "A" => 1,
    "B" => 2,
    "C" => 3,
  }
  total_score = 0

  @data.each do |input|
    opponent, decision = input.split(" ")

    if decision == "Z"
      me = win[opponent]
      total_score += 6 + points[me]
    elsif decision == "X"
      me = loss[opponent]
      total_score += points[me]
    else
      total_score += 3 + points[opponent]
    end
  end

  puts '### Part 2'
  Helpers.print_answer(total_score)
end

first_part
second_part
