require 'httparty'
require './credentials'

@year = Time.now.year
@day = Time.now.day

def get_input_data
  url = "https://adventofcode.com/#{@year}/day/#{@day}/input"
  headers = {
    "Accept" => "text/html",
    "Cookie" => Credentials::COOKIE,
    "User-Agent" => Credentials::USER_AGENT
  }

  response = HTTParty.get(url, headers: headers)
  response.body
end

def create_todays_input_file
  input_file = File.new(Dir.pwd + "/#{@year}/inputs/#{@day}.txt", "w+")
  input_file.puts(get_input_data)
  input_file.close
end

def create_todays_solution_file
  solution_file = File.new(Dir.pwd + "/#{@year}/#{@day}.rb", "w+")

  solution_file.puts("require 'pry'")
  solution_file.puts("require './helpers'")
  solution_file.puts("")
  solution_file.puts("@data = Helpers.get_input_file_data(year: \"#{@year}\", day: \"#{@day}\")")
  solution_file.puts("")
  solution_file.puts("def first_part")
  solution_file.puts("  puts '### Part 1'")
  solution_file.puts("  Helpers.print_answer(<solution>)")
  solution_file.puts("end")
  solution_file.puts("")
  solution_file.puts("def second_part")
  solution_file.puts("  puts '### Part 2'")
  solution_file.puts("  Helpers.print_answer(<solution>)")
  solution_file.puts("end")
  solution_file.puts("")
  solution_file.puts("first_part")
  solution_file.puts("#second_part")

  solution_file.close
end

create_todays_input_file
create_todays_solution_file