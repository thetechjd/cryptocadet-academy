import os

f = open('../Resources/winners.txt', 'r')
lines = f.readlines()


addresses = []

for line in lines:
    line = line.rstrip("\n")

    if '0x' in line:
        addresses.append(line)


print(addresses)



