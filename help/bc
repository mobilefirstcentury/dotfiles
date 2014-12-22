
Running bc will put you in interactive mode by default. You type in statements, and it returns the answer.
$ bc
5 * 3
15
$

The same calculation can be done non-interactively.
$ echo '5 * 3' | bc
15


By default, division returns truncated whole numbers.
$ bc
10 / 3
3

You can define the number of decimal places you want in the answer. This is the "scale".
$ bc
scale=2
10 / 3
3.33

Alternatively, you can invoke the bc command with -l. This preloads the math library and the default scale is set to 20. 
$ bc -l
10 / 3
3.33333333333333333333

You can convert a number from one base (ibase) to another base (obase). The default ibase and obase are base 10.

To convert the number 255 in base 10 to base 2, 
$echo 'obase=2; 255' | bc
11111111

In reverse,
$ echo 'ibase=2; 11111111' | bc
255
