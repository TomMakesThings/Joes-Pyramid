<div align="center">
  <h1>▲ Joe's Pyramid ▲</h1>
  <img src="https://images.weserv.nl/?url=avatars.githubusercontent.com/u/61354833?v=4&h=100&w=100&fit=cover&mask=circle&maxage=7d">
  <p><b>Code by <a href="https://github.com/TomMakesThings">TomMakesThings</a></b></p>
  <p><b><sub>October 2021</sub></b></p>
</div>

---

## The Problem
Joe’s pyramid is a puzzle in which very stone is marked with a different one or two digit positive number. Where a stone rests on two others, its number is the sum of the numbers marked on the two stones on which it rests. The challenge is to find the value of the top stone **X**. Assuming zero may not be used, this gives 99 possible values for each stone. For the lowest level alone, using the permutations formula gives 806 billion possible permutations. Therefore it is intractable to solve the problem through brute force.

<img src="https://github.com/TomMakesThings/Joes-Pyramid/blob/assets/Images/Joes-Pyramid.png" width=550>

## Solving the Puzzle
### Constraints
The first step is to mark each stone on the lowest level with a, b, c, d, e, f. The contributions of each lower stone to the **X** are not equal with those closer to the middle contributing more.

**X** = a + 5b + 10c + 10d + 5e + f

<img src="https://github.com/TomMakesThings/Joes-Pyramid/blob/assets/Images/Pyramid-Letters.png" width=550>

As each stone can have a maximum of two digit, **X** cannot exceed 99.

a + 5(b + 2c + 2d + e) + f ≤ 99

Using the smallest possible values for 5(b + 2c + 2d + e), i.e., b = 3, c = 1, d = 2, e = 4

5 × 3 + 10 + 2 × 10 + 4 × 5 = 65

Since these must be a multiple of 5
65 ≤ 5(b + 2c + 2d + e) ≤ 95
99 - 65 = 34
4 ≤ a + f ≤ 34

As 1, 2, 3, 4 are taken, then for this equation to equal 34, a = 5, f = 29.
Therefore a ≤ 29 and f ≤ 29.

Plugging a = 4, c = 1, d = 2, e = 3, f = 5

4 + 10 + 2 × 10 + 3 × 5 + 5 = 54

99 - 54 = 45

5 b ≤ 45

Therefore, b ≤ 9, e ≤ 9

Similarly, with a = 4, b = 2, d = 1, e = 3, f = 5

4 + 2 × 5 + 10 + 3 × 5 + 5 = 44

99 - 44 = 55

55/10 = 5.5

Therefore, c < 6 and d < 6

### Code
To find the solutions, I created an R script [JoesPyramid.R](https://github.com/TomMakesThings/Joes-Pyramid/blob/main/JoesPyramid.R) that iterates over constrained values for {a,b,c,d,e,f}. The value of each is compared with the others and if a value appears twice the loop is skipped. After a unique set of values if found, then a checkpoint ensures that a + 5b + 10c + 10d + 5e + f < 100. If the condition is met, the program attempts to calculate values for each stone by summing adjacent stones in the layer below. If none of the numbers are repeated, they are returned as a solution.

## Solution
There are two arrangements of the stones that satisfy all the constraints. In both cases, the pyramid is symmetrical and **X** = 98.

<img src="https://github.com/TomMakesThings/Joes-Pyramid/blob/assets/Images/Pyramid-Solved.png" width=550>
<img src="https://github.com/TomMakesThings/Joes-Pyramid/blob/assets/Images/Pyramid-Solved-2.png" width=550>
