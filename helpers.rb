class Helpers
  class << self
    def get_input_file_data(year: Time.now.year, day: Time.now.day)
      input_file = File.read(Dir.pwd + "/#{year}/inputs/#{day}.txt")
      input_file.split("\n")
    end

    def print_answer(response)
      puts "*** The Answer is: #{response} ***"
    end
  end
end