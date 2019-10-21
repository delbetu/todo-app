# Load simple gems (not rails stuff) and core directory
require 'values'
require 'contracts'
require 'byebug'


Dir['./app/core/**/*.rb'].each { |file| require file }
