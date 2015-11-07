#!/usr/bin/env ruby
class Array
  def sum
    return 0 if empty?
    reduce(:+)
  end
end

def double_slide_sum(array, x, y, z)
  array[(x+1)..(y-1)].sum +
  array[(y+1)..(z-1)].sum
end

def solution(array)
  current_max = nil

  array.each_index do |x|
    array.each_index do |y|
      next if y <= x
      array.each_index do |z|
        next if z <= y
        sum = double_slide_sum(array, x, y, z)
        current_max = sum if current_max.nil? || current_max < sum
      end
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
  describe "double_slide_sum" do
    it { assert_equal 17, double_slide_sum([3, 2, 6, -1, 4, 5, -1, 2], 0, 3, 6) }
    it { assert_equal 16, double_slide_sum([3, 2, 6, -1, 4, 5, -1, 2], 0, 3, 7) }
    it { assert_equal 0, double_slide_sum([3, 2, 6, -1, 4, 5, -1, 2], 3, 4, 5) }
  end

  describe "method" do
    it { assert_equal 17, solution([3, 2, 6, -1, 4, 5, -1, 2]) }
    it { assert_equal 0, solution([1, 1, 1]) }  
    it { assert_equal 0, solution([-1, -1, -1]) }  
    it { assert_equal 0, solution([0, 0, 0]) }  
    it { assert_equal 0, solution([0, 0, 0, 0]) }  
    it { assert_equal 1, solution([1, 1, 1, 1]) }  
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
