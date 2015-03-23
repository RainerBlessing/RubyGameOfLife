require 'rspec'
require_relative '../src/game_of_life'
describe 'rules' do

  it 'empty world stays empty' do
    world = [[0, 0, 0],
             [0, 0, 0],
             [0, 0, 0]
    ]
    #gameOfLife = GameOfLife.new(world)
    #expect(gameOfLife.run()).to eq(world)
  end

  it 'a single cell will die' do
    world = [ [1]
    ]

    result =[ [0]
    ]

    gameOfLife = GameOfLife.new(world)
    expect(gameOfLife.run()).to eq(result)

  end

  it 'a dead cell with three living neighbours will be reborn' do

    world = [[0, 0, 0],
             [1, 1, 1]
    ]

    result =[[0, 1, 0],
             [0, 1, 0]
    ]

    gameOfLife = GameOfLife.new(world)
    expect(gameOfLife.run()).to eq(result)
  end

  it 'a cell with less than two neighbours dies' do
    world = [[0, 1],
             [0, 1]
    ]

    result =[[0, 0],
             [0, 0]
    ]

    gameOfLife = GameOfLife.new(world)
    expect(gameOfLife.run()).to eq(result)
  end

  it 'a cell with two or three neighbours stays alive' do
    world = [[0, 0, 0],
             [1, 1, 0],
             [0, 1, 1]
    ]

    result =[[0, 0, 0],
             [1, 1, 1],
             [1, 1, 1]
    ]

    gameOfLife = GameOfLife.new(world)
    expect(gameOfLife.run()).to eq(result)
  end

  it 'a cell with more than three neighbours dies' do
    world = [[1, 1, 1],
             [1, 1, 1],
             [1, 1, 1]
    ]

    result =[[1, 0, 1],
             [0, 0, 0],
             [1, 0, 1]
    ]

    gameOfLife = GameOfLife.new(world)
    expect(gameOfLife.run()).to eq(result)
  end
end