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

p rec_range(10, 20)   

def exp(num, power)
    return 1 if power == 0
    num * exp(num, power - 1)
end

# recursion 1
# b = 5
# p exp(b, 0) # = 1
# p exp(b, 3) # = b * exp(b, n - 1)

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
