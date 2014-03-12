require './lib/term.rb'
require './lib/definition.rb'
require './lib/word.rb'

def help
  puts "Press 'e' to enter a word to find its definition,"
  puts "      'a' to add a word, "
  puts "      '+' to add to a term,"
  puts "      'l' to list terms."
  puts "      'delete' to delete a term"
  puts "      'help' to get all commands"
  puts "      'x' to exit."
end

def list_terms
  Term.all.each_key {|key| puts key}
end

def look_up
  puts "Enter a word for its definition."
  input_word = gets.chomp
  curr_object = Term.search(input_word)

  (0..curr_object.words.length-1).each do |i|
    puts "#{curr_object.words[i].word} means #{curr_object.definitions[i].definition} in #{curr_object.words[i].language}."
  end
end

def del_term
  puts "What term are we deleting?"
  term = gets.chomp

  Term.del(term)
end

def add_to_term
  puts "What term will this add to?"
  original_term = gets.chomp

  puts "Enter the word:"
  input_word = gets.chomp

  puts "Enter the language:"
  input_language = gets.chomp

  word = Word.new(input_word, input_language)

  puts "Enter the definition:"
  input_definition = gets.chomp
  definition = Definition.new(input_definition)

  Term.search(original_term).add(word, definition)
end

def add_term
  puts "Enter the word:"
  input_word = gets.chomp
  word = Word.new(input_word)

  puts "Enter the definition:"
  input_definition = gets.chomp
  definition = Definition.new(input_definition)

  Term.new(word, definition)
end


def main_menu
  print "> "
  input = gets.chomp

  case input
  when 'a'
    add_term
  when 'e'
    look_up
  when '+'
    add_to_term
  when 'l'
    list_terms
  when 'delete'
    del_term
  when 'help'
    help
  when 'x'
    exit
  end
end

puts "Welcome to Dictionary!"
help

loop do
  main_menu
end
