#include <assert.h>
#include <process.h>
#include <stdio.h>
#include <string.h>

static char d_version = '2';

void rewrite_binary(char* arg0)
{
    char* cc1d = strstr(arg0, "cc1d");
    
    if (!cc1d)
    {
        printf("Compiler wrapper:  Unable to find compiler substring.");
        assert(0);
    }
        
    cc1d[2] = 'd';
    cc1d[3] = d_version;
}

int main(int argc, char** argv)
{
    int i;
    
    // Look for -v1.
    for(i=0; i < argc; ++i)
        if (strcmp("-fv1", argv[i]) == 0)
        {
            // maybe GDC should eat this instead.
            argv[i][0] = '\0';
            d_version = '1';
        }
    
    // Rewrite argv[0] to use correct compiler.
    rewrite_binary(argv[0]);

    printf("%s %d\n", argv[0], argc);
    return _spawnv(_P_WAIT, argv[0], (const char* const*)argv);
}