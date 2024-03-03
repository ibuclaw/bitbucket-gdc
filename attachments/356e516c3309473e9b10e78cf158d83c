ref T front(T)(T[] a)
{
    return a[0];
}

template binaryFun(alias funbody, string parm1Name = "a",
        string parm2Name = "b")
{
    alias binaryFunImpl!(funbody, parm1Name, parm2Name).result binaryFun;
}

template binaryFunImpl(alias fun,
        string parm1Name, string parm2Name)
{
        alias fun result;
}


struct BinaryHeap(Store, alias less = "a < b")
{
    // Comparison predicate
    private alias binaryFun!(less) comp;
    // Assuming the element at index i perturbs the heap property in
    // store r, percolates it down the heap such that the heap
    // property is restored.
    private void percolateDown(Store r, size_t i, )
    {
            auto left = i * 2 + 1, right = left + 1;
            auto largest = comp(r[i], r[left])
                ?comp(r[left], r[right])                 :comp(r[i], r[right]) ;
    }

    void removeFront()
    {
    }
}

struct Tuple(Specs...)
{
}

template ElementType(R)
{
    alias typeof(R.front) ElementType;
}

void topNCopy(alias less = "a < b", SRange, TRange)
    (SRange source, TRange target)
{
    auto heap = BinaryHeap!(TRange, less)();
}

void largestPartialIntersectionWeighted
(RangeOfRanges, Range, WeightsAA)
(RangeOfRanges ror, Range tgt, WeightsAA weights)
{
    alias ElementType!Range InfoType;
    bool heapComp(InfoType a, InfoType b)
    {
        return true;
    }
    topNCopy!heapComp(ror, tgt);
}

void blah()
{
    double[]a = [];
    auto b = new Tuple!uint[1];
    double[] weights = [];
    largestPartialIntersectionWeighted(a, b, weights);
}
