#!/usr/bin/env ruby
require 'set'

def prime_number(max)
  result = []
  (2..max).each do |val1|
    result << val1 if (2..(val1-1)).all? {|val2| val1 % val2 != 0 }
  end
  result
end

def semiprimes(start, stop)
  prime_numbers = prime_number(stop)
  all_semiprimes = Set.new
  prime_numbers.each do |prime1|
    prime_numbers.each do |prime2|
      all_semiprimes.add(prime1*prime2)
    end
  end

  all_semiprimes.to_a.select { |semiprime| semiprime.between?(start, stop) }.count
end


def solution(n, p, q)
  p.zip(q).map do |start, stop|
    semiprimes(start, stop)
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
  describe "prime_number" do
    it { assert_equal [2, 3, 5, 7, 11, 13], prime_number(13) }
    it { assert_equal [2, 3, 5, 7, 11, 13, 17, 19, 23, 29], prime_number(30) }
  end

  describe "semiprimes" do
    it { assert_equal 10, semiprimes(1, 26) }
    it { assert_equal 4, semiprimes(4, 10) }
    it { assert_equal 0, semiprimes(16, 20) }
  end

  describe "solution" do
    it { assert_equal [10, 4, 0], solution(26, [1, 4, 16], [26, 10, 20])}
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
