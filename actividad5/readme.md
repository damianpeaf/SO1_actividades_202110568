Actividad 5.

- Damián Ignacio Peña Afre
- 202110568

Usando el siguiente código como referencia, completar el programa para que sea ejecutable y responder las siguientes preguntas:

<br>

### Código completo

```cpp
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>

int main() {
    pid_t pid;

    pid = fork();

    if (pid == 0) { /* proceso hijo */
        fork();
        pthread_t thread;
        pthread_create(&thread, NULL, NULL, NULL);
    }

    fork();

    return 0;
}
```

### Preguntas

1. ¿Cuántos procesos únicos son creados?

En este programa se crean **4 procesos únicos**:

- Proceso padre: El proceso original que ejecuta el programa.
- Proceso hijo 1: Creado por la primera llamada a fork() en el proceso padre.
- Proceso hijo 2: Creado por la segunda llamada a fork() en el proceso padre.
- Nieto: Creado por la llamada a fork() en el proceso hijo 1.

2. ¿Cuántos hilos únicos son creados?

Se crea **1 hilo único** en el proceso hijo 1. La llamada a pthread_create() crea un nuevo hilo en el proceso que la ejecuta. En este caso, se ejecuta en el proceso hijo 1, por lo que se crea un nuevo hilo en ese proceso.

- La función fork() crea un nuevo proceso hijo que es una copia exacta del proceso padre.
- La función pthread_create() crea un nuevo hilo en el proceso que la ejecuta.
- En este programa, se realizan dos llamadas a fork(). La primera llamada crea un proceso hijo 1, que luego crea un nieto a través de la segunda llamada a fork().
- Además, dentro del proceso hijo 1, se crea un hilo único mediante la función pthread_create().
