require 'rubygems'
require 'rake'

Gem::Specification.new do |spec|
  spec.name = 'sctools'
  spec.version = "0.0.1"
  spec.summary = "Snomed CT Tools"
  spec.description = "Tools for working with the Snomed CT files"
  spec.author = "Kim Dalsgaard"
  spec.email = "kim@kimdalsgaard.com"
  
  spec.files = FileList['lib/**/*.rb']
  spec.require_paths = ['lib']
end
