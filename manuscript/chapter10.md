# Recomendaciones generales

## Escribiendo código legible

La legibilidad cuenta, claro que sí. Una frase de Abelson y Sussman, en
el libro Estructura e interpretación de Programas de Computadora, lo
resume de forma notable: *Los programas deben escribirse para que los
lean las personas y sólo de forma circunstancial para que los ejecuten
las máquinas.*

De modo que cuando se escribe código, en cualquier lenguaje de
programación, es importante estructurar los programas de una forma que
resulte entendible para cualquier individuo. Entonces, se deben
desarrollar lineas de código pensando en que en algún momento alguien
más tratará de entenderlo (sí, aun cuando esto sea poco probable).

A continuación se listan algunas recomendaciones básicas para
estructurar un programa:

### Nombres de variables autodescriptivos

Siempre que sea posible es preferible utilizar nombres de variables
autodescriptivos, aún cuando estos resulten un poco extensos. La
ganancia en legibilidad lo compensa todo, por ejemplo, es preferible
tener:

	fuerza = 10;
	area = 20;
	presion = fuerza/area;

a simplemente colocar:

	f = 10;
	a = 20;
	p = f/a;

### Indentación del código

Una buena indentación del código permite distinguir los diversos bloques
de programación. Actualmente el editor de MATLAB proporciona
herramientas que facilitan esta tarea, simplemente seleccionando el
código y presionando Ctrl + I para un *indentado inteligente*. Note las
diferencias entre los códigos siguientes:


	k = 1;
	while true
	if rem(k,2)==0
	disp('Par');
	else
	disp('Impar');
	end
	k = k + 1;
	end


	k = 1;
	while true
	    if rem(k,2)==0
	        disp('Par');
	    else
	        disp('Impar');
	    end
	    k = k + 1;
	end

### Documentación del código

### Espacios

## Optimizando el código

### Pre-asignación (pre-allocation)

Una de las grandes ¿ventajas? de MATLAB es su *tipado dinámico*

### Vectorización
