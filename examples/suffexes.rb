$:.unshift 'lib'
require 'lib/sctools/concepts'

require 'ap'

Suffixes = {}

SnomedCt::Concepts.each ARGV[0], :status => 0 do |id, status, name, suffix, primitive|
  if suffix
    unless Suffixes[suffix]
      Suffixes[suffix] = 0
    end
    Suffixes[suffix] += 1
  else
    puts "#{id}, #{status}, #{name}, #{suffix}, #{primitive}"
  end
end

ap Suffixes
