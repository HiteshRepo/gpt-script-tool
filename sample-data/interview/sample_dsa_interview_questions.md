## Question-1
**Problem**: Coordinated Goroutine Printing
Write a Go program that prints numbers 1 through 10 using exactly 3 goroutines. The goroutines must coordinate to ensure the numbers are printed in sequential order, with each goroutine taking turns in a round-robin fashion.

**Expected Output**:
go-routine-1: 1
go-routine-2: 2
go-routine-3: 3
go-routine-1: 4
go-routine-2: 5
go-routine-3: 6
go-routine-1: 7
go-routine-2: 8
go-routine-3: 9
go-routine-1: 10

## Question-2
**Problem**: Merge Two Sorted Arrays
You are given two sorted arrays A and B. Write a function to merge them into a single sorted array res that contains all elements from both arrays.

**Given**:
Array A: [2, 4, 7] (sorted in ascending order)
Array B: [3, 6, 9, 13] (sorted in ascending order)

**Expected Output**:
Merged array: [2, 3, 4, 6, 7, 9, 13]