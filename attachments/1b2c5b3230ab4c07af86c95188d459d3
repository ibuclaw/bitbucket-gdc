module object;

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

