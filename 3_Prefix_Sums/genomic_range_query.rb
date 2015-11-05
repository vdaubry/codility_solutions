#!/usr/bin/env ruby

IMPACT_FACTOR = { 
    "A" => 1,
    "C" => 2,
    "G" => 3,
    "T" => 4
  }  

def solution(s, p, q)
  array = s.chars
  size = array.size
  letters = IMPACT_FACTOR.keys
  
  prefix_sums = Hash.new {|h, k| h[k] = Array.new(size, 0) }
  
  array.each_with_index do |nucleotide, index|
    letters.each do |letter|
      current_val = prefix_sums[letter][index-1]
      current_val+=1 if letter == nucleotide
      prefix_sums[letter][index] = current_val
    end
  end
  
  result = []
  p.zip(q) do |p_value, q_value|
    letters.each do |letter|
      start_index = [p_value-1, 0].max
      stop_index = q_value
      
      if p_value == 0 && array[0] == letter
        result << IMPACT_FACTOR[array[0]]
        break
      elsif prefix_sums[letter][start_index] != prefix_sums[letter][stop_index]
        result << IMPACT_FACTOR[letter]
        break
      end
    end
  end
  
  result
end


#######
#
# Specs
#
######
require 'minitest/autorun'
require 'byebug'

class AlgoTests < MiniTest::Unit::TestCase
  describe "method" do
    it { assert_equal [2, 4, 1], solution("CAGCCTA", [2, 5, 0], [4, 5, 6]) }
    it { assert_equal [1, 2, 1], solution("GCATCGTA", [1, 3, 0], [4, 5, 6]) }
    it { assert_equal [1, 2, 1], solution("GCATCGTAGCTACGTA", [1, 3, 0], [4, 5, 6]) }
    it { assert_equal [3], solution("G", [0], [0]) }
    it { assert_equal [3, 3], solution("G", [0, 0], [0, 0]) }
    it { assert_equal [4], solution("GT", [1], [1]) }
    it { assert_equal [4, 4], solution("GT", [1, 1], [1, 1]) }
    it { assert_equal [1, 1, 2], solution("AC", [0, 0, 1], [0, 1, 1]) }
  end
end


#######
#
# Benchmark
#
######
require 'minitest/benchmark'
class PerformanceBench < MiniTest::Benchmark    
  def self.bench_range 
    Minitest::Benchmark.bench_exp(1, 100_000)
  end
 
  def bench_linear_performance
    assert_performance_linear 0.99 do |input|
      str = ""
      p = []
      q = []
      input.times do |input| 
        str += ["A","C","G","T"].sample
        p << input
        q << input+1
      end
      solution(str, p, q)
  end
 end
end
