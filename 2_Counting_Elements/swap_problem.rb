#!/usr/bin/env ruby

#######
#
# Solution
#
######

class Array
  def sum
    self.reduce(:+)
  end
end

def solution(array1, array2)
  sum1 = array1.sum
  sum2 = array2.sum
  
  array1.each_with_index do |val1, index1|
    array2.each_with_index do |val2, index2|
      new_sum1 = (sum1 - val1 + val2)
      new_sum2 = (sum2 - val2 + val1)
      return true if new_sum1 == new_sum2
    end
  end
  
  false
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
    it { assert_equal true, solution([1,2], [3,2]) }
    it { assert_equal false, solution([1,1], [3,2]) }
    it { assert_equal true, solution([1], [1]) }
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
