# frozen_string_literal: true

# We want the best algorithm
# Depth first or Breadth first
# What are the moves from any point
# Constraints
# 0. 0, 1, 2, 3, 4, 5, 6, 7
# 1. 0, 1, 2, 3, 4, 5, 6, 7
# 2. 0, 1, 2, 3, 4, 5, 6, 7
# 3. 0, 1, 2, 3, 4, 5, 6, 7
# 4. 0, 1, 2, 3, 4, 5, 6, 7
# 5. 0, 1, 2, 3, 4, 5, 6, 7
# 6. 0, 1, 2, 3, 4, 5, 6, 7
# 7. 0, 1, 2, 3, 4, 5, 6, 7

# Each move is a node, with values to all available other moves
# Think like vectors!
# Vector addition
# Always add |2| to one side, add |1| to the others
available_spots = []
8.times do |i|
  8.times do |j|
    available_spots << [i, j]
  end
end

# A class to model a chess move
class Move
  def initialize(move)
    @current_matrix = move
    @available_moves = find_moves
  end

  def find_moves
    move_i, move_j = @current_matrix
    available_moves_vert = moves_vertical(move_i, move_j)
    available_moves_horizontal = moves_horizontal(move_i, move_j)
  end

  private

  def moves_vertical(i, j)
  end
end

x = Move.new([1, 2])
p x.find_moves

def knight_moves(starting_point, end_point)
end
