#!/usr/bin/env ruby

#######
#
# Solution
#
######

def solution(destination, array)
  path_array = Array.new(destination, -1)
  
  array.each_with_index do |value, index|
    path_array[value-1]=index
    #Stop if path is complete
    break if path_array.find_index(-1).nil?
  end
  
  return -1 unless path_array.find_index(-1).nil?
  return path_array.max
end


#######
#
# Specs
#
######
require 'minitest/autorun'
require 'byebug'

class AlgoTests < MiniTest::Unit::TestCase
  describe "leaves at every position" do
    it { assert_equal 6, solution(5, [1, 3, 1, 4, 2, 3, 5, 4]) }
  end
  
  describe "some leaves missing" do
    it { assert_equal -1, solution(5, [1, 3, 1, 1, 2, 3, 5, 2]) }
  end
  
  describe "last leaves falls at destination" do
    it { assert_equal 7, solution(5, [1, 3, 1, 4, 2, 3, 1, 5]) }
  end
  
  describe "last leaves falls in first position" do
    it { assert_equal 5, solution(5, [5, 3, 1, 1, 2, 4, 1, 2]) }
  end
  
  describe "empty array" do
    it { assert_equal -1, solution(5, []) }
  end
  
  describe "single element" do
    it { assert_equal 0, solution(1, [1]) }
  end
  
  describe "destination not in array" do
    it { assert_equal -1, solution(9, [1, 3, 1, 1, 2, 3, 5, 2]) }
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
    Minitest::Benchmark.bench_exp(1, 100_000)
  end
  
  def bench_linear_performance
    assert_performance_constant 0.99 do |input|
      destination = rand(input)
      array = []
      input.times {|val| array << rand(destination)}
      solution(destination, array)
    end
  end
end
