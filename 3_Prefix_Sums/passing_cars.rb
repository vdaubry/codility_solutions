#!/usr/bin/env ruby

#######
#
# Solution
#
######
require 'set'

def solution(array)
  counter = 0
  
  already_seen = Set.new
  
  array.each_with_index do |val1, index1|
    (array[index1..-1]).each_with_index do |val2, index2|
      index2 = index1 + index2
      couple_id = "#{[index1, index2].min}_#{[index1, index2].max}"
      next if already_seen.include?(couple_id)
      
      already_seen.add(couple_id)
      if val1 == 0 && val2 == 1
        counter += 1 
      end
      
      return -1 if counter>= 1_000_000_000
    end
  end
  
  counter
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
  end
end


#######
#
# Benchmark
#
######
# require 'minitest/benchmark'
# class PerformanceBench < MiniTest::Benchmark    
#  def self.bench_range 
#    Minitest::Benchmark.bench_exp(10, 100_000)
#  end
 
#  def bench_linear_performance
#    assert_performance_linear 0.99 do |input|
#      array = []
#      input.times {|val| array << rand(1)}
#      solution(array)
#    end
#  end
# end
