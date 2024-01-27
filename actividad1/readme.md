Tarea 1

- Damián Ignacio Peña Afre
- 202110568

<u>Tipos de Kernel y sus diferencias</u>

1.  Kernel Monolítico:

Arquitectura de sistema operativo en la que todo el sistema se ejecuta
en modo kernel. En este diseño, el kernel consta de un solo ejecutable
grande que incluye diversos servicios como gestión de memoria,
controladores de dispositivos, gestión del sistema de archivos y gestión
de procesos, entre otros. Como resultado, todos estos servicios pueden
interactuar directamente entre sí, evitando la necesidad de mecanismos
de Comunicación entre Procesos (IPC, por sus siglas en inglés), lo que
simplifica la comunicación y reduce la sobrecarga.

Los kernels monolíticos ofrecen un alto rendimiento debido a la ausencia
de sobrecarga de IPC, lo que permite una ejecución más rápida de las
llamadas al sistema. Su diseño es más sencillo de entender e
implementar, ya que todos los componentes se encuentran en un solo
ejecutable. En general, son más fáciles de mantener y depurar debido a
la menor cantidad de componentes e interacciones.

2.  Microkernel

La arquitectura de microkernel tiene únicamente las funciones
fundamentales, como la gestión de procesos y memoria, en modo kernel,
mientras que otros servicios como controladores de dispositivos,
sistemas de archivos y redes se implementan como procesos independientes
en modo usuario. Este diseño resulta en un sistema más modular,
tolerante a fallos y seguro, ya que los componentes individuales pueden
actualizarse o reemplazarse sin afectar al sistema en su totalidad.

Los microkernels ofrecen un diseño más modular y fácil de mantener,
permitiendo actualizaciones, reemplazos o eliminaciones independientes
de los componentes. Proporcionan una mejor tolerancia a fallos, ya que
los componentes se ejecutan de forma aislada, y el kernel es más pequeño
y menos complejo. Además, ofrecen una seguridad mejorada gracias a la
separación de componentes, lo que reduce la superficie de ataque.

Por otro lado, los microkernels suelen tener una mayor sobrecarga de
Comunicación entre Procesos (IPC), lo que puede afectar negativamente al
rendimiento. La complejidad general del sistema puede aumentar debido a
la necesidad de mecanismos adicionales de IPC y la gestión de procesos
en modo usuario. El desarrollo de un sistema basado en microkernel puede
ser más laborioso y desafiante debido a la necesidad de un mecanismo de
IPC bien definido y procesos en modo usuario separados para cada
servicio.

3.  Kernel hibrido

Los kernels híbridos combinan aspectos tanto de las arquitecturas
monolíticas como de las microkernel. Ejecutan algunos servicios
principales en modo kernel y otros en modo usuario, ofreciendo un
equilibrio entre rendimiento y modularidad. Los kernels híbridos pueden
adaptar su diseño según requisitos específicos, incorporando los mejores
aspectos de ambas arquitecturas.

Los kernels híbridos ofrecen flexibilidad en el diseño, permitiendo la
adaptación según requisitos y casos de uso específicos. Pueden lograr un
equilibrio entre rendimiento y modularidad al combinar los mejores
aspectos de las arquitecturas monolíticas y microkernel. Los
desarrolladores también pueden personalizar qué componentes se ejecutan
en modo kernel y modo usuario, brindando un mayor control sobre el
diseño del sistema.

Sin embargo, los kernels híbridos pueden ser más complejos de
desarrollar y mantener, lo que posiblemente incremente el tiempo y
esfuerzo de desarrollo. Pueden implicar compromisos entre rendimiento,
modularidad y seguridad, dependiendo de la implementación. La
flexibilidad de los kernels híbridos puede difuminar las líneas entre
los componentes en modo kernel y usuario, complicando potencialmente el
diseño del sistema y dificultando alcanzar un equilibrio óptimo. Ahora,
exploremos algunos ejemplos de sistemas operativos que siguen este
enfoque.

- Diferencias entre los tipos de kernels

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 27%" />
<col style="width: 26%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Característica</strong></th>
<th><strong>Monolítico</strong></th>
<th><strong>Microkernel</strong></th>
<th><strong>Híbrido</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Organización del Espacio</strong></td>
<td>Todos los componentes en kernel space.</td>
<td>Funcionalidades básicas en kernel space; servicios adicionales en
user space.</td>
<td>Algunos servicios en kernel space y otros en user space.</td>
</tr>
<tr class="even">
<td><strong>Interacción entre Componentes</strong></td>
<td>Interacción directa sin IPC.</td>
<td>Dependencia de IPC para la comunicación entre componentes en user
space.</td>
<td>Dependencia variable de IPC según la ubicación del componente.</td>
</tr>
<tr class="odd">
<td><strong>Rendimiento</strong></td>
<td>Alto debido a la ausencia de IPC.</td>
<td>Puede tener sobrecarga de IPC, afectando el rendimiento.</td>
<td>Busca equilibrar rendimiento y modularidad.</td>
</tr>
<tr class="even">
<td><strong>Modularidad</strong></td>
<td>Menos modular debido a la integración en kernel space.</td>
<td>Más modular, ya que los servicios se ejecutan como procesos
independientes.</td>
<td>Busca un equilibrio mediante ubicación selectiva de
componentes.</td>
</tr>
<tr class="odd">
<td><strong>Tolerancia a Fallos</strong></td>
<td>Menos, ya que un fallo puede afectar todo el sistema.</td>
<td>Mayor, ya que los componentes se ejecutan de forma aislada.</td>
<td>Depende de la implementación y la ubicación de los servicios.</td>
</tr>
<tr class="even">
<td><strong>Seguridad</strong></td>
<td>Menos, ya que los componentes comparten el mismo espacio de memoria
privilegiado.</td>
<td>Mayor, debido a la separación de componentes en modos kernel y
usuario.</td>
<td>Compromisos variables dependiendo de la ubicación de los
servicios.</td>
</tr>
<tr class="odd">
<td><p><strong>Flexibilidad</strong></p>
<p><strong>Adaptabilidad</strong></p></td>
<td>Menos, ya que los cambios afectan a todo el sistema.</td>
<td>Mayor, ya que los servicios pueden actualizarse de manera
independiente.</td>
<td>Alta, ya que busca equilibrar según requisitos específicos.</td>
</tr>
<tr class="even">
<td><p><strong>Desarrollo</strong></p>
<p><strong>Mantenimiento</strong></p></td>
<td>Relativamente más sencillo.</td>
<td>Puede ser más complejo debido a la gestión de IPC.</td>
<td>Puede ser</td>
</tr>
</tbody>
</table>

<u>  
</u>

<u>User vs Kernel Mode</u>

- User Mode:

Cuando se inicia una aplicación en modo usuario, el sistema operativo
crea un proceso para ella. Este proceso proporciona a la aplicación un
espacio de direcciones virtual privado y una tabla de identificadores
privada. Dado que el espacio de direcciones virtuales de cada aplicación
es privado, una aplicación no puede modificar los datos de otra
aplicación. Cada aplicación se ejecuta de manera aislada, asegurando que
si una falla, no afecte a otras aplicaciones ni al sistema operativo.

El espacio de direcciones virtuales de una aplicación en modo usuario
también está limitado. Un proceso en modo usuario no puede acceder a
direcciones virtuales reservadas para el sistema operativo. Limitar el
espacio de direcciones virtuales de una aplicación en modo usuario evita
que la aplicación modifique o dañe datos críticos del sistema operativo.

Kernel Mode:

Todo el código que se ejecuta en modo kernel comparte un único espacio
de direcciones virtuales. Como resultado, un controlador en modo kernel
no está aislado de otros controladores ni del sistema operativo. Si un
controlador en modo kernel escribe por error en la dirección virtual
incorrecta, podría comprometer datos pertenecientes al sistema operativo
o a otro controlador. Si un controlador en modo kernel falla, provoca la
caída de todo el sistema operativo.

<u>  
</u>

- Diferencias

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 35%" />
<col style="width: 44%" />
</colgroup>
<thead>
<tr class="header">
<th>Criterio</th>
<th>Modo Kernel</th>
<th>Modo Usuario</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Acceso a Recursos</td>
<td>Acceso directo a RAM y hardware en modo kernel.</td>
<td>No hay acceso directo a RAM y hardware en modo usuario. Se requiere
realizar una llamada al sistema para acceder al hardware y RAM en modo
kernel.</td>
</tr>
<tr class="even">
<td>Modos</td>
<td>Modo kernel también se conoce por otros nombres como modo maestro,
modo privilegiado y modo sistema.</td>
<td>Modo usuario también se conoce por otros nombres como modo no
privilegiado, modo esclavo y modo restringido.</td>
</tr>
<tr class="odd">
<td>Nivel de Privilegio</td>
<td>En modo kernel, el software y las aplicaciones tienen más
privilegios para acceder a los recursos del sistema como RAM o
hardware.</td>
<td>En modo usuario, el software y las aplicaciones tienen
comparativamente menos privilegios para acceder a los recursos del
sistema como RAM o hardware.</td>
</tr>
<tr class="even">
<td>Espacio de Direcciones Virtuales</td>
<td>En modo kernel, todos los procesos y solicitudes comparten el mismo
espacio de direcciones virtuales.</td>
<td>En modo usuario, todos los procesos y solicitudes comparten un
espacio de direcciones virtuales separado.</td>
</tr>
<tr class="odd">
<td>Restricciones</td>
<td>En modo kernel, no hay restricciones. Se puede acceder tanto al
programa de usuario como a los programas de kernel.</td>
<td>En modo usuario, hay restricciones. No se puede acceder directamente
tanto al programa de usuario como a los programas de kernel. Se necesita
utilizar una llamada al sistema para este acceso.</td>
</tr>
<tr class="even">
<td>Valor del Bit de Modo</td>
<td>En modo kernel, el bit de modo se establece en 0.</td>
<td>En modo usuario, el bit de modo se establece en 1.</td>
</tr>
<tr class="odd">
<td>Interrupciones</td>
<td>En el modo kernel, hay probabilidad de que todo el sistema se apague
si ocurre alguna interrupción durante la ejecución del proceso.</td>
<td>En modo usuario, el fallo de un solo proceso no conduce al apagado
de todo el sistema. Solo ese proceso específico falla.</td>
</tr>
<tr class="even">
<td>Fallo del Sistema</td>
<td>En modo kernel, un solo fallo del sistema puede provocar problemas
complicados.</td>
<td>En modo usuario, un solo fallo del sistema no afecta todo el proceso
del sistema. También se puede recuperar reanudando la sesión de la
tarea.</td>
</tr>
<tr class="odd">
<td>Funcionalidad</td>
<td>El modo kernel puede referirse a cualquier bloque de memoria en el
sistema informático y puede acceder directamente a los recursos para
ejecutar un proceso, lo que lo convierte en un modo muy potente e
importante.</td>
<td>El modo usuario es un modo de visualización muy básico y estándar.
Esto significa que este modo no puede acceder al hardware y RAM para
ejecutar el proceso por sí mismo. Utiliza una Interfaz de Programación
de Aplicaciones (API) para este propósito.</td>
</tr>
</tbody>
</table>

<u>  
</u>

<u>Interruptions vs traps</u>

- Traps

Una trampa es una excepción en un proceso de usuario. Se produce por una
división por cero o un acceso inválido a la memoria. También es la forma
habitual de invocar una rutina de kernel (una llamada al sistema) porque
estas se ejecutan con una prioridad más alta que el código de usuario.
El manejo es síncrono (por lo que el código de usuario se suspende y
continúa después). En cierto sentido, son "activas" - la mayor parte del
tiempo, el código espera que ocurra la trampa y confía en este hecho.

- Interrupción

Una interrupción es algo generado por el hardware (dispositivos como el
disco duro, tarjeta gráfica, puertos de entrada/salida, etc.). Estas son
asíncronas (es decir, no ocurren en lugares predecibles en el código de
usuario) o "pasivas" ya que el controlador de interrupciones debe
esperar a que ocurran eventualmente.
