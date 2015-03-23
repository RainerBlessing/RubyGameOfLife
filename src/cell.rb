class Cell
  attr_accessor :status, :neighbours,:old_status

  def initialize status
    @old_status = status
    @neighbours = []
  end

  def add_neighbour(neighbour)
    @neighbours << neighbour unless neighbour.nil?
  end

  def update
    @status = next_status
  end

  def status
    @status.nil? ? @old_status : @status
  end
  def next_status
    alive = 0

    @neighbours.each do |neighbour|
      neighbour.old_status == 1 && alive = alive +1
    end

    case status
      when 0
        alive>2 ? 1 : 0
      when 1
        alive == 2 || alive == 3 ? 1 : 0
    end
  end
end