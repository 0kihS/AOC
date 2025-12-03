# instead of 2 we find the 12 highest digits while staying in order
# AKA the lexicographically largest possible 12-digit subsequence.
file = open("./input", "r")

content = file.read().splitlines()
count = 0
for line in content:
    result = []
    start = 0
    for remaining in range(12, 0, -1): # We need to pick 'remaining' more digits
        window_end = len(line) - remaining + 1 # After the window end, we can't pick any digits to still have enough leftover
        best_digit = max(line[start:window_end]) # We pick the highest within our window
        pos = line.index(best_digit, start, window_end)
        result.append(best_digit)
        start = pos + 1 # We find the highest digit after the one we just picked
    count += int(''.join(result))
        
print(count)