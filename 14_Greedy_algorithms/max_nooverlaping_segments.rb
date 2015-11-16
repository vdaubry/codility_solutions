#!/usr/bin/env ruby

class Range
  def intersect?(other_range)
    self.first.between?(other_range.first, other_range.last) ||
    self.last.between?(other_range.first, other_range.last)
  end
end

def overlaping_segments?(intervals, segment_indices)
  return true if segment_indices.size < 2
  segment_indices.each_cons(2).any? do |segments_to_check|
    interval1 = intervals[segments_to_check[0]]
    interval2 = intervals[segments_to_check[1]]
    interval1.intersect?(interval2)
  end
end

def combination(number_of_segments, desired_segments)
  (0..number_of_segments).to_a.combination(desired_segments)
end
  

def solution(a, b)
  return 1 if a.size == 1
  max_segments = a.size
  
  intervals = a.zip(b).map {|a_val, b_val| a_val..b_val }

  max_segments.downto(1) do |min|
    combination((max_segments-1), min).each do |segment_indices|
      return min unless overlaping_segments?(intervals, segment_indices)
    end
  end
  
  return 0
end


#######
#
# Specs
#
######
require 'minitest/autorun'
require 'byebug'

class AlgoTests < MiniTest::Unit::TestCase
  describe "intersect" do
    it { assert_equal true, (1..5).intersect?(3..6) }
    it { assert_equal true, (3..6).intersect?(1..5) }
    it { assert_equal false, (3..6).intersect?(7..8) }
    it { assert_equal true, (3..6).intersect?(6..7) }
    it { assert_equal false, (7..8).intersect?(9..9) }
    it { assert_equal true, (7..9).intersect?(9..9) }
  end

  describe "solution" do
    it { assert_equal 3, solution([1, 3, 7, 9, 9], [5, 6, 8, 9, 10]) }
    it { assert_equal 4, solution([1, 3, 7, 9, 9, 10], [5, 6, 8, 9, 10, 11]) }
    it { assert_equal 4, solution([1, 3, 7, 9, 9, 10, 11], [5, 6, 8, 9, 10, 11, 12]) }
    it { assert_equal 0, solution([], []) }
    it { assert_equal 1, solution([1], [1]) }
    it { assert_equal 1, solution([1], [2]) }
    it { assert_equal 2, solution([1, 3], [2, 4]) }
    it { assert_equal 0, solution([1, 2], [2, 4]) }
    it { assert_equal 2, solution([1, 2, 4], [2, 4, 5]) }
  end
end


#######
#
# Benchmark
#
######
#require 'minitest/benchmark'
#class PerformanceBench < MiniTest::Benchmark    
#  def self.bench_range 
#    Minitest::Benchmark.bench_exp(10, 100_000)
#  end
#  
#  def bench_linear_performance
#    assert_performance_constant 0.99 do |input|
#      #generate random dataset, ex: input.times {|val| array << rand(val)}
#      #call method to test
#    end
#  end
#end
