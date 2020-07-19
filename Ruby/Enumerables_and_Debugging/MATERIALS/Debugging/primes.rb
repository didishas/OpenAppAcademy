require 'byebug'

def prime?(num)
  debugger

  (2...num).each do |idx|
    if num % idx == 0
      return false
    end
  end
  return true
end

def primes(num_primes)
  ps = []
  num = 2
  while ps.count < num_primes
    ps << num if prime?(num)
    num += 1
  end
  ps
end

primes(35)

if __FILE__ == $PROGRAM_NAME
  puts primes(100)
end
