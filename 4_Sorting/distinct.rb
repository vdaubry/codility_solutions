#!/usr/bin/env ruby

def solution(array)
  array.uniq.count
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
    it { assert_equal 3, solution([2, 1, 1, 2, 3, 1]) }
    it { assert_equal 3, solution([2, 1, 1, 2, 3, 1, 1, 1]) }
    it { assert_equal 2, solution([2, 1, 1, 2]) }
    it { assert_equal 1, solution([1, 1, 1]) }
    it { assert_equal 1, solution([1]) }
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
