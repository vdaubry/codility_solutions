#!/usr/bin/env ruby
require 'set'

def solution(a, b, c)
  min_nail = 0
  nailed = Set.new
  c.each do |nail|
    min_nail += 1
    a.zip(b) do |plank_start, plank_end|
      nailed.add(plank_start..plank_end) if nail.between?(plank_start, plank_end)
    end

    break if nailed.count == a.count
  end

  min_nail
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
    it { assert_equal 4, solution([1, 4, 5, 8], [4, 5, 9, 10], [4, 6, 7, 10, 2]) }
    it { assert_equal 4, solution([1, 4, 5, 8], [4, 5, 9, 10], [4, 6, 7, 10, 2, 4]) }
    it { assert_equal 4, solution([1, 4, 5, 8, 10], [4, 5, 9, 10, 13], [4, 6, 7, 10, 2, 13]) }
    it { assert_equal 6, solution([1, 4, 5, 8, 11], [4, 5, 9, 10, 13], [4, 6, 7, 10, 2, 13]) }
    it { assert_equal 5, solution([1, 4, 5, 8, 11], [4, 5, 9, 10, 13], [4, 6, 7, 10, 13, 2]) }
    it { assert_equal 6, solution([1, 4, 5, 8, 2], [4, 5, 9, 10, 3], [4, 6, 7, 10, 13, 2]) }
    it { assert_equal 5, solution([1, 4, 5, 8, 2], [4, 5, 9, 10, 3], [2, 4, 6, 7, 10, 13]) }
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
