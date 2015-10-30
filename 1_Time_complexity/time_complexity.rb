#!/usr/bin/env ruby
require 'timeout'

def sum(n)
  (n+1).times.inject(0) {|i, res| res+=i}
end

def run(n)
  sum(n)
end


result = run(3)
raise "invalid result : #{result}" unless result == (1+2+3)

result = run(6)
raise "invalid result : #{result}" unless result == (1+2+3+4+5+6)

result = run(0)
raise "invalid result : #{result}" unless result == 0

Timeout::timeout(1) {
  run(6000000)
}

puts "Good !"