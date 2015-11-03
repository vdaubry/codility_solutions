#!/usr/bin/env ruby

#######
#
# Solution
#
######
require 'set'

class MoveSerie
  attr_reader :start, :stop
  def initialize(start, stop)
    @start = [start, stop].min
    @stop = [start, stop].max
  end
  
  def ==(another_move_serie)
    (start <= another_move_serie.start) &&
    (stop >= another_move_serie.stop)
    
  end
  alias_method :eql?, :==
  
  def hash
    self.start.hash ^ self.stop.hash
  end
  
  def to_s
    "start=#{start} stop=#{stop}"
  end
end



def available_move_series(mushroom_positions:, picker_position:, moves:)
  move_series = Set.new
  #without changing direction on the left
  if (picker_position-moves) >= 0
    move_series.add MoveSerie.new(picker_position, picker_position-moves)
  else
    move_series.add MoveSerie.new(picker_position, 0)
  end
  
  #without changing direction on the right
  if (picker_position+moves) <= (mushroom_positions.size-1)
    move_series.add MoveSerie.new(picker_position, moves+picker_position)
  else
    move_series.add MoveSerie.new(picker_position, mushroom_positions.size-1)
  end
  
  #changing direction
  unless [0, mushroom_positions.size-1].include?(picker_position)
    moves_with_direction_change = moves-2
    far_left = [picker_position-moves_with_direction_change, 0].max
    (far_left..picker_position).each do |start|
      stop = [start+moves_with_direction_change, mushroom_positions.size-1].min
      move_series.add MoveSerie.new(start, stop)
    end
    
    
    far_right = [picker_position+moves_with_direction_change, mushroom_positions.size-1].min
    (picker_position..far_right).each do |stop|
      start = [stop-moves_with_direction_change, 0].max
      move_series.add MoveSerie.new(start, stop)
      byebug
    end
  end
  
  move_series
end

def solution(mushroom_positions, picker_position, moves)
  
end


#######
#
# Specs
#
######
require 'minitest/autorun'
require 'byebug'

class AlgoTests < MiniTest::Unit::TestCase
  describe "available_move_series" do
    # describe "without changing direction" do
    #   it "returns all position on the left" do
    #     result = available_move_series(mushroom_positions: [2, 3, 7, 5, 1, 3, 9], 
    #                                     picker_position: 6, 
    #                                     moves: 6)
    #     assert_equal 1, result.count
    #     assert_equal MoveSerie.new(6, 0), result.first
    #   end
      
    #   it "returns some position on the left" do
    #     result = available_move_series(mushroom_positions: [2, 3, 7, 5, 1, 3, 9], 
    #                                     picker_position: 6, 
    #                                     moves: 5)
    #     assert_equal 1, result.count
    #     assert_equal MoveSerie.new(6, 1), result.first
    #   end
      
    #   it "returns all position on the right" do
    #     result = available_move_series(mushroom_positions: [2, 3, 7, 5, 1, 3, 9], 
    #                                     picker_position: 0, 
    #                                     moves: 6)
    #     assert_equal 1, result.count
    #     assert_equal MoveSerie.new(0, 6), result.first
    #   end
      
    #   it "returns some position on the right" do
    #     result = available_move_series(mushroom_positions: [2, 3, 7, 5, 1, 3, 9], 
    #                                     picker_position: 0, 
    #                                     moves: 5)
    #     assert_equal 1, result.count
    #     assert_equal MoveSerie.new(0, 5), result.first
    #   end
    # end
    
    describe "changing direction" do
      # it "returns all positions when in midle position" do
      #   result = available_move_series(mushroom_positions: [2, 3, 7, 5, 1, 3, 9], 
      #                                   picker_position: 3, 
      #                                   moves: 6)
      #   assert result.include?(MoveSerie.new(0, 4))
      #   assert result.include?(MoveSerie.new(1, 5))
      #   assert result.include?(MoveSerie.new(2, 6))
      # end
      
      it "returns all positions when in midle position" do
        result = available_move_series(mushroom_positions: [2, 3, 7, 5, 1, 3, 9, 3, 4, 7, 1, 2], 
                                        picker_position: 6, 
                                        moves: 6)
        assert result.include?(MoveSerie.new(0, 6))
        assert result.include?(MoveSerie.new(6, 11))
        assert result.include?(MoveSerie.new(5, 10))
        assert result.include?(MoveSerie.new(4, 8))
      end
    end
  end
  
  # describe "solution" do
  #   it { assert_equal 25, solution([2, 3, 7, 5, 1, 3, 9], 4, 6) }
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
