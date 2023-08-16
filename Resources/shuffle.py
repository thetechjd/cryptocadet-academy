import random 
import os


newNames = []

files = os.listdir("./test_metadata")

print(files)

old = "./test_metadata/"


counter = 1

while len(files) != 0:
    y = random.randint(0, len(files) - 1)


    os.rename(old + files[y], old + "" + str(counter) + ".json")

    newNames.append(files[y])
    counter = counter + 1
    files.pop(y)


print(newNames)


