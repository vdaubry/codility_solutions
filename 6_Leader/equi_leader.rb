#!/usr/bin/env ruby

def leader(array)
  res = array.max_by {|val| array.count(val) }
  array.count(res) > (array.size/2.0) ? res : nil
end

def solution(array)
  count = 0

  array.each_index do |index|
    leader1 = leader(array[0..index])
    next if leader1.nil?
    leader2 = leader(array[index+1..-1])

    count += 1 if leader1 == leader2
  end

  count
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
    it { assert_equal 2, solution([4, 3, 4, 4, 4, 2]) }
    it { assert_equal 4, solution([4, 3, 4, 4, 4, 2, 4]) }
    it { assert_equal 0, solution([1, 3, 4, 4, 4, 2, 4]) }
    it { assert_equal 2, solution([1, 3, 4, 4, 4, 2, 4, 4]) }
    it { assert_equal 0, solution([1]) }
    it { assert_equal 1, solution([1, 1]) }
    it { assert_equal 2, solution([1, 1, 1]) }
    it { assert_equal 3, solution([1, 1, 1, 1]) }
    it { assert_equal 0, solution([-1, -1, 1, 1]) }
    it { assert_equal 1, solution([-1, -1, -1, 1]) }
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
