class Data::Header
  def initialize
    @cells = []
  end

  def each
    @cells.each do |cell|
      yield cell
    end
  end

  def <<(cell)
    @cells << cell
  end
end
