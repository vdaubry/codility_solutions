#!/usr/bin/env ruby

def solution(n)
  (1..n).inject(0) do |count, d|
    count += 1 if n % d == 0
    count
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
  describe "method" do
    it { assert_equal 8, solution(24) }
    it { assert_equal 1, solution(1) }
    it { assert_equal 2, solution(2) }
    it { assert_equal 2, solution(3) }
    it { assert_equal 3, solution(4) }
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
