#!/usr/bin/env ruby

class Array
  def prefix_sums
    each_with_index.inject([0]) do |result, (val, index)|
      result << (val + result[index])
    end
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
  describe "prefix_sums" do
    it { assert_equal [0, 23171, 44182, 65305, 86671, 107684, 129051], [23171, 21011, 21123, 21366, 21013, 21367].prefix_sums }
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
