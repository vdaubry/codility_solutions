#!/usr/bin/env ruby

def triangular?(p, q, r)
  p + q > r &&
  q + r > p &&
  r + p > q
end

def solution(array)
  triangles_count = 0

  array.each_with_index do |p_val, p|
    array.each_with_index do |q_val, q|
      next if q <= p
      array.each_with_index do |r_val, r|
        next if r <= q

        if triangular?(p_val, q_val, r_val)
          triangles_count += 1 
        end
      end
    end
  end

  triangles_count
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
    it { assert_equal 4, solution([10, 2, 5, 1, 8, 12]) }
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
