
Dictionary Lookup via Command Line

#curl dict://dict.org/d:YourWord
To help you remember, d: stands for DEFINE.

For example, to look up the word "bash", (all output in this article are greatly abbreviated for clarity)
# curl dict://dict.org/d:bash
151 "Bash" gcide "The Collaborative International Dictionary of English v.0.48"
Bash \Bash\, n.
1. a forceful blow, especially one that does damage to its
target.
[PJC]
2. a elaborate or lively social gathering or party.
[PJC]


The dict.org web site supports 77 dictionaries. To list them:
#curl dict://dict.org/show:db

So, if you want to know the computer meaning of "bash", specify foldoc "The Free On-line Dictionary of Computing" like this:
#curl dict://dict.org/d:bash:foldoc
151 "bash" foldoc "The Free On-line Dictionary of Computing (27 SEP 03)"
bash
Bourne Again SHell. {GNU}'s {command interpreter} for {Unix}.
Bash is a {Posix}-compatible {shell} with full {Bourne shell}
syntax, and some {C shell} commands built in. The Bourne
Again Shell supports {Emacs}-style command-line editing, job
control, functions, and on-line help. Written by Brian Fox of
{UCSB}.

To display results from all libraries, do this:
#curl dict://dict.org/d:bash:*


Fuzzy matching is also possible. Replace the "d" or Define command with "m" which stands for MATCH.
#curl dict://dict.org/m:bash

With the match command, you can also specify the strategy such as exact, prefix, suffix, or even soundex.

#curl dict://dict.org/m:bash::prefix 
gcide "Bash"
gcide "Bashed"
gcide "Bashful"
gcide "bashful Billy"


To list all supported strategies:
#curl dict://dict.org/show:strat
