# Vectores y matrices

## Creando matrices y vectores

Una matriz es un arreglo bidimensional de elementos, que para efectos de
este capítulo serán siempre, a menos que se especifique lo contrario, de
tipo numérico. Cada elemento de una matriz se identifica por la posición
(número de fila y columna) que ocupa. De forma generalizada y siendo m
el subíndice correspondiente a una fila y n el de columna, una matriz se
representa como sigue:

{$$}
A_{m,n} = 
 \begin{pmatrix}
  a_{1,1} & a_{1,2} & \cdots & a_{1,n} \\
  a_{2,1} & a_{2,2} & \cdots & a_{2,n} \\
  \vdots  & \vdots  & \ddots & \vdots  \\
  a_{m,1} & a_{m,2} & \cdots & a_{m,n} 
 \end{pmatrix}
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
A = 
\begin{pmatrix}
    -1 & 2 & 1 \\
    0 & 7 & -3 \\
    1 & -1 & -2
\end{pmatrix}
{/$$}

Enseguida se muestran dos formas equivalentes realizar lo que se pide:

    >> A=[-1 2 1;0 7 -3;1 -1 -2]
    A =
        -1     2     1
         0     7    -3
         1    -1    -2
    >> A=[-1,2,1;0,7,-3;1,-1,-2]
    A =
        -1     2     1
         0     7    -3
         1    -1    -2

Como se observa, es indistinto colocar espacios o comas para separar
valores de una misma fila.

### Generar matrices y vectores predefinidos

#### Matriz de ceros

MATLAB dispone de la función zeros, que crea una matriz con las
dimensiones pasadas como argumento; puede además especificarse la clase
o tipo de dato. Por ejemplo si tecleamos la siguiente instrucción:

    >> M=zeros(5)
    M =
         0     0     0     0     0
         0     0     0     0     0
         0     0     0     0     0
         0     0     0     0     0
         0     0     0     0     0

Se crea una matriz cuadrada de 5x5 rellena de ceros de la clase double.
Si pasamos dos argumentos numéricos al llamar la función, estos
corresponderán al número de filas y columnas respectivamente, véase el
siguiente ejemplo de una matriz de 3x2:

    >> M=zeros(3,2)
    M =
         0     0
         0     0
         0     0

En caso de que necesite que los elementos de la matriz de ceros sean de
una clase distinta a double, puede incluir la opción del tipo de dato
como argumento, tal como se muestra en el siguiente ejemplo:

    >> M=zeros(3,4,'uint8')
    M =
        0    0    0    0
        0    0    0    0
        0    0    0    0
    >> whos
      Name      Size            Bytes  Class    Attributes
      M         3x4                12  uint8              

#### Matriz de unos

Para crear una matriz cuyos elementos sean todos unos MATLAB cuenta con
la función `ones`, la sintaxis es prácticamente la misma que para la
función `zeros`, véanse los ejemplos siguientes:

    >> A=ones(3)
    A =
         1     1     1
         1     1     1
         1     1     1
    >> A=ones(5,2,'uint8')
    A =
        1    1
        1    1
        1    1
        1    1
        1    1
    >> whos
      Name      Size            Bytes  Class    Attributes
      A         5x2                10  uint8      

#### Matriz identidad

Para crear una matriz identidad MATLAB proporciona la función `eye`,
recuerde que una matriz identidad es aquella que contiene unos en la
diagonal principal y ceros en el resto de elementos. Se muestra a
continuación una matriz identidad de 3x3:

    >> I=eye(3)
    I =
         1     0     0
         0     1     0
         0     0     1

#### La función linspace

La función linspace genera un vector de elementos equiespaciados o de
escala lineal. Los argumentos de entrada son los límites del intervalo:

    >> linspace(a,b)

La línea anterior genera un vector de 100 elementos linealmente
distribuidos entre los valores a y b, si necesita más o menos elementos
puede especificar la cantidad como un tercer argumento, véanse los
siguientes ejemplos:

    >> linspace(0,10,5)
    ans =
             0    2.5000    5.0000    7.5000   10.0000
    >> linspace(-2,2,5)
    ans =
        -2    -1     0     1     2

### Generar vectores con el operador dos puntos

El operador dos puntos es quizá el más utilizado en la programación en
MATLAB, todo aquello que involucre matrices o vectores lleva consigo el
uso de este operador. Por ahora simplemente veremos cómo crear vectores
con este operador en un intervalo, en secciones posteriores se verá el
uso de este operador en el indexado de matrices.

Crear un vector con este operador resulta en una sintaxis muy sencilla,
en el caso más básico solo hay que especificar los límites del vector
separados por los dos puntos, es decir:

    >> a:b 

La instrucción anterior genera la secuencia , la siguiente línea con un
caso concreto ejemplifica de una mejor manera:

    >> 1:10
    ans =
         1     2     3     4     5     6     7     8     9    10

Si requiere especificar el *paso* o incremento de los elementos que
conformarán la secuencia puede hacerse mediante la sintaxis:

    >> a:paso:b 

Por ejemplo:

    >> 0:2:10
    ans =
         0     2     4     6     8    10
    >> 0:0.2:1
    ans =
             0    0.2000    0.4000    0.6000    0.8000    1.0000

Desde luego que puede generarse un vector utilizando el orden inverso,
es decir, con valores en forma descendente, revise el siguiente ejemplo:

    >> 100:-10:0
    ans =
       100    90    80    70    60    50    40    30    20    10     0

### Matrices de números aleatorios

Con la función `rand` MATLAB genera arreglos de números aleatorios con
valores entre 0 y 1, la sintaxis de `rand` es:

    M = rand(nf, nc);

Donde nf es el número de filas y nc el número de columnas, si la matriz
es cuadrada puede especificarse sólo un valor como argumento de entrada.
Compute y verifique en MATLAB los siguientes ejemplos:

    >> R=rand(5)
    R =
        0.3439    0.6618    0.0523    0.5728    0.3251
        0.1229    0.1329    0.2557    0.6078    0.7994
        0.4799    0.2256    0.4457    0.5250    0.7819
        0.4365    0.1340    0.2022    0.6430    0.6300
        0.6780    0.5367    0.8866    0.2912    0.4490
    >> M=rand(4,3)
    M =
        0.3814    0.2016    0.6681
        0.2810    0.4626    0.4703
        0.5331    0.1055    0.1873
        0.6376    0.3538    0.0297

Una matriz de números aleatorios enteros en un rango personalizado,
incluyendo números negativos, puede generarse con la función randi, cuya
sintaxis es:

    randi([imin imax], [nf nc]);

Siendo imin el valor mínimo del intervalo e imax el valor máximo, nf el
número de filas y nc el número de columnas de la matriz.

    >> A=randi([-10 10],[7 6])
    A =
         8     7     4    -6    -9     3
        -8    -2     7     4    -1    -9
         9    -4    -5   -10     2    -4
         7     8    -9     7    10     2
        -1     8     2    -6     4    -2
        -6     7   -10     6    -2     9
        -5   -10     1    -6    -9    10

## Operaciones básicas con matrices

### Suma y resta

La suma y resta de matrices está definida para aquellas con las mismas
dimensiones dado que son operaciones que se realizan elemento a
elemento. Si se tienen dos matrices **A** y **B** de 3x3 definidas como
sigue:

{$$}
\textbf{A}=
\begin{pmatrix}
    a_{11} & a_{12} & a_{13} \\
    a_{21} & a_{22} & a_{23} \\
    a_{31} & a_{32} & a_{33}
\end{pmatrix}
\,\,\,\,
\textbf{B}=
\begin{pmatrix}
    b_{11} & b_{12} & b_{13} \\
    b_{21} & b_{22} & b_{23} \\
    b_{31} & b_{32} & b_{33}
\end{pmatrix}
{/$$}

La suma viene dada por:

{$$}
\textbf{A+B} = \begin{matrix}
a_{11}+b_{11} & a_{12}+b_{12} & a_{13}+b_{13} \\
a_{21}+b_{21} & a_{22}+b_{22} & a_{23}+b_{23} \\
a_{31}+b_{31} & a_{32}+b_{32} & a_{33}+b_{33} \\
\end{matrix}
{/$$}


En MATLAB sumar y restar matrices o vectores resulta muy sencillo, véase
el ejemplo siguiente:

    >> A=[-1 0 3;0 2 1;7 5 1]
    A =
        -1     0     3
         0     2     1
         7     5     1
    >> B=[1 3 4;2 2 -3;-2 0 1]
    B =
         1     3     4
         2     2    -3
        -2     0     1
    >> A+B
    ans =
         0     3     7
         2     4    -2
         5     5     2
    >> A-B
    ans =
        -2    -3    -1
        -2     0     4
         9     5     0
    >> B-A
    ans =
         2     3     1
         2     0    -4
        -9    -5     0


