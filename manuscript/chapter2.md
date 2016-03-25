# Vectores y matrices

## Creando matrices y vectores

Una matriz es un arreglo bidimensional de elementos, que para efectos de
este capítulo serán siempre, a menos que se especifique lo contrario, de
tipo numérico. Cada elemento de una matriz se identifica por la posición
(número de fila y columna) que ocupa. De forma generalizada y siendo m
el subíndice correspondiente a una fila y n el de columna, una matriz se
representa como sigue:

{$$}
\begin{matrix}
a_{11} & a_{12} & \cdots & a_{1n} \\
a_{21} & a_{22} & \cdots & a_{2n} \\
\vdots & \vdots & \ddots & \vdots \\
a_{m1} & a_{m2} & \cdots & a_{mn} \\
end{matrix}
{/$$}

Un vector es un caso particular de matriz que sólo contiene una fila o
una columna.

### Insertando valores manuales

Crear una matriz en MATLAB es muy sencillo, dado que la sintaxis es muy
simple. Se escriben entre corchetes todos los valores pertenecientes a
la matriz, separándose por comas o espacios elementos de una misma fila
y diferente columna, y por punto y coma aquellos que correspondan a otra
fila.

**Ejemplo**. Defina la matriz **A** utilizando MATLAB

{$$}
A = \begin{matrix}
-1 & 2 & 1 \\
0 & 7 & -3 \\
1 & -1 & -2 \\
\end{matrix}
{/$$}

