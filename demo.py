import sys
from dillloop import libdill

print("msleep() for 1 second...",)
deadline = libdill.now() + 1000
libdill.msleep(deadline)
print("Done\n\n")

print("Testing channel with ints")
print("This doesn't work yet...")
ch = libdill.chmake(sys.getsizeof(int()))
deadline = libdill.now() + 1000
print("Sending 42...");
libdill.chsend(ch, 42, deadline)

# obviously doesn't work as val isn't passed by reference
val = 0
deadline = libdill.now() + 1000
rc = libdill.chrecv(ch, val, deadline)
print(rc, "Result = {}".format(val))

