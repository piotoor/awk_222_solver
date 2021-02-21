## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [How to run](#run)

## General info
This project is a simple 2x2x2 Rubik's cube solver written in awk.
It can solve any valid 2x2x2 state using L, L', L2, F, F', F2, U, U', U2 moves.

### Limitations
It treats DRB piece as solved and can only move the remaining ones.
Be careful not to specify the aforementioned piece as an unsolved one.
The solver will then run forever.

## Technologies
* awk

## Setup
To run the solver you need awk installed.

## How to run
### Input state
Cube state is defined as a string of 16 digits separated by spaces.
The first 8 digits define pieces orientation (CO). The last 8 digits define
pieces permutation (CP). Like so:

```
0 0 0 0 1 2 0 0 0 1 2 3 4 5 6 7
|<-----CO----->|<-----CP----->|
```

Both CO and CP are defined in the following order:
```
URF UFL ULB UBR DFR DLF DBL DRB
```
Valid CO values:
* 0 (piece oriented correctly)
* 1 (piece needs 1 clockwise rotation to be oriented correctly)
* 2 (piece needs 2 clockwise rotations to be oriented correctly)
* The sum of all orientations must be divisible by 3.

Valid CP values:
Digits from 0 to 7 inclusive.
Every piece has its unique number:
```
URF - 0
UFL - 1
ULB - 2
UBR - 3
DFR - 4
DLF - 5
DBL - 6
DRB - 7
```

A solved cube looks like this:
```
0 0 0 0 0 0 0 0 0 1 2 3 4 5 6 7
|<-----CO----->|<-----CP----->|
```
All pieces are correctly oriented and every piece is in its proper location.

### Some valid inputs
```
0 0 0 0 1 2 0 0 0 1 2 3 4 5 6 7
1 1 1 0 1 2 0 0 0 1 2 3 4 6 5 7
1 1 1 2 1 0 0 0 1 3 2 0 4 6 5 7
```

### How to run the solver
For a single solve you can just pipe the input to the script, like so:
```
echo "1 1 1 0 0 0 0 0 0 1 2 3 4 5 6 7" | awk -f 222_solver.awk
```

If you want to solve more cubes, create a text file containing your cubes.
Each cube in a separate line. And then run:

```
cat cube1.txt | awk -f 222_solver.awk
```

Example output:
```
Cube 1
0 0 0 0 1 2 0 0 0 1 2 3 4 5 6 7
|<-----CO----->|<-----CP----->|
Solution: F U2 L2 Fi Ui F Li F Li U

Cube 2
1 1 1 0 1 2 0 0 0 1 2 3 4 6 5 7
|<-----CO----->|<-----CP----->|
Solution: F L Fi U L2 Ui L2 F L

Cube 3
1 1 1 2 1 0 0 0 1 3 2 0 4 6 5 7
|<-----CO----->|<-----CP----->|
Solution: L2 F L2 F2 L U L2 Fi Ui
```
