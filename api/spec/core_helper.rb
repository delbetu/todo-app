# Load simple gems (not rails stuff) and core directory
require 'values'
require 'contracts'
require 'byebug'

Dir['./spec/support/**/*.rb'].each { |file| require file }

Dir['./app/core/**/*.rb'].each { |file| require file }
