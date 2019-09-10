class Cell
  attr_accessor :coordinates, :childList, :parent
  def initialize(x, y)
    @coordinates = {x: x, y: y}
    @childList = []
    @parent = nil
  end

  def to_s
    "(#{@coordinates[:x]}, #{@coordinates[:y]})"
  end

  def coordinates?(x, y)
    @coordinates[:x] == x  && @coordinates[:y] == y
  end
end

class Board
  attr_accessor :cellList

  def initialize
    @cellList = []
    8.times do |x|
      8.times do |y|
        @cellList.push(Cell.new(x, y))
      end
    end
  end
end

class Knight
  def initialize
    @board = Board.new
    @@directions = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
    link_cells
  end

  def can_visit?(x, y)
    x >= 0 && x <= 7 && y >= 0 && y <= 7
  end

  def link_cells
    @board.cellList.each do |cell|
      @@directions.each do |dir|
        x = cell.coordinates[:x] + dir[0]
        y = cell.coordinates[:y] + dir[1]
        if can_visit?(x, y)
          child_cell = find_cell(x, y)
          cell.childList.push(child_cell)
        end
      end
    end
  end

  def knight_moves(start_coord, end_coord)
    start_cell = find_cell(start_coord[0], start_coord[1])
    q = [start_cell]
    while !q.empty?
      current_cell = q.shift
      if current_cell.coordinates?(end_coord[0], end_coord[1])
        print_path(current_cell, start_cell)
        return
      else
        current_cell.childList.each {|cell| cell.parent = current_cell if cell.parent.nil?}
      end
      q.push(*current_cell.childList)
    end
  end

  def find_cell(x, y)
    @board.cellList.find{|cell| cell.coordinates?(x, y)}
  end

  def print_path(cell , start_cell)
    return puts cell if cell == start_cell
    print_path(cell.parent, start_cell)
    puts cell
  end
end

knight = Knight.new
knight.knight_moves([0, 0], [4, 4])
