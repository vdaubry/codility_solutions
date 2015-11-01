#!/usr/bin/env ruby

#######
#
# Solution
#
######
require 'set'

def solution(a)
  return 0 if a.empty?
  
  already_seen = Set.new
  
  max = 0
  a.each do |val|
    already_seen.add(val)
    max = [max, val].max
  end
  return 1 if already_seen.size == max &&
               already_seen.size == a.size
  
  0
end


#######
#
# Specs
#
######
require 'minitest/autorun'
require 'byebug'

class AlgoTests < MiniTest::Unit::TestCase
  describe "small permutaion" do
    it { assert_equal 1, solution([4, 1, 3, 2]) }
    it { assert_equal 1, solution([1, 2, 5, 3, 4]) }
  end
  
  describe "array with missing value" do
    it { assert_equal 0, solution([4, 1, 3]) }
    it { assert_equal 0, solution([1, 2, 5, 3]) }
  end
  
  describe "empty array" do
    it { assert_equal 0, solution([]) }
  end
  
  describe "permutation with single element" do
    it { assert_equal 1, solution([1]) }
  end
  
  describe "array with single element" do
    it { assert_equal 0, solution([2]) }
  end
  
  describe "array with duplicate elements" do
    it { assert_equal 0, solution([1, 1]) }
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
    Minitest::Benchmark.bench_exp(10, 100_000)
  end
  
  def bench_linear_performance
    assert_performance_constant 0.99 do |input|
      array = []
      input.times {|val| array << rand(val)}
      solution(array)
    end
  end
end
