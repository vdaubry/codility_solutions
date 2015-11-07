#!/usr/bin/env ruby

def solution(array)
  element_occurences = Hash.new {|h, k| h[k] = 0}
  dominator = nil
  current_max = 0

  array.each do |val|
    element_occurences[val] += 1
    if dominator.nil? || current_max < element_occurences[val]
      dominator = val
      current_max = element_occurences[val]
    end
  end

  return -1 if dominator.nil? || (element_occurences[dominator] <= (array.size/2.0))

  array.find_index(dominator)
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
    it { assert_equal 0, solution([3, 4, 3, 2, 3, -1, 3, 3 ]) }
    it { assert_equal 0, solution([3, 4, 3, 2, 3, -1, 3, 3, 3 ]) }
    it { assert_equal 2, solution([0, 4, 3, 2, 3, -1, 3, 3, 3 ]) }
    it { assert_equal 1, solution([0, 4, 4, 2, 3, 4, 4, 3, 4 ]) }
    it { assert_equal -1, solution([]) }
    it { assert_equal 0, solution([0]) }
    it { assert_equal 0, solution([0, 0]) }
    it { assert_equal 0, solution([0, 0, 1]) }
    it { assert_equal -1, solution([0, 0, 1, 1]) }
    it { assert_equal 2, solution([0, 0, 1, 1, 1]) }
    it { assert_equal 0, solution([-1, -1, -1, -1, -1]) }
    it { assert_equal 1, solution([-2, -1, -2, -1, -1]) }
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
