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
  def initialize(move, spots)
    @current_matrix = move
    @spots = spots
    @available_moves = find_moves
    @moves = []
  end

  def find_moves
    moves = []
    move_i, move_j = @current_matrix
    available_moves_vert = moves_vertical(move_i, move_j)
    # available_moves_horizontal = moves_horizontal(move_i, move_j)
  end

  def moves_vertical(vertical, horizontal)
    i_way = [2, -2]
    j_way = [1, -1]
    # For each of I, loop through possible j's
    i_way.each do |i|
      j_way.each do |j|
        spot = [vertical + i, horizontal + j]
        @moves << spot if @spots.include?(spot)
        p @moves
      end
    end
    #   sum_i = vertical + addend
    #   j_way.each do |other_addend|
    #     p other_addend
    #     sum_j = horizontal + other_addend
    #     spot = [sum_i, sum_j]
    #     @spots.include?(spot) ? moves << spot : next
    #   end
    # end
  end
end

x = Move.new([0, 0], available_spots)

def knight_moves(starting_point, end_point)
end
