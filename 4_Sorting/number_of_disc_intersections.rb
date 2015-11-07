#!/usr/bin/env ruby

#SCORE = MAX 50

def solution(array)
  count = 0
  array.each_with_index do |radius1, center1|
    array.each_with_index do |radius2, center2|
      next if center2 <= center1

      if (center2 - radius2) <= (center1 + radius1)
        count += 1
      end
    end
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
    it { assert_equal 11, solution([1, 5, 2, 1, 4, 0]) }
    it { assert_equal 14, solution([1, 5, 2, 1, 4, 0, 1]) }
    it { assert_equal 3, solution([0, 0, 2, 1]) }
    it { assert_equal 17, solution([1, 5, 2, 1, 4, 0, 1, 1]) }
    it { assert_equal 0, solution([0]) }
    it { assert_equal 0, solution([2]) }
    it { assert_equal 1, solution([2, 2]) }
    it { assert_equal 0, solution([0, 0]) }
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
