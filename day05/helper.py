with open("day05/rules", "r") as file:
    rules = file.read().splitlines()

rules = [rule.split("|") for rule in rules]

with open("day05/rules_processed", "w") as file:
    file.write(str([(int(rule[0]), int(rule[1])) for rule in rules]))

with open("day05/updates", "r") as file:
    updatess = file.read().splitlines()

updatess = [update.split(",") for update in updatess]

with open("day05/updates_processed", "w") as file:
    file.write(str([list(map(int, updates)) for updates in updatess]))
