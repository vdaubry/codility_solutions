#!/usr/bin/env ruby

#SCORE = MAX 50

def triangular?(p, q, r)
  (p+q)>r &&
  (q+r)>p &&
  (r+p)>q
end

def solution(array)
  result = 0 
  array.each_with_index do |p, p_index|
    array.each_with_index do |q, q_index|
      next if q_index <= p_index
      array.each_with_index do |r, r_index|
        next if r_index <= q_index
        return 1 if triangular?(p, q, r)
      end
    end
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
  describe "method" do
    it { assert_equal 1, solution([10, 2, 5, 1, 8, 20]) }
    it { assert_equal 0, solution([10, 50, 5, 1]) }
    it { assert_equal 0, solution([10]) }
    it { assert_equal 0, solution([10, 2]) }
    it { assert_equal 1, solution([10, 5, 8]) }
    it { assert_equal 0, solution([10, 2, 5]) }
    it { assert_equal 0, solution([]) }
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
