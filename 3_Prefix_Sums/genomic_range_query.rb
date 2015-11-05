#!/usr/bin/env ruby

IMPACT_FACTOR = { 
    "A" => 1,
    "C" => 2,
    "G" => 3,
    "T" => 4
  }  

def solution(s, p, q)
  array = s.chars
  
  p.each_with_index.map do |p_value, p_index|
    index_start = p_value
    index_stop = q[p_index]
    nucleotides = array[index_start..index_stop]
    min_nucleotide = nucleotides.min_by do |nucleotide|
      IMPACT_FACTOR[nucleotide]
    end
    
    IMPACT_FACTOR[min_nucleotide]
  end
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
    it { assert_equal [2, 4, 1], solution("CAGCCTA", [2, 5, 0], [4, 5, 6]) }
    it { assert_equal [1, 2, 1], solution("GCATCGTA", [1, 3, 0], [4, 5, 6]) }
    it { assert_equal [3], solution("G", [0], [0]) }
    it { assert_equal [3, 3], solution("G", [0, 0], [0, 0]) }
    it { assert_equal [4], solution("GT", [1], [1]) }
    it { assert_equal [4, 4], solution("GT", [1, 1], [1, 1]) }
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
