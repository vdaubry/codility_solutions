#!/usr/bin/env ruby
require 'set'

def solution(n, m)
  already_eaten = Set.new
  next_chocolate = current_chocolate = 0
  
  while already_eaten.add?(next_chocolate)
    current_chocolate = next_chocolate
    next_chocolate = (current_chocolate+m)%n
  end

  already_eaten.count
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
    it { assert_equal 5, solution(10, 4) }
    it { assert_equal 1, solution(1, 1) }
    it { assert_equal 1, solution(1, 2) }
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
