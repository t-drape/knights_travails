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
#

# A class to represent a move in chess, with all future available moves available (knight)
class Node
  attr_accessor :list, :visited

  def initialize(move)
    @move = move
    @i_coordinate = move[0]
    @j_coordinate = move[1]
    @list = moves_vertical + moves_horizontal
    @visited = false
  end

  private

  def moves_vertical
    moves = []
    # For each of I, loop through possible j's
    [2, -2].each do |i|
      i_coord = i + @i_coordinate
      [1, -1].each do |j|
        j_coord = j + @j_coordinate
        moves << [i_coord, j_coord] if (i_coord >= 0 && i_coord <= 7) && (j_coord >= 0 && j_coord <= 7)
      end
    end
    moves
  end

  def moves_horizontal
    moves = []
    # For each of I, loop through possible j's
    # [1, -1]
    [1, -1].each do |i|
      i_coord = i + @i_coordinate
      [2, -2].each do |j|
        j_coord = j + @j_coordinate
        moves << [i_coord, j_coord] if (i_coord >= 0 && i_coord <= 7) && (j_coord >= 0 && j_coord <= 7)
      end
    end
    moves
  end
end

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
    @list = []
    # @spots = available_spots
    # @available_moves = find_moves
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

  def find_moves
    move_i, move_j = @current_matrix
    moves = moves_vertical(move_i, move_j)
    moves += moves_horizontal(move_i, move_j)
    moves
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
end

x = Move.new([0, 0])

def knight_moves(starting_point, end_point)
end

# graph class

# ADJACENCY LIST
class Graph
  def initialize
    @adjacency_list = fill_list
  end

  def fill_list
    # Add two plus v, two minus v, one plus h, one minus h
    # Add two pluss h, two minus h, one plus v, pne minus v
    # current_move list add fill move
    spots = []
    8.times do |i|
      spots << []
      8.times do |j|
        spots[i] << Node.new([i, j])
      end
    end
    spots
  end

  def find_path(start, end_square, moves = [], queue = [])
    # Helpful Articles
    # url: https://memgraph.com/blog/graph-search-algorithms-developers-guide
    # url : https://www.geeksforgeeks.org/breadth-first-search-or-bfs-for-a-graph/
    # Deliver the shortest path from given path to end path
    # There will always be a way
    # BFS algo
    # FIFO: First in, first out

    return moves if start == end_square

    @adjacency_list[start[0]][start[1]].visited = true
    @adjacency_list[start[0]][start[1]].list.each do |e|
      queue << e unless @adjacency_list[e[0]][e[1]].visited
    end

    best_path = 1 / 0.0
    until queue.empty?
      x = queue.pop
      length = find_path(x, end_square, moves << start)
      best_path = length if length.length < best_path.length
    end
    best_path
  end
end

y = Graph.new
p y.find_path([0, 0], [3, 3])

# Hash map feature:
#
# 0:
# 0:
# [1, 2], [2 , 1]
# 1:
# 2:
# 3:
# 4:
# 5:
# 6:
# 7:
# 1:
# 0:
# 1:
