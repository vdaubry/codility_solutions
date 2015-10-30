#!/usr/bin/env ruby
require 'timeout'

#######
#
# Helpers
#
######
class Array
  def sum
    self.reduce(:+)
  end
end

def first_part(array, partition_index)
  array[0..partition_index-1]
end

def second_part(array, partition_index)
  array[partition_index..-1]
end

def minimal_difference(array)
  first_part_sum = first_part(array, 1).sum
  second_part_sum = second_part(array, 1).sum
  result = (first_part_sum - second_part_sum).abs
  
  array.each_with_index do |value, index|
    next if index < 1 || index == array.count - 1
    first_part_sum += value
    second_part_sum -= value
    current_difference = (first_part_sum - second_part_sum).abs
    result = current_difference if current_difference < result
  end
  result
end

def solution(a)
  minimal_difference(a)
end


array = [3, 1, 2, 4, 3]
result = first_part(array, 1)
raise "invalid result : #{result}" unless result == [3]

result = second_part(array, 1)
raise "invalid result : #{result}" unless result == [1, 2, 4, 3]


result = minimal_difference(array)
raise "invalid result : #{result}" unless result == 1

array = [-3, -1, -2, -4, -3]
result = minimal_difference(array)
raise "invalid result : #{result}" unless result == 1

array = [-1000, 1000]
result = minimal_difference(array)
raise "invalid result : #{result}" unless result == 2000

array = [rand(100)]*100000
Timeout::timeout(1) {
  minimal_difference(array)
}

puts "Good !"