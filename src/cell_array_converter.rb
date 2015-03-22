require_relative 'cell'

class CellArrayConverter
  def create_cells(world_array)

    cells = Array.new

    world_array.each do |x|
      cell_y = Array.new

      x.each do |y|
        cell_y << Cell.new(y)
      end

      cells << cell_y
    end

    cells
  end

  def create_array cells

    array = Array.new

    cells.each do |cell_x|
      columns = Array.new

      cell_x.each do |cell_y|
        columns << cell_y.status
      end

      array << columns
    end

    array
  end
end