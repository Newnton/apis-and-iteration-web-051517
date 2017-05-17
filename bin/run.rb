#!/usr/bin/env ruby

require_relative "../lib/character.rb"
require_relative "../lib/command_line_interface.rb"

welcome
foo = check_for_character(get_character_from_user)
if foo != nil
  char = Character.new(foo)
  output = Films.new(char.film_URLS)
  puts output.format_film_data
else
  puts "not a character"
end
