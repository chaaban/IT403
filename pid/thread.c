#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>


void *thread_function(void *arg) {
    printf("This is the thread running in the background.\n");
    sleep(100);
    return NULL;
}

int main(void) {
    pthread_t thread_id[100];
    int result;
    int i;

 for (i = 0; i < 5; i++) {
        result = pthread_create(&thread_id[i], NULL, thread_function, NULL);
        if (result != 0) {
            perror("pthread_create");
            exit(EXIT_FAILURE);
        }
    }

    for (i = 0; i < 5; i++) {
        pthread_join(thread_id[i], NULL);
    }

    return 0;
}
