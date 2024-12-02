# read file 'input' and split each row
def read_input():
    with open('day02/input', 'r') as f:
        return f.read().splitlines()

lines = read_input()
lines = [[int(c) for c in s.split()] for s in lines]
print(lines)

with open('day02/formatted_input', 'w') as f:
    f.write(str(lines))
