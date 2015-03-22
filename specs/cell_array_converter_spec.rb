require 'rspec'
require_relative '../src/cell_array_converter'

describe 'Cell Array Converter behaviour' do

  it 'zero in zero out' do
    world = [[0, 0, 0],
             [0, 0, 0],
             [0, 0, 0]
    ]

    cell_array_converter = CellArrayConverter.new
    expect(world). to eq(cell_array_converter.create_array(cell_array_converter.create_cells(world)))
  end

  it 'zero in zero out' do
    world = [[1, 0, 0],
             [0, 1, 0],
             [0, 0, 1]
    ]

    cell_array_converter = CellArrayConverter.new
    expect(world). to eq(cell_array_converter.create_array(cell_array_converter.create_cells(world)))
  end
end