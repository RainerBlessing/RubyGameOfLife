require 'rspec'
require_relative '../src/cell'

describe 'Cell behaviour' do

  it 'should add three alive neighbours and be alive' do

    cell = Cell.new(1)

    cell.add_neighbour(Cell.new(1))
    cell.add_neighbour(Cell.new(1))
    cell.add_neighbour(Cell.new(1))

    expect(cell.next_status).to eq(1)
  end

  it 'should add two alive neighbours and be dead' do

    cell = Cell.new(1)

    cell.add_neighbour(Cell.new(0))
    cell.add_neighbour(Cell.new(1))
    cell.add_neighbour(Cell.new(1))

    expect(cell.next_status).to eq(0)
  end
end