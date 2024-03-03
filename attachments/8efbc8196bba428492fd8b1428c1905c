#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdio.h>
#include <stddef.h>

int main(void)
{
    struct stat64 test;
    printf("sizeof(stat64): %d %d\n", sizeof(test), (ptrdiff_t)&test - (ptrdiff_t)&test);
    printf("sizeof(stat64.st_dev): %d %d\n", sizeof(test.st_dev), (ptrdiff_t)&test.st_dev - (ptrdiff_t)&test);
    printf("sizeof(stat64.__pad1): %d %d\n", sizeof(test.__pad1), (ptrdiff_t)&test.__pad1 - (ptrdiff_t)&test);
    printf("sizeof(stat64.__st_ino): %d %d\n", sizeof(test.__st_ino), (ptrdiff_t)&test.__st_ino - (ptrdiff_t)&test);
    printf("sizeof(stat64.st_mode): %d %d\n", sizeof(test.st_mode), (ptrdiff_t)&test.st_mode - (ptrdiff_t)&test);
    printf("sizeof(stat64.st_nlink): %d %d\n", sizeof(test.st_nlink), (ptrdiff_t)&test.st_nlink - (ptrdiff_t)&test);
    printf("sizeof(stat64.st_uid): %d %d\n", sizeof(test.st_uid), (ptrdiff_t)&test.st_uid - (ptrdiff_t)&test);
    printf("sizeof(stat64.st_gid): %d %d\n", sizeof(test.st_gid), (ptrdiff_t)&test.st_gid - (ptrdiff_t)&test);
    printf("sizeof(stat64.st_rdev): %d %d\n", sizeof(test.st_rdev), (ptrdiff_t)&test.st_rdev - (ptrdiff_t)&test);
    printf("sizeof(stat64.__pad2): %d %d\n", sizeof(test.__pad2), (ptrdiff_t)&test.__pad2 - (ptrdiff_t)&test);
    printf("sizeof(stat64.st_size): %d %d\n", sizeof(test.st_size), (ptrdiff_t)&test.st_size - (ptrdiff_t)&test);
    printf("sizeof(stat64.st_blksize): %d %d\n", sizeof(test.st_blksize), (ptrdiff_t)&test.st_blksize - (ptrdiff_t)&test);
    printf("sizeof(stat64.st_blocks): %d %d\n", sizeof(test.st_blocks), (ptrdiff_t)&test.st_blocks - (ptrdiff_t)&test);
#ifdef __USE_MISC
    printf("sizeof(stat64.st_atim): %d %d\n", sizeof(test.st_atim), (ptrdiff_t)&test.st_atim - (ptrdiff_t)&test);
    printf("sizeof(stat64.st_mtim): %d %d\n", sizeof(test.st_mtim), (ptrdiff_t)&test.st_mtim - (ptrdiff_t)&test);
    printf("sizeof(stat64.st_ctim): %d %d\n", sizeof(test.st_ctim), (ptrdiff_t)&test.st_ctim - (ptrdiff_t)&test);
#else
    printf("sizeof(stat64.st_atime): %d %d\n", sizeof(test.st_atime), (ptrdiff_t)&test.st_atime - (ptrdiff_t)&test);
    printf("sizeof(stat64.st_atimensec): %d %d\n", sizeof(test.st_atimensec), (ptrdiff_t)&test.st_atimensec - (ptrdiff_t)&test);
    printf("sizeof(stat64.st_mtime): %d %d\n", sizeof(test.st_mtime), (ptrdiff_t)&test.st_mtime - (ptrdiff_t)&test);
    printf("sizeof(stat64.st_mtimensec): %d %d\n", sizeof(test.st_mtimensec), (ptrdiff_t)&test.st_mtimensec - (ptrdiff_t)&test);
    printf("sizeof(stat64.st_ctime): %d %d\n", sizeof(test.st_ctime), (ptrdiff_t)&test.st_ctime - (ptrdiff_t)&test);
    printf("sizeof(stat64.st_ctimensec): %d %d\n", sizeof(test.st_ctimensec), (ptrdiff_t)&test.st_ctimensec - (ptrdiff_t)&test);
#endif
    printf("sizeof(stat64.st_ino): %d %d\n", sizeof(test.st_ino), (ptrdiff_t)&test.st_ino - (ptrdiff_t)&test);
    return 0;
}

