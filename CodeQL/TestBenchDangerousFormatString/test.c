// Example program to demonstrate sprintf()
#include <stdio.h>
int main()
{
    char buffer[50];
    int a = 10, b = 20, c;
    c = a + b;
    sprintf(buffer, "Sum of %d and %d is %d\n", a, b, c);

    // The string "sum of 10 and 20 is 30\n" is stored
    // into buffer instead of printing on stdout
    printf("%s", buffer);

    char* buffer1 = "Hello";
    char store_value[10];
    int total_read;

    total_read = sscanf(buffer1, "%s" , store_value);

    printf("\nValue in buffer: %s",store_value);
    printf("\nTotal items read: %d",total_read);

    FILE* ptr = fopen("abc.txt", "r");
    if (ptr == NULL) {
        printf("no such file.");
        return 0;
    }
 
    /* Assuming that abc.txt has content in below
       format
       NAME    AGE   CITY
       abc     12    hyderabad
       bef     25    delhi
       cce     65    bangalore */
    char buf[100];
    while (fscanf(ptr, "%*s %*s %s ", buf) == 1)
        printf("%s\n", buf);
 
    return 0;
}
