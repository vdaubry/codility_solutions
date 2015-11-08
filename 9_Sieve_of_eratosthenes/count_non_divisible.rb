#!/usr/bin/env ruby
require 'set'

def solution(array)
  result = []

  array.each_with_index do |val1, index1|
    count = 0
    array.each do |val2, index2|
      count += 1 if val1 % val2 != 0
    end
    result << count
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
  describe "solution" do
    it { assert_equal [2, 4, 3, 2, 0], solution([3, 1, 2, 3, 6]) }
    it { assert_equal [3, 5, 4, 3, 1, 3], solution([3, 1, 2, 3, 6, 8]) }
    it { assert_equal [0], solution([1]) }
    it { assert_equal [0], solution([2]) }
    it { assert_equal [0, 0], solution([2, 2]) }
    it { assert_equal [0, 1], solution([2, 1]) }
    it { assert_equal [1, 2, 1], solution([2, 1, 3]) }
    it { assert_equal [1, 2, 0], solution([2, 1, 6]) }
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
