require_relative 'cell'
require_relative 'cell_array_converter'

class GameOfLife

  def initialize world_array
    @converter = CellArrayConverter.new

    @cell_x = @converter.create_cells(world_array)

    determine_neighbours
  end

  def determine_neighbours

    @cell_x.each_with_index do |cell_x,xi|

      cell_x.each_with_index  do |cell_y,yi|
        if xi-1>=0
            cell_y.add_neighbour(@cell_x[xi-1][yi-1]) if yi-1>=0
            cell_y.add_neighbour(@cell_x[xi-1][yi])
            cell_y.add_neighbour(@cell_x[xi-1][yi+1])
        end


        cell_y.add_neighbour(@cell_x[xi][yi-1]) if yi-1>=0
        cell_y.add_neighbour(@cell_x[xi][yi+1]) if yi+1<cell_x.length

        if xi+1<@cell_x.length
          cell_y.add_neighbour(@cell_x[xi+1][yi-1]) if yi-1>=0
          cell_y.add_neighbour(@cell_x[xi+1][yi])
          cell_y.add_neighbour(@cell_x[xi+1][yi+1]) if yi+1<cell_x.length
        end
      end

    end

  end


  def run
    @cell_x.flatten.map { |cell| cell.update}
    @converter.create_array(@cell_x)
  end
end