# read file 'input' and split each row
def read_input():
    with open('input', 'r') as f:
        return f.read().splitlines()

lines = read_input()
lines = [s.split() for s in lines]
print(lines)

left = []
right = []
for line in lines:
    left.append(int(line[0]))
    right.append(int(line[1]))

print(left)
print(right)

with open('left', 'w') as f:
    f.write(str(left))

with open('right', 'w') as f:
    f.write(str(right))
