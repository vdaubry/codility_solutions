#!/usr/bin/env ruby

def solution(n)
  min_perimeter = nil

  (1..n).each do |side_a|
    next unless n % side_a == 0
    
    side_b = n/side_a
    perimeter = 2 * (side_a + side_b)
    min_perimeter = perimeter if min_perimeter.nil? || perimeter < min_perimeter 
  end

  min_perimeter
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
    it { assert_equal 22, solution(30) }
    it { assert_equal 4, solution(1) }
    it { assert_equal 6, solution(2) }
    it { assert_equal 8, solution(3) }
    it { assert_equal 8, solution(4) }
    it { assert_equal 12, solution(8) }
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
