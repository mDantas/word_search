class Finder
  DIRECTIONS = [:vertical, :horizontal, :diagonal]

  def initialize
    @dict = {}
    File.open("en.txt") do |file|
      file.each do |line|
        @dict[line.strip] = true
      end
    end
  end

  def find_all_words(grid)
    words = []
    grid.each_row do |r| 
      ws = get_word_substrings(r.join)
      words << ws unless ws.empty?
    end
    words.flatten
  end
 
  def get_word_substrings(str)
    get_substrings(str).select { |str| is_word?(str) }
  end

  def get_substrings(str)
    indices = (0..str.size-1).to_a
    possible_ranges = indices.product(indices).reject { |i,j| i > j }
    possible_ranges.map { |i,j| str[i..j] }
  end

  def is_word?(str)
    @dict[str]
  end

end
