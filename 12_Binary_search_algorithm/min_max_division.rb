#!/usr/bin/env ruby

class Array
  def sum
    return 0 if size == 0
    reduce(:+)
  end
end

def min_large_sum(array)
  size = array.size
  min_large_sum = 0
  array.each_index do |index|
    slice1 = array.first(index)
    slice2 = array.last(size-index)
    large_sum = [slice1.sum, slice2.sum].max
    min_large_sum = [min_large_sum, large_sum].min
  end

  min_large_sum
end

def solution(k, m, array)
  size = a.size
  slice1_sum = slice2_sum = slice3_sum = 0
  min_large_sum = 0

  size.times do |index|
    slice1_sum = array.first(index).sum
    (index+1).times do |i|
      slice2_sum = array[index..index+i].sum
      slice3_sum = array[index+i+1..-1].sum
    end

    large_sum = [slice1_sum, slice2_sum, slice3_sum].max
    min_large_sum = [min_large_sum, large_sum].min
  end

  min_large_sum
end


#######
#
# Specs
#
######
require 'minitest/autorun'
require 'byebug'

class AlgoTests < MiniTest::Unit::TestCase
  describe "min_large_sum" do
    it { assert_equal 6, solution([2, 1, 5, 1, 2, 2, 2]) }
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
