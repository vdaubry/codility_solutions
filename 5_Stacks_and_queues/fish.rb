#!/usr/bin/env ruby

def solution(array1, array2)
  alive = []

  current_fish_upstream = nil

  array1.zip(array2) do |size, direction|
    
    if direction == 1
      alive.push(size)
      current_fish_upstream = size
    end

    if direction == 0
      if current_fish_upstream.nil?
        alive.push(size)
      elsif current_fish_upstream < size
        alive.pop
        alive.push(size)
        current_fish_upstream = nil
      end
    end
  end

  alive.size
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
    it { assert_equal 2, solution([4, 3, 2, 1, 5], [0, 1, 0, 0, 0]) }
    it { assert_equal 3, solution([4, 3, 2, 1, 5, 2], [0, 1, 0, 0, 0, 1]) }
    it { assert_equal 3, solution([4, 3, 2, 1, 5, 6], [0, 1, 0, 0, 0, 1]) }
    it { assert_equal 4, solution([4, 3, 2, 1, 5, 2, 1], [0, 1, 0, 0, 0, 1, 1]) }
    it { assert_equal 3, solution([4, 3, 2, 1, 5, 2, 1], [0, 1, 0, 0, 0, 1, 0]) }
    it { assert_equal 3, solution([4, 3, 2, 1, 5, 2, 3], [0, 1, 0, 0, 0, 1, 0]) }
    it { assert_equal 1, solution([4], [0]) }
    it { assert_equal 1, solution([4], [1]) }
    it { assert_equal 1, solution([0], [0]) }
    it { assert_equal 2, solution([0, 1], [0, 0]) }
    it { assert_equal 2, solution([0, 1], [1, 1]) }
    it { assert_equal 1, solution([1, 0], [1, 0]) }
    it { assert_equal 2, solution([0, 1], [0, 1]) }
    it { assert_equal 3, solution([0, 1, 2], [0, 0, 0]) }
    it { assert_equal 3, solution([0, 1, 2], [1, 1, 1]) }
    it { assert_equal 2, solution([0, 1, 2], [1, 0, 0]) }
    it { assert_equal 1, solution([2, 1, 0], [1, 0, 0]) }
    it { assert_equal 2, solution([2, 1, 0], [1, 0, 1]) }
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
