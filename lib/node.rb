# frozen_string_literal: true

# A class to model a chess move, with its available moves, as a node in a graph
class Node
  attr_accessor :list, :visited

  def initialize(move)
    @move = move
    @i_coordinate = move[0]
    @j_coordinate = move[1]
    @list = moves_vertical + moves_horizontal
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
