#!/usr/bin/env ruby
require 'set'

def solution(array)
  distinct_slices = Set.new

  array.each_with_index do |val, p| 
    array.each_with_index do |val, q|
      next if q < p
      break if array[p..q].uniq.count != array[p..q].count
      distinct_slices.add(p..q)
    end
  end

  return distinct_slices.count
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
    it { assert_equal 9, solution([3, 4, 5, 5, 2]) }
    it { assert_equal 8, solution([3, 4, 5, 5, 5]) }
    it { assert_equal 1, solution([0]) }
    it { assert_equal 2, solution([0, 0]) }
    it { assert_equal 3, solution([0, 1]) }
    it { assert_equal 4, solution([0, 1, 1]) }
    it { assert_equal 6, solution([0, 1, 2]) }
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
