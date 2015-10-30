#!/usr/bin/env ruby


#######
#
# Solution
#
######

def solution(array)
  return 1 if array.empty?
  
  already_seen = Array.new(array.size+1, 0)
  array.each do |value|
    already_seen[value-1] = 1
  end
  
  already_seen.find_index {|value| value == 0} + 1
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
    describe "it returns missing element" do
      it { assert_equal 4, solution([2, 3, 1, 5]) }
      it { assert_equal 2, solution([1, 3, 5, 4]) }
    end
    
    describe "empty array" do
      it { assert_equal 1, solution([]) }
    end
    
    describe "array with 1 element" do
      it { assert_equal 2, solution([1]) }
    end
    
    describe "array with 2 element" do
      it { assert_equal 3, solution([1, 2]) }
    end
  end
end


#######
#
# Benchmark
#####
require 'minitest/benchmark'
class PerformanceBench < MiniTest::Benchmark    
    def self.bench_range 
      Minitest::Benchmark.bench_exp(10, 100_000)
    end
    
    def bench_linear_performance
      assert_performance_linear 0.99 do |input|
        array = []
        (1..(input+1)).each { |value| array << value }
        solution(array)
      end
    end
end
