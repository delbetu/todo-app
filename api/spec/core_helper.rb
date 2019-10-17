# Load simple gems (not rails stuff) and core directory
require 'values'
require 'contracts'
require 'byebug'


Dir['./app/core/*'].each { |f| require f }
