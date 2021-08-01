# import class OptionParser
require "option_parser"

# application starts, the block passed to OptionParser#parse gets executed
OptionParser.parse do |parser|
  parser.banner = "Welcome to The Help App!"

  # after block execute, parser start consuming arguments passed,
  # trying to match with the options
  # if option matches, block passed to parser#on gets executed
  parser.on "-v", "--version", "Show version" do
    puts "version 1.0"
    exit
  end

  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end
end

# show all options: crystal run ./help.cr -- -h
# show version: crystal run ./help.cr -- -v
