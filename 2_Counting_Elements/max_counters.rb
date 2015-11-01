#!/usr/bin/env ruby

#######
#
# Solution
#
######

def solution(number_of_counter, array)
  counters = Array.new(number_of_counter, 0)
  max = 0
  min = 0
  
  array.each do |val|
    if val >= 1 && val <= number_of_counter
      current = counters[val-1]
      counters[val-1] = [min+1, current+1].max
      max = [max, counters[val-1]].max
    elsif val == (number_of_counter+1)
      min = max
    end
  end

  counters.map! {|val| [val, min].max }
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
    it { assert_equal [3, 2, 2, 4, 2], solution(5, [3, 4, 4, 6, 1, 4, 4]) }
    it { assert_equal [4, 2, 2, 4, 2], solution(5, [3, 4, 4, 6, 1, 4, 4, 1]) }
    it { assert_equal [0, 0, 0, 0, 0], solution(5, []) }
    it { assert_equal [1], solution(1, [1]) }
    it { assert_equal [2], solution(1, [1, 1]) }
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
   assert_performance_linear 0.97 do |input|
      array = []
      input.times {|val| array << rand(val)}
      number_of_counter = rand(100_000)
      solution(number_of_counter, array)
   end
 end
end
