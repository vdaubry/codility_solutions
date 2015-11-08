#!/usr/bin/env ruby

def solution(array)
  max_profit = nil

  array.each_with_index do |price1, index|
    array[(index+1)..-1].each do |price2|
      current_profit = price2 - price1
      max_profit = current_profit if max_profit.nil? || max_profit < current_profit
    end
  end

  if max_profit.nil? || max_profit < 0
    0
  else
    max_profit
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
    it { assert_equal 356, solution([23171, 21011, 21123, 21366, 21013, 21367]) }
    it { assert_equal 0, solution([]) }
    it { assert_equal 0, solution([1]) }
    it { assert_equal 0, solution([1, 0]) }
    it { assert_equal 1, solution([1, 0, 1]) }
    it { assert_equal 2, solution([1, 0, 1, 2]) }
    it { assert_equal 2, solution([1, 0, 1, 2, 2]) }
    it { assert_equal 2, solution([1, 1, 1, 2, 3, 2]) }
    it { assert_equal 3, solution([1, 0, 1, 2, 3, 2, 0]) }
    it { assert_equal 4, solution([1, 0, 1, 2, 3, 2, 0, 4]) }
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
