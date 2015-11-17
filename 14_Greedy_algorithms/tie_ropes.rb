#!/usr/bin/env ruby

def solution(desired_length, array, current_max=0)
  return array.size if array.any? && array.all? {|size| size >= desired_length }
  
  array.each_cons(2).to_a.each_with_index.map do |(size1, size2), index|
    new_array = array.dup
    new_array.slice!(index..index+1)
    new_array.insert(index, (size1 + size2))
    
    result_size = solution(desired_length, new_array, current_max)
    current_max = [result_size, current_max].max
  end
  
  return current_max
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
    it { assert_equal 3, solution(4, [1, 2, 3, 4, 1, 1, 3]) }
    it { assert_equal 0, solution(4, [1]) }
    it { assert_equal 0, solution(4, [1, 1]) }
    it { assert_equal 1, solution(4, [1, 1, 3]) }
    it { assert_equal 2, solution(4, [1, 1, 3, 1, 2, 1]) }
    it { assert_equal 6, solution(1, [1, 1, 3, 1, 2, 1]) }
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
