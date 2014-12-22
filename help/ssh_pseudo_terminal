Forcing pseudo terminal on ssh command execution
You already know how to execute a command on a remote computer via ssh.

The syntax is like this:

$ ssh peter@192.168.1.112 
This will work if the command is simply piping output, for example, ls.

If the command is "screen-based" in that it interprets user input, you may get an error. The following shows what happens when you ssh to run such programs (e.g., top, emacs, screen).

$ ssh peter@192.168.1.112 top
peter@192.168.1.112's password: 
TERM environment variable not set.
$ ssh peter@192.168.1.112 emacs
peter@192.168.1.112's password: 
emacs: standard input is not a tty
$ ssh peter@192.168.1.112 screen
peter@192.168.1.112's password: 
Must be connected to a terminal.
Here is a high-level explanation of what is happening behind the scene.

When you run ssh without a command just to login, a pseudo tty is automatically allocated. But if you specify a command to execute on the ssh command line, by default, ssh does not allocate a pseudo tty. You need to force it to allocate one if you want to run commands such as top or screen. This you do by giving the -t parameter to ssh.

$ ssh -t peter@192.168.1.112 top
peter@192.168.1.112's password: 
top - 11:09:46 up 133 days, 13:44,  5 users,  load average: 0.00, 0.00, 0.00
Tasks: 201 total,   1 running, 200 sleeping,   0 stopped,   0 zombie
Cpu(s):  0.0%us,  0.2%sy,  0.0%ni, 99.8%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Mem:   1938896k total,  1466144k used,   472752k free,   592508k buffers
Swap:        0k total,        0k used,        0k free,   508120k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
22176 peter     20   0  2856 1296  984 R  0.3  0.1   0:00.07 top
    1 root      20   0  3944  572  332 S  0.0  0.0   0:02.80 init
    2 root      20   0     0    0    0 S  0.0  0.0   0:00.17 kthreadd
    3 root      RT   0     0    0    0 S  0.0  0.0   0:09.22 migration/0
    4 root      20   0     0    0    0 S  0.0  0.0 406:20.92 ksoftirqd/0
    5 root      RT   0     0    0    0 S  0.0  0.0   0:00.03 migration/0
In summary, if you run ssh with a command argument to execute on a remote server, and you see an error message that suggests a terminal is not configured, run it again with the -t parameter.
