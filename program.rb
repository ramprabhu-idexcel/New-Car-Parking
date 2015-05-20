require File.dirname(__FILE__) + '/lib/car.rb'
require File.dirname(__FILE__) + '/lib/slot.rb'
require File.dirname(__FILE__) + '/lib/search.rb'
require File.dirname(__FILE__) + '/lib/parking_area.rb'
require File.dirname(__FILE__) + '/lib/error.rb'


def valid_input
  search = Search.new
  loop do
    input = gets
    input ? search.keyword_search(input) : break
  end
end

if ARGV.length > 2
  puts Error::input
elsif ARGV.length != 0 && ARGV[0].split(".").last != "txt"
  puts Error::file_type
else
  valid_input
end


