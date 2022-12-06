require 'pry'
require './helpers'

@data = Helpers.get_input_file_data(year: "2022", day: "4")

def get_sections(input)
  a, b = input.split(",")
  a = a.split("-").map(&:to_i)
  b = b.split("-").map(&:to_i)
  
  [a, b]
end

def first_part
  fully_contain = 0
  @data.each do |input|
    a, b = get_sections(input)

    if a[0] >= b[0] && a[1] <= b[1]
      fully_contain += 1
    elsif b[0] >= a[0] && b[1] <= a[1]
      fully_contain += 1
    end
  end

  puts '### Part 1'
  Helpers.print_answer(fully_contain)
end

def second_part
  contain = 0
  @data.each do |input|
    a, b = input.split(",")
    a = a.split("-").map(&:to_i)
    b = b.split("-").map(&:to_i)

    if a[0] >= b[0] && a[0] <= b[1] ||
       a[1] >= b[0] && a[1] <= b[1] ||
       b[0] >= a[0] && b[0] <= a[1] ||
       b[1] >= a[0] && b[1] <= a[1]
       contain += 1
    end
  end

  puts '### Part 2'
  Helpers.print_answer(contain)
end

# first_part
second_part
