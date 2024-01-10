# TCL File processor script demo

A demo file reader project to process text files line by line, utilizing a variety of TCL language syntax techniques

## Rules

The script processes the file as following

### Valid lines

- Integer value
- Float value
- Lines that start with a non-number character

### Invalid lines

- Empty lines
- String lines that start with a number

## Line processing

- The scripts runs over all lines
- Each line is printed along with its index
- Invalid lines are replaced with `INVALID LINE` instead, and their length is ignored
- Integer lines
  - Odd values are divided by `2.0` then printed
  - Even values are multiplied by `3.75` then printed
  - The length of the integer lines are the **original lengths** of the integers before performing operations on them
- String lines are printed as they are, along with their lengths

> [!NOTE]
> The odd values are divided by `2.0` to ensure a float resultant value, dividing by only `2` would result in a roundup integer value

## Post processing data

- Sum of the first two **original** occurring integer lines
- Concatenation of the first three occurring string lines
- Max **original** integer value
- Minimum string length
- Number of line occurrences for each of
  - Strings
  - Odd integers
  - Even integers
  - Invalid

## Execution

- Make sure you have tcl version `8.4` or later
- Modify `input.txt` optionally according to your needs
- Open command terminal
- Run `tclsh script.tcl`

## Output example

This is the output of the given `input.txt` file example

```
Line 1:
1.5
- length: 1

Line 2:
line 1
- length: 6

Line 3:
INVALID LINE

Line 4:
6.5
- length: 1

Line 5:
2.5
- length: 1

Line 6:
INVALID LINE

Line 7:
#!@$^:{}
- length: 8

Line 8:
INVALID LINE

Line 9:
27.6
- length: 4

Line 10:
line3
- length: 5

- Sum of first two numbers: 5
- Concatenation of first three strings: line 1 #!@$^:{} 27.6
- Max number value: 5
- Minimum string length: 1
- Number of lines:
  - String: 4
  - Odd number: 2
  - Even number: 1
  - Invalid: 3
```