---
title: Short coding exercise
---

**Goal 1:**

Create a function that can accept two strings (x, y). The function
should then locate the overlap of the end of x with the beginning of
y.  
The function should return the non-overlapping start of x If x does not
match the first length(x) characters of y, then return x.  
Further particulars:

-   The minimum overlap should be 5 or more characters.
-   The character set is a to z, all in lower case.
-   Miss matches are not allowed
-   The cross over is between the end of x and the start of y.

**Goal 2:**

The function should be nicely wrapped up to accept a file, from the
command line, that has two columns.

The resulting program should accept the file, feeding the function with
each element from the column and print the result to an out file, the
name specific at the command line.

Example Command:

`  java FindEnds inputFile.txt outputFile.txt`

**Goal 3:**

Code under the assumption that

-   The input file does not fit into memory
-   The length of the individual strings to compare can be up to 100000
    characters (fits into memory).

**Example of Function Input and Result:**

x = "abcdefghijklm"

y = "hijklmnopqrst"

return: "abcdefg"

**Example Input File:**

`   Column_1 (x) Column_2 (y)`  
`   abcdefghijklm hijklmnopqrstuvw`  
`   aioludhfgakjn akjnopqrstuvwxuh`  
`   ......        .......`  
`   ......        .......`

There will be no header in the file and the columns are separated with a
tab character (\\t).

**Target:**

The target is optimal code, therefore there are several goals (in no
particular order):

-   CPU efficiency
-   RAM efficiency
-   Code quality (maintability, reusability, OO design, etc)

Using multiple threads to speed up the comparison is a plus

Either code for one, two or all of the goals.
