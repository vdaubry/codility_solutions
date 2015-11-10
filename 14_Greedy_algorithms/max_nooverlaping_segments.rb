#!/usr/bin/env ruby

class Range
  def intersect?(other_range)
    first.between?(other_range.first, other_range.last) ||
    last.between?(other_range.first, other_range.last)
  end
end

def possible_set(max_value, number_of_sets)
  Array.new(("#{max_value}"*number_of_sets).to_i, 0)
end

def solution(a, b)
  max_segments = a.size


  a.zip(b) do |a_val, b_val|

  end

  #max_segments.downto(1) do ||

  #variations = possible_set(a.count, set_to_remove)

  max_segments
end


#######
#
# Specs
#
######
require 'minitest/autorun'
require 'byebug'

class AlgoTests < MiniTest::Unit::TestCase
  describe "intersect" do
    it { assert_equal true, (1..5).intersect?(3..6) }
    it { assert_equal true, (3..6).intersect?(1..5) }
    it { assert_equal false, (3..6).intersect?(7..8) }
    it { assert_equal false, (7..8).intersect?(9..9) }
    it { assert_equal true, (7..9).intersect?(9..9) }
  end

  # describe "solution" do
  #   it { assert_equal nil, solution() }
  # end
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
