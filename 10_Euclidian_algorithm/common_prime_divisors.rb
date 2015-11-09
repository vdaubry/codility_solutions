#!/usr/bin/env ruby

def prime_numbers(max)
  (2..max).to_a.select do |number|
    (2..(number-1)).all? {|number2| number % number2 != 0 }
  end
end

def prime_divisors(n)
  prime_numbers(n).select {|prime_number| n % prime_number == 0}
end

def solution(a, b)
  count = 0
  a.zip(b) do |a_val, b_val|
    count += 1 if prime_divisors(a_val) == prime_divisors(b_val)
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
  describe "prime_numbers" do
    it { assert_equal [2, 3, 5, 7, 11, 13], prime_numbers(13) }
  end

  describe "solution" do
    it { assert_equal 1, solution([15, 10, 3], [75, 30, 5]) }
    it { assert_equal 2, solution([15, 20, 3], [75, 20, 5]) }
    it { assert_equal 2, solution([15, 30, 3], [75, 60, 5]) }
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
