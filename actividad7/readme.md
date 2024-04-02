# Actividad 5.

- Damián Ignacio Peña Afre
- 202110568

Describir las características principales y el funcionamiento del Completely Fair Scheduler (CFS) de Linux.

<br>

## Completely Fair Scheduler

Completely Fair Scheduler (CFS) de Linux se erige como un componente fundamental en la gestión de recursos de los sistemas operativos basados en este kernel. Su diseño y funcionalidades están cuidadosamente concebidos para proporcionar equidad, escalabilidad, eficiencia y flexibilidad en la asignación de tiempo de CPU a los procesos en ejecución.

### Características principales

- La equidad es uno de los pilares fundamentales del CFS. Este planificador se esfuerza por garantizar que todos los procesos en ejecución accedan de manera justa a la CPU. Lo logra mediante un algoritmo que calcula la "necesidad" de cada proceso, considerando tanto el tiempo que ha estado en ejecución como el tiempo de espera para su ejecución. Este enfoque garantiza que ningún proceso sea sistemáticamente privilegiado en detrimento de otros.

- La escalabilidad es otra característica distintiva del CFS. Su diseño está pensado para operar eficientemente incluso en entornos con un gran número de CPUs y millones de procesos. Esta capacidad de adaptación le permite mantener un rendimiento óptimo sin importar el tamaño del sistema, lo que lo convierte en una opción viable para una amplia gama de aplicaciones y cargas de trabajo.

- La eficiencia es un aspecto crucial del CFS. Utilizando un algoritmo de "cola única", minimiza la sobrecarga del sistema al tiempo que garantiza una distribución equitativa de los recursos de CPU. Esta eficiencia se traduce en un rendimiento óptimo del sistema, incluso bajo cargas de trabajo intensivas.

- La flexibilidad es también una característica destacada del CFS. Ofrece una variedad de opciones de configuración que permiten a los administradores del sistema ajustar su comportamiento según las necesidades específicas de su entorno. Esto incluye la capacidad de personalizar parámetros como la prioridad de los procesos o las políticas de programación, lo que brinda un control fino sobre el rendimiento del sistema.

### Funcionamiento

En cuanto a su funcionamiento, el CFS organiza todos los procesos en ejecución en un "árbol rojo-negro", ordenándolos según su necesidad. Cuando un proceso agota su tiempo de CPU asignado, se coloca en la parte superior del árbol. El CFS luego selecciona el proceso con la mayor necesidad y le asigna un nuevo período de tiempo de CPU. Este proceso se repite continuamente hasta que no quedan más procesos en el árbol, asegurando así una gestión eficiente y equitativa de los recursos de CPU.

Sin embargo, a pesar de sus numerosas ventajas, el CFS también presenta algunas limitaciones. Su configuración y administración pueden resultar complejas, especialmente para usuarios menos experimentados. Además, debido a su enfoque en la equidad y la eficiencia, puede no ser la opción óptima para sistemas que requieren latencias extremadamente bajas o garantías de tiempo real. En tales casos, pueden ser necesarios enfoques alternativos más especializados para garantizar el rendimiento deseado.
