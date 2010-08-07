$:.unshift 'lib'
require 'lib/sctools/descriptions'

SnomedCt::Descriptions.each ARGV[0], :type => :preferred, :status => :current do |id, status, cid, term, cap, type, lang, dia|
  puts "<div class=\"description preferred\" lang=\"da\"><div class=\"term\">#{term}</div></div>"
end
