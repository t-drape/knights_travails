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

# A class to model a chess move
class Move
  def initialize(move)
    @current_matrix = move
    @available_moves = find_moves
  end

  def find_moves
    i_index = @current_matrix[0]
    j_index = @current_matrix[1]
    available_moves = []
    # Two steps to the side (i_index), one to the forward
    available_moves_i = [i_index + 2, i_index - 2]
    available_moves_j = [j_index + 1, j_index - 1]
    available_moves_i.each_with_index do |i|
      if i <= 7 && i >= 0
        available_moves_j.each do |j|
          if j <= 7 && j >= 0
          available_moves << Move.new([i, j])
        end
      end
    end
    # Two steps forward (j_index), one step to the side
    available_moves_i = [i_index + 1, i_index - 1]
    available_moves_j = [j_index + 2, j_index - 2]
  end
end

x = Move.new([1, 2])

adj_list = []
