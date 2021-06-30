require "byebug"

def iterative_range(start, finish)
    new_arr = []
    (start...finish).each { |i| new_arr << i }
    new_arr
end
# p iterative_range(1, -3)
# p iterative_range(0, 10)


def rec_range(start, finish)                # eval to []
    return [] if start >= finish            
    [start] + rec_range(start + 1, finish)  # [1] + rec_range(2, 5) # [1, 2] + rec_range(3, 5)  
end

# p rec_range(10, 20)   

# first version
def exp_1(num, power)
    return 1 if power == 0
    num * exp(num, power - 1)
end

def exp(num, power)
    return 1 if power == 0
    return num if power == 1
    (power.even?) ? (exp(num, power / 2) ** 2) :  num * (exp(num, (power - 1) / 2) ** 2)
end
# recursion 2
# p exp(num, 0) #= 1
# p exp(num, 1) #= num
# p exp(num, 2) #= exp(num, n / 2) ** 2             #[for even n]
# p exp(num, 5) #= b * (exp(b, (n - 1) / 2) ** 2) #[for odd n]

# recursion 1
# num = 2

# p exp(b, 0) # = 1
# p exp(b, 3) # = b * exp(b, n - 1)

class Array
    def deep_dup
        array = []
        return [] if self.length == 0
        self.each do |ele|
            if ele.is_a?(Array)
                array << ele.deep_dup
            else
                array << ele
            end
        end
        array
    end
end

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.deep_dup
# # p robot_parts_copy

# # # shouldn't modify robot_parts
# p robot_parts_copy[1] << "LEDs"
# # # but it does
# p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

# fibonacci

def fibonacci(n)
    raise "negative number error = #{n}" if n < 0
    return [0, 1].take(n) if n < 3
    arr = fibonacci(n - 1)
    arr << arr[-1] + arr[-2]
end 

# p fibonacci(-3)
# p fibonacci(4)

def binary_search(array, target)
    return nil if array.length == 0
    half = array.length / 2
    return half if array[half] == target
    if array[half] < target
        return binary_search(array[half..-1], target) + half
    else
        return binary_search(array[0...half], target) 
    end
end

# p binary_search([1, 2, 3], 1) # => 0
# p binary_search([2, 3, 4, 5], 3) # => 1
# p binary_search([2, 4, 6, 8, 10], 6) # => 2
# p binary_search([1, 3, 4, 5, 9], 5) # => 3
# p binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
# p binary_search([1, 2, 3, 4, 5, 6], 0) # => nil

p binary_search([1, 2, 3, 4, 5, 7], 6) # => nil
