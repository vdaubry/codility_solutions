#!/usr/bin/env ruby

#ex : 
#[1, 2, 3, 4]
#[0, 1, 3, 6, 10] 
class Array
  def prefix_sums
    each_with_index.inject([0]) do |result, (val, index)|
      result << (val + result[index])
    end
  end

  def sum
    return 0 if empty?
    reduce(:+)
  end
end

def solution(array)
  prefix_sums = array.prefix_sums
  current_max = nil

  array.each_with_index do |val, p|
    array.each_index do |q|
      next if q < p
      current_sum = prefix_sums[q+1] - prefix_sums[p]
      current_max = current_sum if current_max.nil? || current_max < current_sum
    end
  end

  current_max
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
    it { assert_equal 5, solution([3, 2, -6, 4, 0]) }
    it { assert_equal 9, solution([3, 2, 4, -6, 4, 0]) }
    it { assert_equal 14, solution([3, 2, -6, 4, 10, 0]) }
    it { assert_equal 10, solution([3, 2, -6, 4, -10, 0, 10]) }
    it { assert_equal 5, solution([3, 2, -6, 4, -10, 0, 1]) }
    it { assert_equal 0, solution([-3, -2, -6, -4, -10, 0, -1]) }
    it { assert_equal 5, solution([5]) }
    it { assert_equal 0, solution([0, 0]) }
    it { assert_equal 1, solution([1, 0, 0]) }
    it { assert_equal 1, solution([1]) }
    it { assert_equal 0, solution([0]) }
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
