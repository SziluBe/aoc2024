# read file 'input' and split each row
def read_input():
    with open('day04/input', 'r') as f:
        return f.read().splitlines()
    
lines = read_input()

print(lines)

with open('day04/lines', 'w') as f:
    f.write(str(lines))
