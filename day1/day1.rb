require 'pry'

class Day1
  def initialize
    file_path = File.expand_path('input.csv', __dir__)
    input     = File.read(file_path)
    @lists = parse_input(input)
  end

  def parse_input(input)
    input.split("\n").map { |line| line.split.map(&:to_i) }
  end

  def extract_columns
    a = []
    b = []
    @lists.each do |left, right|
      a << left
      b << right
    end
    [a, b]
  end

  def print_lists_1
    a, b = extract_columns
    sorted_a = a.sort
    sorted_b = b.sort

    puts "List A: #{sorted_a}"
    puts "List B: #{sorted_b}"

    paired_array = sorted_a.zip(sorted_b)
    puts "Sorted Array (Paired): #{paired_array}"

    total_diff = paired_array.sum { |left, right| (left - right).abs }
    puts "Total Difference (Sum of |A - B|): #{total_diff}"
  end

  def part_two
    a, b = extract_columns

    b_counts = b.tally

    similarity = a.sum { |num| num * b_counts[num].to_i }

    puts "Similarity Sum (A * occurrences in B): #{similarity}"
  end
end

day1 = Day1.new
day1.print_lists_1
day1.part_two
