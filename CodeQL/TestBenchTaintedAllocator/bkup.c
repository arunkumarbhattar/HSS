#include <stdio.h>
#include <stdlib.h>
#define BUF_SIZE (32)


int main(int argc, char *argv[])
{
	int x = 0;
	int y = 0;
	scanf("%d",&x);
	scanf("%d", &y);

	// GOOD: Prevent overflow by checking the input
	//if (factor < 0 || factor > 1000) {
    	//	return -1;
	//}

	// This line can allocate too little memory if factor
	// is very large.
	int z = x*y;
	if (z < 10)
		return -1;
	char *root_node = (char *) malloc(z);
	return 0;
}
