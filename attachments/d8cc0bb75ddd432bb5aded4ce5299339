string generateDllCode(T)(string function(string name) ){
__traits(allMembers,T);
}

private string dll_declare(string name){
}

class Assimp {
	mixin( generateDllCode!Assimp(&dll_declare) );
}