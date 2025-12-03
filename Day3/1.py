file = open("./input", "r")

content = file.read().splitlines()

# We find the highest 2 numbers that follow eachother (breaks are allowed) and concat them together to form a new number, then we sum all those numbers

count = 0
for line in content:
    # Find the highest number in the line and the highest number thats in the remaining part of the line
    numbers = list(map(int, list(line)))
    print(numbers)
    max_num = max(numbers)
    print(max_num)
    # Find the highest number that occurs after the first max number
    max_index = numbers.index(max_num)
    remaining_numbers = numbers[max_index + 1:]
    if remaining_numbers:
        second_max_num = max(remaining_numbers)
        print(second_max_num)
        count += int(str(max_num) + str(second_max_num))
    else:
        # Make the second highest number the max number instead, then find the highest number after that
        numbers.remove(max_num)
        second_max_num = max(numbers)
        count += int(str(second_max_num) + str(max_num))