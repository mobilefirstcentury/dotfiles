It simply times how long a command takes to run, and gives you 3 statistics:

Elapsed real time (in seconds).
Total number of CPU-seconds that the command spent in user mode.
Total number of CPU-seconds that the command spent in kernel mode. 


I use time a lot to benchmark network performance, e.g.,
$ time scp some-file  peter@192.168.22.104:/home/peter/some/location/
real    0m17.742s
user    0m0.364s
sys     0m0.476s


You can be creative with time, and run it like this:
$ time cat 


What does it do? It starts a timer, and stops when you enter Control D (to terminate the input stream to the cat command). It is a quick timer.
