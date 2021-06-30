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

p rec_range(10, 20)   


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


# recursion 1
num = 2

# p exp(b, 0) # = 1
# p exp(b, 3) # = b * exp(b, n - 1)

# recursion 2
p exp(num, 0) #= 1
p exp(num, 1) #= num
p exp(num, 2) #= exp(num, n / 2) ** 2             #[for even n]
p exp(num, 5) #= b * (exp(b, (n - 1) / 2) ** 2) #[for odd n]
