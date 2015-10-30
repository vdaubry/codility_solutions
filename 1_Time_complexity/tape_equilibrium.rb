#!/usr/bin/env ruby

#######
#
# Helpers
#
######
class Array
  def sum
    reduce(:+)
  end
end


#######
#
# Solution
#
######
def first_part(array, partition_index)
  array[0..partition_index-1]
end

def second_part(array, partition_index)
  array[partition_index..-1]
end

def minimal_difference(array)
  first_part_sum = first_part(array, 1).sum
  second_part_sum = second_part(array, 1).sum
  min_difference = (first_part_sum - second_part_sum).abs
  
  array.each_with_index do |value, index|
    next if index < 1 || index == array.count - 1
    first_part_sum += value
    second_part_sum -= value
    current_difference = (first_part_sum - second_part_sum).abs
    min_difference = [current_difference, min_difference].min
  end
  min_difference
end

def solution(a)
  minimal_difference(a)
end



#######
#
# Specs
#
######
require 'minitest/autorun'

class AlgoTests < MiniTest::Unit::TestCase
  describe "small array with positive values" do
    before do
      @array = [3, 1, 2, 4, 3]
    end
    
    describe "first_part" do
      it { assert_equal first_part(@array, 1), [3] }
    end
    
    describe "second_part" do
      it { assert_equal second_part(@array, 1), [1, 2, 4, 3] }
    end
    
    describe "minimal_difference" do
      it { assert_equal minimal_difference(@array), 1 }
    end
  end
  
  describe "small array with negative values" do
    before do
      @array = [-3, -1, -2, -4, -3]
    end
    
    describe "minimal_difference" do
      it { assert_equal minimal_difference(@array), 1 }
    end
  end
  
  describe "small array with positive and negative values" do
    before do
      @array = [-1000, 1000]
    end
    
    describe "minimal_difference" do
      it { assert_equal minimal_difference(@array), 2000 }
    end
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
      
      assert_performance_linear 0.99 do |input|
        array = [rand(-100..100)]*input
        minimal_difference(array)
      end
    end
end
