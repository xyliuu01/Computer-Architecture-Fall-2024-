#include <stdio.h>

int main() {
    int n = 3; 
    int a = 0, b = 1, next;
    printf("Fibonacci(%d) = ", n);
    if (n == 0) {
        printf("%d\n", a);
        return 0;
    }
    if (n == 1) {
        printf("%d\n", b);
        return 0;
    }

    for (int i = 2; i <= n; i++) {
        next = a + b; 
        a = b;        
        b = next;     
    }
    printf("%d\n", b);
    return 0;
}