#include <stdio.h>
#include <stdlib.h>
#define BUF_SIZE (32)


int main(int argc, char *argv[])
{
int factor = atoi(getenv("BRANCHING_FACTOR"));

// GOOD: Prevent overflow by checking the input
//if (factor < 0 || factor > 1000) {
//    return -1;
//}

// This line can allocate too little memory if factor
// is very large.
char **root_node = (char **) malloc(factor * sizeof(char *));
}
