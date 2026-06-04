Práctica 3 Álgebra - Curs 25/26
Proyecto: Trencadís Líquido (Homenaje al centenario de la muerte de Antoni Gaudí)
Autores: Yikai Chen, Norma Qiu
Profesor: Oscar Garcia Pañella

——Pautas de funcionamiento
Interacción Principal: Mueve el ratón por la pantalla para interactuar con el "agua". El movimiento generará ondas físicas con amortiguación realista.
Clic del Ratón: Haz clic en cualquier parte para generar ondas concéntricas independientes que interactúan y se superponen físicamente con las demás.
Tecla [ 3 ]: Activa/Desactiva el modo 3D estereoscópico (perspectiva isométrica e inclinación dinámica).
Tecla [ L ]: Activa/Desactiva el efecto LUT (Look-Up Table) real. Utiliza una textura externa (lut.png) para simular la refracción de la luz sobre el agua y la cerámica.
Tecla [ H ]: Activa/Desactiva la interfaz de usuario (UI) para entrar en el "Modo Inmersivo" de exhibición artística.

——Elementos de Álgebra Incorporados y Temas
Para lograr un efecto visual fluido e interactivo, hemos implementado una arquitectura modular y los siguientes temas de álgebra vistos en clase:
Tema 1: Vectores y Distancia Euclídea
Aplicación: Calculamos la distancia vectorial entre los epicentros de fuerza (ratón y clics) y la coordenada de cada partícula usando la función dist().
Tema 2: Funciones No Lineales y Potencias (Amortiguación Física)
Aplicación: Aplicamos una función de potencia y = x^3 mediante pow() para crear una curva de atenuación exponencial (damping), logrando que la ola se disipe suavemente.
Tema 3: Trigonometría Bidimensional (Onda Ambiental)
Aplicación: Empleamos una combinación de sin(X) y cos(Y) dependientes del tiempo para generar una oscilación base continua, dando una sensación de "respiración" orgánica al agua incluso sin interacción.
Tema 4: Principio de Superposición Algebraica (Interferencia de Ondas)
Aplicación: Gestionamos múltiples ondas dinámicas. La altura final Z de cada mosaico es la suma algebraica exacta de todas las ondas activas en ese punto temporal (Z_total = Z_amb + Z_raton + Z_clic1 + Z_clic2...).
Tema 5: Matrices y Transformaciones Geométricas Dinámicas
Aplicación: Además de trasladar e inclinar el plano general 30°, calculamos dinámicamente el Pitch y Roll (rotateX, rotateY) de cada mosaico individual en función de la altura Z actual de la ola, haciendo que las baldosas "rueden" sobre el agua.
Tema 6: Geometría de Vértices Irregulares (Auténtico Trencadís)
Aplicación: Para romper la cuadrícula digital, calculamos 4 coordenadas (X, Y) independientes con desplazamientos aleatorios para dibujar cuadriláteros irregulares (quad()), dejando un margen que simula el cemento blanco del mosaico.
Tema 7: Mapeo Algebraico para Efecto LUT Real
Aplicación: Mapeamos el valor de la altura Z de la ola al eje X de una textura externa (lut.png), vinculando la geometría física con el renderizado de color (get()).

——Postmortem
El desafío: Nuestro mayor reto fue evolucionar de una "cuadrícula matemática rígida" a un verdadero "Trencadís orgánico". Inicialmente, los cuadrados perfectos parecían un tablero de ajedrez roto, y el color azul monocromático perdía la esencia de Gaudí. Además, gestionar múltiples ondas simultáneas suponía un reto de optimización (FPS).
La solución: Matemáticamente, implementamos el Principio de Superposición para sumar los valores Z de múltiples ondas en arreglos dinámicos. Gráficamente, sustituimos las formas regulares por vértices deformados aleatoriamente (quad) y ajustamos la paleta a una proporción áurea (85% mar/cielo, 15% detalles en rojo, verde, amarillo y blanco) para simular los fragmentos reales de cerámica sobre cemento blanco.
Conclusión: Hemos logrado transformar un ejercicio de álgebra en una pieza de arte interactivo. El proyecto no solo cumple con los requisitos técnicos (interacción, 3D, LUT, vectores, trigonometría), sino que captura la poética, el color y el amor por la naturaleza que definieron la obra de Antoni Gaudí.