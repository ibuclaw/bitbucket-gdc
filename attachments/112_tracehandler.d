import std.stdio;
import core.runtime;

Throwable.TraceInfo TraceHandler(void* ptr){
	writefln("TraceHandler");
	return null;
}

void main(string[] args){
	Runtime.traceHandler(&TraceHandler);
	int[] foo = new int[5];
	foo[5] = 3;
}
