# frozen_string_literal: true

require_relative('node')

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

  def find_path(start, end_square)
    # Deliver the shortest path from given path to end path
    # There will always be a way
    # BFS algo
    # FIFO: First in, first out

    dist = [[], [], [], [], [], [], [], []]
    par = [[], [], [], [], [], [], [], []]
    queue = []

    dist[start[0]][start[1]] = 0

    queue << start

    while !queue.empty? && dist[end_square[0]][end_square[1]].nil?
      curr_node = queue.shift
      cost = dist[curr_node[0]][curr_node[1]] + 1

      @adjacency_list[curr_node[0]][curr_node[1]].list.each do |e|
        next unless dist[e[0]][e[1]].nil?

        queue << e
        dist[e[0]][e[1]] = cost
        par[e[0]][e[1]] = curr_node
      end
    end

    path = []
    node = end_square
    until node == start
      path << node
      node = par[node[0]][node[1]]
    end
    path << node
    path.reverse
  end
end
