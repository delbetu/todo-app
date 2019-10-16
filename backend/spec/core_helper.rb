# Load simple gems (not rails stuff) and core directory
require 'values'
require 'byebug'

Dir['./app/core/*'].each { |f| require f }
