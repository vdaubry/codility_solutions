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

def difference(array, partition_index)
  difference = first_part(array, partition_index).sum - second_part(array, partition_index).sum
  difference.abs
end

def minimal_difference(array)
  result = nil
  array.each_with_index do |value, index|
    next if index == array.count - 1
    current_difference = difference(array, index+1)
    result = current_difference if result.nil? || current_difference < result
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

result = difference(array, 1)
raise "invalid result : #{result}" unless result == 7

result = difference(array, 2)
raise "invalid result : #{result}" unless result == 5

result = minimal_difference(array)
raise "invalid result : #{result}" unless result == 1

array = [-3, -1, -2, -4, -3]
result = minimal_difference(array)
raise "invalid result : #{result}" unless result == 1

array = [-1000, 1000]
result = minimal_difference(array)
raise "invalid result : #{result}" unless result == 2000

array = [rand(100)]*10000
Timeout::timeout(1) {
  minimal_difference(array)
}

puts "Good !"