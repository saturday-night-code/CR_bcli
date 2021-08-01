require "option_parser"
require "colorize" # shows a string with colors

jajanken = [
  "Gū",
  "Chī",
  "Pā",
]
jajan = false
user_name = ""

option_parser = OptionParser.parse do |parser|
  parser.banner = "Welcome to #{"Gon".colorize(:green).on(:black)} CLI."

  parser.on "-v", "--version", "Show version" do
    puts "version 1.0"
    exit
  end

  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end

  parser.on "-j", "--jajanken", "Saisho wa Gū! Jan! Ken!" do
    jajan = true
  end

  parser.on "-g NAME", "--goodbye_hello=NAME", "Jajanken in whoever you want" do |name|
    user_name = name
  end

  parser.missing_option do |option_flag|
    STDERR.puts "ERROR: #{option_flag} is missing something."
    STDERR.puts ""
    STDERR.puts parser
    exit(1)
  end

  parser.invalid_option do |option_flag|
    STDERR.puts "ERROR: #{option_flag} is not a valid option."
    STDERR.puts parser
    exit(1)
  end
end

shouts = jajanken
# shouts = jajanken.map &.upcase if jajan

puts ""
puts "Your last readed words are:"
puts "=============="
shouts.each do |shout|
  puts "Saisho wa Gū! Jan! Ken! #{shout}!"
end

unless user_name.empty?
  puts ""
  puts "You say goodbye, and #{jajanken.sample} says hello to #{user_name}!"
end

# show all options: crystal run ./jajanken.cr -- -h
# show Jajanken: crystal run ./jajanken.cr -- -j
# show your last words: crystal run ./jajanken.cr -- -g "<name>"
