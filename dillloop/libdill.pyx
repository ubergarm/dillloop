cimport clibdill
from libc.stdint cimport int64_t


# helpers
def now():
    return <int64_t> clibdill.now()

# handles
def hdup(int h):
    return <int> clibdill.hdup(h)
def hclose(int h):
    return <int> clibdill.hclose(h)

# coroutines
# coroutine go(void *fn)
# cpdef int yield(void):
#     return <int> clibdill.yield()

def msleep(int64_t deadline):
    return <int> clibdill.msleep(deadline)

def fdclean(int fd):
    return <int> clibdill.fdclean(fd)

def fdin(int fd, int64_t deadline):
    return <int> clibdill.fdin(fd, deadline)

def fdout(int fd, int64_t deadline):
    return <int> clibdill.fdout(fd, deadline)

# channels
# only support int channels for testing
# http://cython.readthedocs.io/en/latest/src/tutorial/clibraries.html#mapping-functionality
def chmake(ssize_t itemsz):
    # return <int> clibdill.chmake(itemsz)
    return <int> clibdill.chmake(sizeof(int))

# TODO support arbitrary object types in channels
def chsend(int ch, int val, int64_t deadline):
    cdef int c_val = <int> val;
    print(c_val)
    return <int> clibdill.chsend(ch, &c_val, sizeof(c_val), deadline)

# TODO this doesnt work yet
def chrecv(int ch, int val, int64_t deadline):
    cdef int c_val = 0;
    rc = <int> clibdill.chrecv(ch, &c_val, sizeof(c_val), deadline)
    print(c_val)
    return rc

def chdone(int ch):
    return <int> clibdill.chdone(ch)
