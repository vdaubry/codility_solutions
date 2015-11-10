#!/usr/bin/env ruby

def solution(array)
  min_sum = nil

  array.each_with_index do |p_val, p|
    array.each_with_index do |q_val, q|
      next if q < p

      abs_sum = (p_val + q_val).abs
      min_sum = abs_sum if min_sum.nil? || min_sum > abs_sum
    end
  end

  min_sum
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
    it { assert_equal 1, solution([1, 4, -3]) }
    it { assert_equal 3, solution([-8, 4, 5, -10, 3]) }
    it { assert_equal 1, solution([-8, 4, 5, -10, 3, -2]) }
    it { assert_equal 1, solution([-8, 4, 5, -10, -3, 2]) }
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
