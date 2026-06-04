Práctica 3 Álgebra - Curs 25/26
Proyecto: Trencadís Líquido (Homenaje al centenario de la muerte de Antoni Gaudí)
Autores: Yikai Chen   Norma Qiu
Profesor: Oscar Garcia Pañella

——Pautas de funcionamiento
1. Interacción Principal: Mueve el ratón por la pantalla para interactuar con el "agua". El movimiento generará ondas físicas con amortiguación realista que distorsionan los mosaicos de trencadís.
2. Tecla [ 3 ]: Activa/Desactiva el modo 3D estereoscópico (perspectiva isométrica / 3D).
3. Tecla [ L ]: Activa/Desactiva el efecto LUT (Look-Up Table) real. Utiliza una textura externa (lut.png) para simular la refracción de la luz, coloreando las crestas de la ola con reflejos dorados/cian y los valles con azul profundo.

——Elementos de Álgebra Incorporados y Temas
Para lograr un efecto visual fluido e interactivo, hemos implementado una arquitectura modular y los siguientes temas de álgebra vistos en clase:
1. Tema 1: Vectores y Distancia Euclídea
Aplicación: Calculamos la distancia vectorial entre la posición actual del ratón (epicentro de la fuerza) y la coordenada estática de cada partícula del mosaico usando la función dist().
2. Tema 2: Funciones No Lineales y Potencias (Amortiguación Física)
Aplicación: Para evitar que la onda sea lineal y artificial, aplicamos una función de potencia y = x^3 mediante pow(). Esto crea una curva de atenuación exponencial, logrando que la ola sea muy fuerte en el centro y se disipe suavemente hacia los bordes.
3. Tema 3: Trigonometría
Aplicación: Empleamos la función seno (sin) combinada con el tiempo para generar la oscilación matemática periódica. La fórmula base aplicada es Z = sin(d · 0.035 - t) · A.
4. Tema 4: Matrices y Transformaciones Geométricas
Aplicación: Mediante pushMatrix(), translate() y rotateX(), trasladamos el origen al centro de la pantalla e inclinamos el plano espacial 30° para generar la visualización en 3D solicitada.
5. Tema 5: Mapeo Algebraico para Efecto LUT Real
Aplicación: Mapeamos el valor de la altura Z de la ola al eje X de una textura externa (lut.png). Usamos la altura física para hacer una búsqueda de píxeles (get()), vinculando geometría con renderizado de color.

——Postmortem
1. El desafío: El principal reto durante las 4 horas de la Gamejam fue hacer que el agua se sintiera "orgánica" y natural, en lugar de un simple patrón matemático rígido, y lograr aplicar un efecto LUT sin destruir el rendimiento (FPS) de Processing.
2. La solución: Descubrimos que usar atenuación lineal hacía que el agua pareciera rígida. La clave fue introducir la función algebraica pow() para simular la resistencia del agua (damping). Para el LUT, en lugar de procesar toda la pantalla, mapeamos las alturas en Z directamente a las coordenadas de una textura 1D externa, lo que resultó ser increíblemente eficiente y visualmente espectacular.
3. Conclusión: Logramos crear una experiencia interactiva fluida, poética y altamente matemática. Rinde un homenaje original a los mosaicos (Trencadís) y al amor por la naturaleza de Gaudí, cumpliendo sobradamente con todos los requisitos de interacción, 3D y álgebra.