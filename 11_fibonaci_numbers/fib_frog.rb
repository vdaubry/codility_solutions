#!/usr/bin/env ruby

def fibonacci(result=[1, 2], max)
  result << result.last+result[-2]
  return result if result.last >= max

  fibonacci(result, max)
end


def solution(array, current_position=0, current_count=0)
  fibonacci(array.size).each do |fib|
    puts "current_position = #{current_position}" 
    if (current_position+fib) > array.size
      byebug
      return current_count 
    end
    
    next_jump = current_position+fib
    if next_jump < array.size && array[next_jump-1] == 1
      current_position = next_jump
      current_count += 1
      puts "fib = #{fib}"
      puts "solution(array, #{current_position}, #{current_count})"
      solution(array, current_position, current_count)
    end
  end

  -1
end


#######
#
# Specs
#
######
require 'minitest/autorun'
require 'byebug'

class AlgoTests < MiniTest::Unit::TestCase
  describe "fibonacci" do
    it { assert_equal [1, 2, 3, 5, 8, 13, 21], fibonacci(21) }
  end

  describe "solution" do
    it { assert_equal 3, solution([0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0]) }
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
