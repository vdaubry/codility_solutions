#!/usr/bin/env ruby

#######
#
# Solution
#
######

def solution(a, b, k)
  if a == b
    b % k == 0 ? 1 : 0
  elsif k > b
    0
  elsif (b-a) == k
    ((b - a) / k)  
  else
    ((b - a) / k) + 1
  end
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
    it { assert_equal 3, solution(6, 11, 2) }
    it { assert_equal 5, solution(12, 20, 2) }
    it { assert_equal 2, solution(12, 20, 5) }
    it { assert_equal 8, solution(21, 60, 5) }
    it { assert_equal 1, solution(0, 0, 1) }
    it { assert_equal 0, solution(6, 11, 12) }
    it { assert_equal 1, solution(12, 12, 12) }
    it { assert_equal 0, solution(1, 1, 11) }
    it { assert_equal 0, solution(0, 1, 11) }
    it { assert_equal 1, solution(10, 10, 5) }
    it { assert_equal 0, solution(10, 10, 7) }
    it { assert_equal 0, solution(10, 10, 8) }
    it { assert_equal 0, solution(10, 10, 20) }
    it { assert_equal 1, solution(11, 13, 2) }
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
