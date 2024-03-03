import std.stdio;

extern(C)
{
    struct struct_stat64        // distinguish it from the stat() function
    {
        ulong st_dev;        /// device
        uint __pad1;
        uint st_ino;        /// file serial number
        uint st_mode;        /// file mode
        uint st_nlink;        /// link count
        uint st_uid;        /// user ID of file's owner
        uint st_gid;        /// user ID of group's owner
        ulong st_rdev;        /// if device then device number
        uint __pad2;
        align(8) ulong st_size;
        int st_blksize;        /// optimal I/O block size
        ulong st_blocks;        /// number of allocated 512 byte blocks
        int st_atime;
        uint st_atimensec;
        int st_mtime;
        uint st_mtimensec;
        int st_ctime;
        uint st_ctimensec;
        ulong st_ino64;
    }
}

void main()
{
    struct_stat64 test;
    writef("stat64: %s %s\n", test.sizeof, cast(ptrdiff_t)&test - cast(ptrdiff_t)&test);
    writef("stat64.st_dev: %s %s\n", test.st_dev.sizeof, cast(ptrdiff_t)&test.st_dev - cast(ptrdiff_t)&test);
    writef("stat64.__pad1: %s %s\n", test.__pad1.sizeof, cast(ptrdiff_t)&test.__pad1 - cast(ptrdiff_t)&test);
    writef("stat64.__st_ino: %s %s\n", test.st_ino.sizeof, cast(ptrdiff_t)&test.st_ino - cast(ptrdiff_t)&test);
    writef("stat64.st_mode: %s %s\n", test.st_mode.sizeof, cast(ptrdiff_t)&test.st_mode - cast(ptrdiff_t)&test);
    writef("stat64.st_nlink: %s %s\n", test.st_nlink.sizeof, cast(ptrdiff_t)&test.st_nlink - cast(ptrdiff_t)&test);
    writef("stat64.st_uid: %s %s\n", test.st_uid.sizeof, cast(ptrdiff_t)&test.st_uid - cast(ptrdiff_t)&test);
    writef("stat64.st_gid: %s %s\n", test.st_gid.sizeof, cast(ptrdiff_t)&test.st_gid - cast(ptrdiff_t)&test);
    writef("stat64.st_rdev: %s %s\n", test.st_rdev.sizeof, cast(ptrdiff_t)&test.st_rdev - cast(ptrdiff_t)&test);
    writef("stat64.__pad2: %s %s\n", test.__pad2.sizeof, cast(ptrdiff_t)&test.__pad2 - cast(ptrdiff_t)&test);
    writef("stat64.st_size: %s %s\n", test.st_size.sizeof, cast(ptrdiff_t)&test.st_size - cast(ptrdiff_t)&test);
    writef("stat64.st_blksize: %s %s\n", test.st_blksize.sizeof, cast(ptrdiff_t)&test.st_blksize - cast(ptrdiff_t)&test);
    writef("stat64.st_blocks: %s %s\n", test.st_blocks.sizeof, cast(ptrdiff_t)&test.st_blocks - cast(ptrdiff_t)&test);
    writef("stat64.st_atime: %s %s\n", test.st_atime.sizeof, cast(ptrdiff_t)&test.st_atime - cast(ptrdiff_t)&test);
    writef("stat64.st_atimensec: %s %s\n", test.st_atimensec.sizeof, cast(ptrdiff_t)&test.st_atimensec - cast(ptrdiff_t)&test);
    writef("stat64.st_mtime: %s %s\n", test.st_mtime.sizeof, cast(ptrdiff_t)&test.st_mtime - cast(ptrdiff_t)&test);
    writef("stat64.st_mtimensec: %s %s\n", test.st_mtimensec.sizeof, cast(ptrdiff_t)&test.st_mtimensec - cast(ptrdiff_t)&test);
    writef("stat64.st_ctime: %s %s\n", test.st_ctime.sizeof, cast(ptrdiff_t)&test.st_ctime - cast(ptrdiff_t)&test);
    writef("stat64.st_ctimensec: %s %s\n", test.st_ctimensec.sizeof, cast(ptrdiff_t)&test.st_ctimensec - cast(ptrdiff_t)&test);
    writef("stat64.st_ino64: %s %s\n", test.st_ino64.sizeof, cast(ptrdiff_t)&test.st_ino64 - cast(ptrdiff_t)&test);
    return;
}
