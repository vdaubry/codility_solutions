#!/usr/bin/env ruby

def solution(array)
  number_of_east_cars = 0
  number_of_passing_cars = 0
  
  array.each_with_index do |val, index1|
    number_of_east_cars += 1 if val == 0
    number_of_passing_cars += number_of_east_cars if val == 1
    
    return -1 if number_of_passing_cars > 1_000_000_000
  end
  
  number_of_passing_cars
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
    it { assert_equal 5, solution([0, 1, 0, 1, 1]) }
    it { assert_equal 5, solution([0, 1, 0, 1, 1, 0]) }
    it { assert_equal 5, solution([0, 1, 0, 1, 1, 0, 0]) }
    it { assert_equal 9, solution([0, 1, 0, 1, 1, 0, 0, 1]) }
    it { assert_equal 0, solution([0]) }
    it { assert_equal 0, solution([1]) }
    it { assert_equal 1, solution([0, 1]) }
    it { assert_equal 0, solution([1, 0]) }
    it { assert_equal 0, solution([0, 0]) }
    it { assert_equal 0, solution([1, 1]) }
    it { assert_equal -1, solution([0, 1]*50_000) }
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
     array = []
     input.times {|val| array << rand(1)}
     solution(array)
   end
 end
end
