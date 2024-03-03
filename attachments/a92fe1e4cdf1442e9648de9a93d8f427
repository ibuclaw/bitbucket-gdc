module object;

import stubs;

///////////////////////////////////////////////////////////////////////////////
/// Basic Types
///////////////////////////////////////////////////////////////////////////////
version(X86_64)
{
    alias ulong size_t;
    alias long  ptrdiff_t;
    alias long  sizediff_t;
}
else
{
    alias uint  size_t;
    alias int   ptrdiff_t;
    alias int   sizediff_t;
}

alias size_t hash_t;
alias bool equals_t;

alias immutable(char)[]  string;
alias immutable(wchar)[] wstring;
alias immutable(dchar)[] dstring;

///////////////////////////////////////////////////////////////////////////////
/// Object
///////////////////////////////////////////////////////////////////////////////
class Object
{
	interface Monitor
	{
		void lock();
		void unlock();
	}
}

///////////////////////////////////////////////////////////////////////////////
/// Interface
///////////////////////////////////////////////////////////////////////////////
struct Interface
{
	TypeInfo_Class classinfo;
	void*[] vtbl;
	ptrdiff_t offset;
}

///////////////////////////////////////////////////////////////////////////////
/// TypeInfo
///////////////////////////////////////////////////////////////////////////////
struct OffsetTypeInfo
{
	size_t offset;
	TypeInfo ti;
}

class TypeInfo
{
	void[] init() { return null; }
}

class TypeInfo_Typedef : TypeInfo
{
	TypeInfo base;
	string name;
	void[] m_init;
}

class TypeInfo_Enum : TypeInfo_Typedef
{

}

class TypeInfo_Pointer : TypeInfo
{
	TypeInfo m_next;
}

class TypeInfo_Array : TypeInfo
{
	TypeInfo value;
}

class TypeInfo_StaticArray : TypeInfo
{
	TypeInfo value;
	size_t len;
}

class TypeInfo_AssociativeArray : TypeInfo
{
	TypeInfo value;
	TypeInfo key;
	TypeInfo impl;
}

class TypeInfo_Function : TypeInfo
{
	TypeInfo next;
}

class TypeInfo_Delegate : TypeInfo
{
	TypeInfo next;
}

class TypeInfo_Class : TypeInfo
{
	byte[] init;
	string name;
	void*[] vtbl;
	Interface[] interfaces;
	TypeInfo_Class base;
	void* destructor;
	void function(Object) classInvariant;
	uint m_flags;
	void* deallocator;
	OffsetTypeInfo[] m_offTi;
	void function(Object) defaultConstructor;
	const(MemberInfo[]) function(in char[]) xgetMembers;
}

class TypeInfo_Interface : TypeInfo
{
	TypeInfo_Class info;
}

class TypeInfo_Struct : TypeInfo
{
	string name;
	void[] m_init;

	hash_t   function(in void*)           xtoHash;
	equals_t function(in void*, in void*) xopEquals;
	int      function(in void*, in void*) xopCmp;
	char[]   function(in void*)           xtoString;

	uint m_flags;

	const(MemberInfo[]) function(in char[]) xgetMembers;
	void function(void*)                    xdtor;
	void function(void*)                    xpostblit;

	uint m_align;
}

class TypeInfo_Tuple : TypeInfo
{
	TypeInfo[] elements;
}

class TypeInfo_Const : TypeInfo			// const(type)
{
	TypeInfo base;
}

class TypeInfo_Invariant : TypeInfo_Const {}	// immutable(type)
class TypeInfo_Shared : TypeInfo_Const {}	// shared(type)
class TypeInfo_Inout : TypeInfo_Const {}	// inout(type)

///////////////////////////////////////////////////////////////////////////////
/// MemberInfo
///////////////////////////////////////////////////////////////////////////////
abstract class MemberInfo
{
	string name();
}

class MemberInfo_field : MemberInfo
{
	string   m_name;
	TypeInfo m_typeinfo;
	size_t   m_offset;

	this(string name, TypeInfo ti, size_t offset)
	{
		m_name = name;
		m_typeinfo = ti;
		m_offset = offset;
	}

	override string name() { return m_name; }
	TypeInfo typeInfo() { return m_typeinfo; }
	size_t offset() { return m_offset; }
}

class MemberInfo_function : MemberInfo
{
	string   m_name;
	TypeInfo m_typeinfo;
	void*    m_fp;
	uint     m_flags;

	this(string name, TypeInfo ti, void* fp, uint flags)
	{
		m_name = name;
		m_typeinfo = ti;
		m_fp = fp;
		m_flags = flags;
	}

	override string name() { return m_name; }
	TypeInfo typeInfo() { return m_typeinfo; }
	void* fp() { return m_fp; }
	uint flags() { return m_flags; }
}

///////////////////////////////////////////////////////////////////////////////
/// ModuleInfo
///////////////////////////////////////////////////////////////////////////////
enum
{
    MIctorstart  = 1,   // we've started constructing it
    MIctordone   = 2,   // finished construction
    MIstandalone = 4,   // module ctor does not depend on other module
                        // ctors being done first
    MItlsctor    = 8,
    MItlsdtor    = 0x10,
    MIctor       = 0x20,
    MIdtor       = 0x40,
    MIxgetMembers = 0x80,
    MIictor      = 0x100,
    MIunitTest   = 0x200,
    MIimportedModules = 0x400,
    MIlocalClasses = 0x800,
    MInew        = 0x80000000	// it's the "new" layout
}

struct ModuleInfo
{
    struct New
    {
	uint flags;
	uint index;
    }

    struct Old
    {
	string          name;
	ModuleInfo*[]    importedModules;
	TypeInfo_Class[]     localClasses;
	uint            flags;

	void function() ctor;
	void function() dtor;
	void function() unitTest;
	void* xgetMembers;
	void function() ictor;
	void function() tlsctor;
	void function() tlsdtor;
	uint index;
	void*[1] reserved;
    }

    union
    {
	New n;
	Old o;
    }
}


// Windows: this gets initialized by minit.asm
// Posix: this gets initialized in _moduleCtor()
extern (C) __gshared ModuleInfo*[] _moduleinfo_array;

struct ModuleReference
{
	ModuleReference* next;
	ModuleInfo*      mod;
}

extern (C) __gshared ModuleReference* _Dmodule_ref;

__gshared ModuleInfo*[] _moduleinfo_dtors;
__gshared size_t        _moduleinfo_dtors_i;

__gshared ModuleInfo*[] _moduleinfo_tlsdtors;
__gshared size_t        _moduleinfo_tlsdtors_i;

///////////////////////////////////////////////////////////////////////////////
/// Monitor
///////////////////////////////////////////////////////////////////////////////
alias Object.Monitor        IMonitor;
alias void delegate(Object) DEvent;

struct Monitor
{
	IMonitor impl;
	DEvent[] devt;
	size_t   refs;
}

///////////////////////////////////////////////////////////////////////////////
/// GNU Specific
///////////////////////////////////////////////////////////////////////////////
version(GNU)
{
	import gcc.builtins;
	alias __builtin_va_list __va_argsave_t;
	extern(C) int __gdc_personality_v0() { return 0; }
}

///////////////////////////////////////////////////////////////////////////////
/// Template for supporting Associative Arrays
///////////////////////////////////////////////////////////////////////////////
struct AssociativeArray(Key, Value)
{
    void* p;

    size_t aligntsize(size_t tsize)
    {
        version (X86_64)
            // Size of key needed to align value on 16 bytes
            return (tsize + 15) & ~(15);
        else
           return (tsize + size_t.sizeof - 1) & ~(size_t.sizeof - 1);
    }

    size_t length() @property { return _aaLen(p); }

    Value[Key] rehash() @property
    {
        auto p = _aaRehash(&p, typeid(Value[Key]));
        return *cast(Value[Key]*)(&p);
    }

    Value[] values() @property
    {
        auto a = _aaValues(p, aligntsize(Key.sizeof), Value.sizeof);
        return *cast(Value[]*) &a;
    }

    Key[] keys() @property
    {
        auto a = _aaKeys(p, aligntsize(Key.sizeof), Value.sizeof);
        return *cast(Key[]*) &a;
    }

    int opApply(scope int delegate(ref Key, ref Value) dg)
    {
        return _aaApply2(p, aligntsize(Key.sizeof), cast(_dg2_t)dg);
    }

    int opApply(scope int delegate(ref Value) dg)
    {
        return _aaApply(p, aligntsize(Key.sizeof), cast(_dg_t)dg);
    }

    int delegate(int delegate(ref Key) dg) byKey()
    {
	// Discard the Value part and just do the Key
	int foo(int delegate(ref Key) dg)
	{
	    int byKeydg(ref Key key, ref Value value)
	    {
		return dg(key);
	    }

	    return _aaApply2(p, aligntsize(Key.sizeof), cast(_dg2_t)&byKeydg);
	}

	return &foo;
    }

    int delegate(int delegate(ref Value) dg) byValue()
    {
	return &opApply;
    }

    Value get(Key key, lazy Value defaultValue)
    {
	auto p = key in *cast(Value[Key]*)(&p);
	return p ? *p : defaultValue;
    }
}


///////////////////////////////////////////////////////////////////////////////
/// Implementation for Associative Arrays & Array Properties
///////////////////////////////////////////////////////////////////////////////
struct aaA
{
	aaA *next;
	hash_t hash;
}

struct BB
{
	aaA*[] b;
	size_t nodes;
	TypeInfo keyti;
	aaA*[4] binit;
}

struct AA
{
	BB* a;
}

typedef scope int delegate(void *) _dg_t;
typedef scope int delegate(void *, void *) _dg2_t;

extern(C)
{
	void[] _adSort(void[] a, TypeInfo ti) { return null; }
	char[] _adSortChar(char[] a) { return null; }
	wchar[] _adSortWchar(wchar[] a) { return null; }

	void[] _adReverse(void[] a, size_t szelem) { return null; }
	char[] _adReverseChar(char[] a) { return null; }
	wchar[] _adReverseWchar(wchar[] a) { return null; }

	int _adEq(void[] a1, void[] a2, TypeInfo ti) { return 0; }
	int _adCmp(void[] a1, void[] a2, TypeInfo ti) { return 0; }
	int _adCmpChar(void[] a1, void[] a2) { return 0; }

	void[] _aaValues(void* p, size_t keysize, size_t valuesize) { return null; }
	void[] _aaKeys(void* p, size_t keysize, size_t valuesize) { return null; }
	void* _aaRehash(void** pp, TypeInfo keyti) { return null; }
	size_t _aaLen(void* aa) { return 0; }

	int _aaEqual(TypeInfo_AssociativeArray ti, AA e1, AA e2) { return 0; }

	void* _aaInp(AA aa, TypeInfo keyti, void* pkey) { return null; }
	void* _aaGetp(AA* aa, TypeInfo keyti, size_t valuesize, void* pkey) { return null; }
	void* _aaGetRvaluep(AA aa, TypeInfo keyti, size_t valuesize, void* pkey) { return null; }
	void _aaDelp(AA aa, TypeInfo keyti, void *pkey) { return; }

	int _aaApply(void* aa, size_t keysize, _dg_t dg)  { return 0; }
	int _aaApply2(void* aa, size_t keysize, _dg2_t dg)  { return 0; }

	BB* _d_assocarrayliteralTp(TypeInfo_AssociativeArray ti, size_t length, void *keys, void *values)
	{
		return null;
	}
}


