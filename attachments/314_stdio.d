enum KeepTerminator : bool { no, yes }

struct File
{
    @property bool isOpen(){}

    struct ByLine(Char, Terminator)
    {
        File file;
        KeepTerminator keepTerminator;

        @property bool empty()         {
            return !file.isOpen;
        }

        @property Char[] front()
        {
            return (Char[]).init;
        }

        void popFront()
        {
        }
    }

    ByLine!(Char, Terminator) byLine(Terminator = char, Char = char)()
    {
        return typeof(return)();
    }

}

