# frozen_string_literal: true

require_relative('lib/moves')

def knight_moves(starting_point, end_point)
  graph = Graph.new
  moves = graph.find_path(starting_point, end_point)
  puts "You made it in #{moves.length} moves! Here's your path: "
  moves.each { |e| p e }
end
