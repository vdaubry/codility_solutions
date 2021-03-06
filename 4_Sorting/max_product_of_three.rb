#!/usr/bin/env ruby

def solution(array)
  array.sort.last(3).reduce(:*)
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
    it { assert_equal 60, solution([-3, 1, 2, -2, 5, 6]) }
    it { assert_equal 24, solution([3, 1, 2, 4]) }
    it { assert_equal 60, solution([3, 1, 2, 4, 5]) }
    it { assert_equal 60, solution([3, 2, 4, 5]) }
    it { assert_equal 120, solution([3, 2, 4, 5, 6]) }
    it { assert_equal -24, solution([-3, -2, -4, -5, -6]) }
    it { assert_equal 6, solution([1, 2, 3]) }
    it { assert_equal 1, solution([1, 1, 1]) }
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
    Minitest::Benchmark.bench_exp(10, 100_000)
  end
 
  def bench_linear_performance
    assert_performance_linear 0.99 do |input|
      array = []
      input.times {|val| array << rand(val)}
      solution(array)
    end
  end
end
