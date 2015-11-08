#!/usr/bin/env ruby

def peaks(array)
  result = []

  array.each_with_index do |val, index|
    next if index==0 || (index==array.size-1)
    result << index if val > array[index-1] && val > array[index+1]
  end

  result
end

def solution(array)
  all_peaks = peaks(array)

  all_peaks.count.downto(1).each do |peak_number|
    stack = []
    all_peaks.each do |val|
      stack << val if stack.empty? || (val-stack.last) >= peak_number
    end

    return peak_number if stack.count >= peak_number
  end

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
  describe "peaks" do
    it { assert_equal [1, 3, 5, 10], peaks([1, 5, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2]) }
  end

  describe "solution" do
    it { assert_equal 3, solution([1, 5, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2]) }
    it { assert_equal 4, solution([1, 5, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2, 1, 0, 5, 3]) }
    it { assert_equal 0, solution([1]) }
    it { assert_equal 0, solution([1, 1]) }
    it { assert_equal 0, solution([1, 1, 1]) }
    it { assert_equal 1, solution([1, 2, 1]) }
    it { assert_equal 2, solution([1, 2, 1, 1, 2, 1]) }
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
