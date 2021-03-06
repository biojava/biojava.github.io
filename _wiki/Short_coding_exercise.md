---
title: Short coding exercise
---

### Goal 1

This task is inspired by the pre-processing of the next generation
sequencing data.

Implement the interface

` public interface StringOverlapFinder {`  
`     String cleanX(String x, String y);`  
` }`

The cleanX function should locate the overlap of the end of x with the
beginning of y.  
The function should return the non-overlapping start of x If x does not
match the first length(x) characters of y, then return x. The minimum
overlap should be 5 or more characters.

### Goal 2

The function should be wrapped up to accept a file, from the command
line, that has two columns.

The resulting program should accept the file, feeding the function with
each element from the column and print the result to either an out file
or a standard output.

Example Command:

`  java FindEnds inputFile.txt outputFile.txt`

### Goal 3

Code under the assumption that

-   The input file does not fit into memory
-   The length of the individual strings to compare can be up to 100000
    characters (fits into memory).

### Example of Function Input and Result

x = "abcdefghijklm"

y = "hijklmnopqrst"

return: "abcdefg"

### Example Input File

`   Column_1 (x) Column_2 (y)`  
`   abcdefghijklm hijklmnopqrstuvw`  
`   aioludhfgakjn akjnopqrstuvwxuh`  
`   ......        .......`  
`   ......        .......`

There will be no header in the file and the columns are separated with a
tab character (\\t).

### Example Output

If you coding for Goal 2 or 3 to help with assessment please make sure
your program can write the "clean" output. For example for the input

`   abcdefghijklm hijklmnopqrstuvw`  
`   aioludhfgakjn akjnopqrstuvwxuh`

your program should produce the following output

`  abcdefg`  
`  aioludhfgakjn`

### Target

The target is optimal code that solves the problem correctly, therefore
there are several goals (in no particular order):

-   Code quality (maintability, reusability, OO design, etc)
-   CPU & RAM efficiency
-   Execution speed

Using multiple threads to speed up the comparison is a plus.

### Submission

Please prepare a JAR file containing the following:

-   The executable JAR containing the program. This must be called
    *runme.jar*.
-   A directory called *src*, containing all the source code and related
    parts of your project.
-   A directory called *docs*, containing a pure ASCII text file called
    *choices.txt* describing the significant design choices you made,
    uncertainties you had regarding the project, and the decisions you
    made when resolving them.
-   A directory called *docs/javadoc* containing javadoc for your
    classes.

Submit the Jar file to **gsocexercise at gmail dot com** by the 10 of
April inclusive.

Either code for one, two or all of the goals.
