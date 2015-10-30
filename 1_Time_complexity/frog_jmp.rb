#!/usr/bin/env ruby

#######
#
# Solution
#
######

def solution(origin, destination, step)
  ((destination.to_f - origin.to_f) / step.to_f).ceil
end


#######
#
# Specs
#
######
require 'minitest/autorun'
require 'byebug'

class AlgoTests < MiniTest::Unit::TestCase
  describe "small numbers" do
    it { assert_equal 3, solution(10, 85, 30) }
    
    it { assert_equal 5, solution(18, 112, 20) }
  end
  
  describe "large numbers with small steps" do
    it { assert_equal 2500000, solution(10_000_000, 85_000_000, 30) }
  end
  
  describe "large numbers with large steps" do
    it { assert_equal 3, solution(10_000_000, 85_000_000, 30_000_000) }
  end
end


#######
#
# Benchmark
#
######
require 'minitest/benchmark'
class PerformanceBench < MiniTest::Benchmark    
  def self.bench_range 
    Minitest::Benchmark.bench_exp(1, 1_000_000_000)
  end
  
  def bench_linear_performance
    assert_performance_constant 0.99 do |input|
      origin = rand(10)*input
      destination = rand(85)*input
      step = rand(30)*input
      solution(origin, destination, step)
    end
  end
end
