#!/usr/bin/env ruby

#######
#
# Solution
#
######

def solution(a, b, k)
  divisible = 0
  
  (a..b).each do |val|
    divisible +=1 if val % k == 0
  end
  divisible
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
    it { assert_equal 1, solution(0, 0, 1) }
    it { assert_equal 0, solution(6, 11, 12) }
    it { assert_equal 1, solution(12, 12, 12) }
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
