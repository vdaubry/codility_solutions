#!/usr/bin/env ruby

def solution(array)
  min_average = 10_000
  min_index = 100_000
  
  array.each_with_index do |val1, index1|
    previous_sum = val1
    array[(index1+1)..-1].each_with_index do |val2, index2|
      index2 = index1+index2+1
      
      previous_sum += val2
      
      avg = previous_sum.to_f/(index2-index1+1)
      
      if avg < min_average
        min_average = avg
        min_index = index1
      end
    end
  end
  
  min_index
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
    it { assert_equal 1, solution([4, 2, 2, 5, 1, 5, 8]) }
    it { assert_equal 0, solution([2, 1, 5, 5, 8]) }
    it { assert_equal 2, solution([2, 9, 5, 1, 8]) }
    it { assert_equal 3, solution([9, 5, 6, 3, 1]) }
    it { assert_equal 0, solution([9, 5]) }
    it { assert_equal 0, solution([5, 9]) }
    it { assert_equal 2, solution([9, 9, 1, 2, 1, 2]) }
    it { assert_equal 3, solution([4, 2, 2, -5, 1, 5, 8]) }
    it { assert_equal 5, solution([-4, -2, -2, -5, -1, -5, -8]) }
    it { assert_equal 5, solution([4, -2, -2, -5, -1, -5, -8]) }
    it { assert_equal 0, solution([-9, -5]) }
    it { assert_equal 0, solution([-5, -9]) }
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
