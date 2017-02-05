from libc.stdint cimport int64_t

cdef extern from "libdill.h":

    # helpers
    int64_t now()

    # TODO expose errno

    # handles
    int hdup(int h)
    int hclose(int h)

    # coroutines
    # TODO figure out how to deal with how coroutines are #defined
    # coroutine go(void *fn)
    # TODO yield is overloaded in python
    # int yield()
    int msleep(int64_t deadline)
    int fdclean(int fd)
    int fdin(int fd, int64_t deadline)
    int fdout(int fd, int64_t deadline)

    # channels
    int chmake(size_t itemsz)
    int chsend(int ch, const void *val, size_t len, int64_t deadline)
    int chrecv(int ch, void *val, size_t len, int64_t deadline)
    int chdone(int ch)

