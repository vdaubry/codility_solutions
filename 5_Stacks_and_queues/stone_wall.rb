#!/usr/bin/env ruby

def solution(array)
  stack = []
  block_required = 0

  array.each do |height|
    while stack.any? && stack.last > height
      stack.pop
    end

    next if stack.last == height
 
    block_required += 1
    stack.push(height)
  end

  block_required
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
    it { assert_equal 7, solution([8, 8, 5, 7, 9, 8, 7, 4, 8]) }
    it { assert_equal 6, solution([8, 8, 5, 7, 9, 8, 7, 4]) }
    it { assert_equal 5, solution([8, 8, 5, 7, 9, 8, 7]) }
    it { assert_equal 5, solution([8, 8, 5, 7, 9, 8]) }
    it { assert_equal 5, solution([8, 8, 5, 7, 9, 8, 8]) }
    it { assert_equal 5, solution([8, 8, 5, 7, 9, 8, 8, 8]) }
    it { assert_equal 4, solution([8, 8, 5, 7, 7, 8, 8, 8, 7]) }
    it { assert_equal 1, solution([1]) }
    it { assert_equal 1, solution([1, 1]) }
    it { assert_equal 2, solution([1, 2]) }
    it { assert_equal 3, solution([1, 2, 3]) }
    it { assert_equal 3, solution([1, 2, 3, 2]) }
    it { assert_equal 4, solution([1, 2, 3, 2, 2, 3, 3]) }
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
