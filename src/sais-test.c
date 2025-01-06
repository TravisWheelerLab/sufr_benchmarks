#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <libsais.h>
#include <libsais64.h>

int main() {
    // input data
    char *Text = "abracadabra";
    int n = strlen(Text);
    int i, j;

    // allocate
    int64_t *SA = (int64_t *)malloc(n * sizeof(int64_t));

    // sort
    libsais64((unsigned char *)Text, SA, n, 0, NULL);

    // output
    for(i = 0; i < n; ++i) {
        printf("SA[%2d] = %2ld: ", i, SA[i]);
        for(j = SA[i]; j < n; ++j) {
            printf("%c", Text[j]);
        }
        printf("$\n");
    }

    // deallocate
    free(SA);

    return 0;
}