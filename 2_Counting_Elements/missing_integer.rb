#!/usr/bin/env ruby

#######
#
# Solution
#
######

def min_in_interval(start, stop, already_seen)
  (start..stop).each do |val|
    next if val <= 0
    return val unless already_seen[val]
  end
  nil
end

def solution(array)
  return 1 if array.empty?

  already_seen = {}
  array.each do |val|
    already_seen[val] = true
  end

  result = min_in_interval(1 , array.max+1, already_seen)
  return result || 1
end


#######
#
# Specs
#
######
require 'minitest/autorun'
require 'byebug'

class AlgoTests < MiniTest::Unit::TestCase
  describe "solution" do
    it { assert_equal 5, solution([1, 3, 6, 4, 1, 2]) }
    it { assert_equal 7, solution([4, 3, 6, 5, 1, 2]) }
    it { assert_equal 1, solution([4, 5, 6, 2]) }
    it { assert_equal 1, solution([]) }
    it { assert_equal 2, solution([1, 1]) }
    it { assert_equal 1, solution([-4, -3, -6, -4, -1, -2]) }
    it { assert_equal 3, solution([-5, -1, -3, 6, 4, 1, 2]) }
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
      array = []
      input.times {|val| array << rand(-2147483648..2147483647)}
      solution(array)
    end
  end
end
