#!/usr/bin/env ruby

class Array
  def sum
    self.reduce(:+)
  end
  
  def avg
    return 0 unless size != 0
    sum.to_f / size
  end
end

def solution(array)
  slices = {}
  
  array.each_with_index do |val1, index1|
    array[(index1+1)..-1].each_with_index do |val2, index2|
      index2 = index1+index2+1
      slices[index1..index2] = array[index1..index2].avg
    end
  end
  
  #byebug
  
  min_average = slices.values.min
  slices.select {|key, value| value == min_average}.keys.first.first
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
