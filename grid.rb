class Grid
  def initialize(n)
    @size = n
    @cells = Array.new(n*n)
  end

  def set_grid(char_arr = nil)
    char_arr ||= (0..@cells.size-1).map { ('a'..'z').to_a[rand(26)] }
    raise "Input char arr must be #{@cells.size} chars long" unless  char_arr.size == @cells.size
    @cells = char_arr
  end

  def to_s
    @cells.each_slice(@size).map { |r| r.join(' ') }.join("\n")
  end

  def each_row
    @cells.each_slice(@size) { |r| yield r }
  end

#  def each_col
#    (0..@size-1).to_a.map { |n|   
#  end
end
