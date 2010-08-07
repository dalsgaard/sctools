$:.unshift 'lib'
require 'lib/sctools/relationships'

require 'ap'

SnomedCt::Relationships.each ARGV[0], :type => :qualifier do |id, cid1, rel, cid2, type, ref, group|
  puts "#{id}, #{cid1}, #{rel}, #{cid2}, #{type}, #{ref}, #{group}"
end
