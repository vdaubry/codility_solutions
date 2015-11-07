#!/usr/bin/env ruby

def solution(string)
  return 1 if string.empty?

  parenthesis_stack = []
  bracket_stack = []
  curly_bracket_stack = []

  string.chars.each do |char|
    if char == '('
      parenthesis_stack.push(char)
    elsif char == ')'
      return 0 if parenthesis_stack.empty?
      parenthesis_stack.pop
    elsif char == '['
      bracket_stack.push(char)
    elsif char == ']'
      return 0 if bracket_stack.empty?
      bracket_stack.pop
    elsif char == '{'
      curly_bracket_stack.push(char)
    elsif char == '}'
      return 0 if curly_bracket_stack.empty?
      curly_bracket_stack.pop
    end
  end

  properly_nested = parenthesis_stack.empty? && 
                    bracket_stack.empty? &&
                    curly_bracket_stack.empty?

  properly_nested ? 1 : 0
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
    it { assert_equal 1, solution("{[()()]}") }
    it { assert_equal 0, solution("{[()()]") }
    it { assert_equal 0, solution("{[()()]") }
    it { assert_equal 0, solution("{[()(]}") }
    it { assert_equal 1, solution("") }
    it { assert_equal 1, solution("()") }
    it { assert_equal 1, solution("[]") }
    it { assert_equal 1, solution("{}") }
    it { assert_equal 0, solution("{") }
    it { assert_equal 0, solution("(") }
    it { assert_equal 0, solution("[") }
    it { assert_equal 0, solution("]") }
    it { assert_equal 0, solution(")") }
    it { assert_equal 0, solution("}") }
    it { assert_equal 0, solution(")(") }
    it { assert_equal 0, solution("][") }
    it { assert_equal 0, solution("}{") }
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
