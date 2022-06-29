# Chapter 1 exercises

The exercises in this chapter do not involve programming of any sort.

## Exercise 1

```
$ cat <<EOF > ex1.pl
> #!/usr/bin/env perl
> print "Hello, world!\n";
EOF

$ perl ./ex1.pl
```

## Exercise 2

```
$ perldoc -u -f atan2
```

## Exercise 3

```
$ cat <<EOF > ex3.pl
> #!/usr/bin/perl
> @lines = `perldoc -u -f atan2`;
> foreach (@lines) {
> 	s/\w<([^>]+)>/\U$1/g;
> 	print;
> }
> EOF

$ perl ./ex3.pl
```

### Explanation

ex3.pl reads `perldoc -u -f atan2` into the `@lines` array. Then it
iterates through it with a for loop. A pattern match for a word
character followed by `<`, 1 or more characters following that not
including `>`, and finally `>`, is performed. The capture represented by
`$1` (everything between the angle brackets) is turned entirely into
uppercase, and the pattern match is replaced with the resulting output.
Then the line is printed and the program continues to iterate until end
of file is reached.
