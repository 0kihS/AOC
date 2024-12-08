with open('input.txt', 'r') as file:
    # Read each line in the file
    left = []
    right = []
    d = 0
    for line in file:
        left.append(int(line.split()[0]))
        right.append(int(line.split()[1]))
    left.sort()
    right.sort()
    for i in range(len(left)) :
        for j in range(len(right)) :
            if left[i] == right[j] :
                d += left[i]
    print(d)
