#!/usr/bin/env python3

die = ["⚀", "⚁", "⚂", "⚃", "⚄", "⚅"]

for i in die:
    print(i)

#Print row formatting
def formatLine():
    print("+", end="")
    for i in range(0,len(die)):
        print("-----+", end="")
    print()

#Print row
def printRow(side1):
    print("| ", end="")
    for side2 in die:
        print(side1, side2, "|", end=" ")
    print()

formatLine()
for side1 in die:
    printRow(side1)
    formatLine()
