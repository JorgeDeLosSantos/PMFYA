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
\textbf{A+B} = \begin{pmatrix}
    a_{11}+b_{11} & a_{12}+b_{12} & a_{13}+b_{13} \\
    a_{21}+b_{21} & a_{22}+b_{22} & a_{23}+b_{23} \\
    a_{31}+b_{31} & a_{32}+b_{32} & a_{33}+b_{33}
\end{pmatrix}
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



### Multiplicación

Para efectuar la multiplicación de matrices es necesario que estas
cumplan algunas características. Suponga que se tienen dos matrices
**A** y **B**, y quiere calcular el producto matricial **A*B**,
entonces, la matriz **A** debe tener tantas columnas como número de
filas tenga **B**. En términos más amables: si **A** es una matriz de
dimensiones mxn entonces la matriz **B** debe ser de dimensión nxp,
siendo, m,n y p enteros positivos cualesquiera.

Para ejemplificar como ejecutar la multiplicación de matrices en MATLAB
crearemos dos matrices **A** y **B** de forma aleatoria:

    >> A=round(rand(3,5)*5)
    A =
         5     4     0     3     4
         3     4     5     1     1
         2     3     0     2     4
    >> B=round(rand(5,6)*5)
    B =
         4     0     2     0     2     3
         2     3     1     3     4     0
         1     3     4     1     3     4
         1     4     4     3     4     3
         4     5     2     2     1     5
    >> C=A*B
    C =
        47    44    34    29    42    44
        30    36    36    22    42    37
        32    37    23    23    28    32

Si se intenta realizar la multiplicación **B*A**, MATLAB devolverá un
error dado que el número de columnas de **B** (6) es diferente de la
cantidad de filas de **A** (3).

    >> C=B*A
    Error using  * 
    Inner matrix dimensions must agree. 

## Operaciones elemento a elemento

Las operaciones elemento a elemento se ejecutan entre vectores o
matrices cuyas dimensiones son las mismas, cierto es que en muchos casos
este tipo de operaciones no tienen un equivalente matemático definido,
pero son muy útiles para operar con múltiples elementos y aprovechar los
beneficios de la vectorización. Por defecto la suma y resta de arreglos
matriciales se ejecutan, como es de esperarse, elemento a elemento, no
así multiplicación que normalmente está definida bajo los principios
básicos del álgebra lineal.

Para forzar a que una multiplicación se haga elemento a elemento debe
utilizarse el operador de multiplicación antecedida por un punto, por
ejemplo:

    >> U=[0 -2 1 3 4]
    U =
         0    -2     1     3     4
    >> V=[-1 3 2 2 7]
    V =
        -1     3     2     2     7
    >> U.*V
    ans =
         0    -6     2     6    28

Es sabido que matemáticamente la multiplicación no está definida para
vectores, pero como puede observar en el ejemplo anterior cada elemento
de U ubicado en la k-ésima posición se multiplica por el elemento de V
ubicado en la correspondiente posición.

Lo mismo sucede para el caso de la división, formalmente no existe en el
cálculo matricial, pero si está definida en MATLAB como una operación
elemento a elemento, véase el ejemplo siguiente:

    >> A=ones(3)
    A =
         1     1     1
         1     1     1
         1     1     1
    >> B=reshape(1:9,3,3)
    B =
         1     4     7
         2     5     8
         3     6     9
    >> format rat;
    >> A./B
    ans =
           1              1/4            1/7     
           1/2            1/5            1/8     
           1/3            1/6            1/9    
     

Como se observa, cada elemento de la matriz A es dividido por el
correspondiente en B. Si la instrucción reshape le parece extraña no se
preocupe, en secciones posteriores se verá muy detalladamente. La
instrucción format rat permite visualizar de forma racional las salidas
en la ventana de comandos.

## Acceder a elementos de una matriz

Los elementos de una matriz se identifican mediante la posición que
ocupan en esta, es decir la fila y columna a la cual pertenecen. En
muchos casos se hace necesario operar sobre un elemento específico de
una matriz, y ello implica acceder a este de forma individual, en MATLAB
se puede utilizar la sintaxis siguiente:

    >> A(i,j);

Con lo anterior se obtiene el elemento perteneciente a la matriz A,
ubicado en la i-ésima fila y j-ésima columna, evidentemente i y j son
enteros positivos cualesquiera, sin exceder, claro, las dimensiones de
la matriz en cuestión. Por ejemplo:

    >> A=magic(3)
    A =
         8     1     6
         3     5     7
         4     9     2
    >> A(1,2)
    ans =
         1

Para el ejemplo mostrado es evidente que el elemento ubicado en la
primera fila y segunda columna es justamente la unidad.

En ocasiones se hace necesario obtener todos o algunos de los elementos
de una fila o columna de una matriz (operación conocida como *slicing*),
para tal efecto se hace uso del operador dos puntos ( : ) tal como se
muestra en el ejemplo siguiente:

    >> A=randi(10,3)
    A =
         7     1     8
         4     5     8
        10     4     2
    >> A(:,1)
    ans =
         7
         4
        10
    >> A(1,:)
    ans =
         7     1     8

Note que el colocar dos puntos en la posición de filas o columnas hace
que MATLAB no devuelva una posición única, si no todas las filas o
columnas correspondientes.

## Tamaño de las matrices y vectores

Determinar el número de filas o columnas de una matriz o bien el número
de elementos que le componen, puede resultar muy útil en situaciones en
las que necesite por ejemplo recorrer con bucles una matriz o bien
acceder sus elementos evitando exceder las dimensiones de la misma.

La función size devuelve el número de filas y columnas con la sintaxis:

    [m,n]=size(A);

Donde A es la matriz, m es el número de filas y n el número de columnas.

Ejemplo:

    >> A=ones(5,6)
    A =
         1     1     1     1     1     1
         1     1     1     1     1     1
         1     1     1     1     1     1
         1     1     1     1     1     1
         1     1     1     1     1     1
    >> [m,n]=size(A)
    m =
         5
    n =
         6

La función size también puede utilizarse con la sintaxis siguiente:

    a=size(A,k);

Donde k puede adquirir valores de 1 o 2, siendo k=1 se puede determinar
el número de filas y con k=2 se calcula el número de columnas.

