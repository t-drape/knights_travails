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
  @@available_spots = lambda {
    spots = []
    8.times do |i|
      8.times do |j|
        spots << [i, j]
      end
    end
    spots
  }
  def initialize(move, spots)
    @current_matrix = move
    @spots = @@available_spots.call
    @available_moves = find_moves
  end

  def find_moves
    move_i, move_j = @current_matrix
    moves = moves_vertical(move_i, move_j)
    moves += moves_horizontal(move_i, move_j)
    moves
    # available_moves_horizontal = moves_horizontal(move_i, move_j)
  end

  def moves
    p @spots
  end

  private

  def moves_vertical(vertical, horizontal)
    moves = []
    i_way = [2, -2]
    j_way = [1, -1]
    # For each of I, loop through possible j's
    i_way.each do |i|
      j_way.each do |j|
        spot = [vertical + i, horizontal + j]
        moves << spot if @spots.include?(spot)
      end
    end
    moves
  end

  def moves_horizontal(vertical, horizontal)
    moves = []
    i_way = [1, -1]
    j_way = [2, -2]
    i_way.each do |i|
      j_way.each do |j|
        spot = [vertical + i, horizontal + j]
        moves << spot if @spots.include?(spot)
      end
    end
    moves
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

x = Move.new([0, 0], available_spots)
x.moves

def knight_moves(starting_point, end_point)
end

# graph class

# aDJACENCY LIST
class Graph
  def initialize
    @array = available_spots
  end

  def available_spots
    spots = []
    8.times do |i|
      8.times do |j|
        spots << [i, j]
      end
    end
    spots
  end

  def show
    p @array
  end
end

y = Graph.new
y.show
