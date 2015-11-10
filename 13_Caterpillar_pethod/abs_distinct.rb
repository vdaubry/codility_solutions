#!/usr/bin/env ruby

def solution(array)
  array.map {|val| val.abs}.uniq.count
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
    it { assert_equal 5, solution([-5, -3, -1, 0, 3, 6]) }
    it { assert_equal 5, solution([-5, -3, -1, 0, 3, 7]) }
    it { assert_equal 6, solution([-5, -3, -1, 0, 3, 6, 7]) }
    it { assert_equal 5, solution([-5, -3, -1, 0, 3, 7, -7]) }
    it { assert_equal 5, solution([-5, -3, -1, 0, 3, 7, -7, 3]) }
    it { assert_equal 1, solution([1]) }
    it { assert_equal 2, solution([1, 0]) }
    it { assert_equal 2, solution([0, 1, 0]) }
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
