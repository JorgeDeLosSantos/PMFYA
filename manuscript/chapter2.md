# Vectores y matrices

## Creando matrices y vectores

Una matriz es un arreglo bidimensional de elementos, que para efectos de
este capítulo serán siempre, a menos que se especifique lo contrario, de
tipo numérico. Cada elemento de una matriz se identifica por la posición
(número de fila y columna) que ocupa. De forma generalizada y siendo m
el subíndice correspondiente a una fila y n el de columna, una matriz se
representa como sigue:

{$$}
\begin{pmatrix}
a\_{11} & a\_{12} & \cdots & a\_{1n} \\
a\_{21} & a\_{22} & \cdots & a\_{2n} \\
& \vdots & \vdots & \ddots & \vdots \\
a\_{m1} & a\_{m2} & \cdots & a\_{mn} \\
end{pmatrix}
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
A = \begin{bmatrix}
-1 & 2 & 1 \\
0 & 7 & -3 \\
1 & -1 & -2 \\
\end{bmatrix}
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
\textbf{A}=\begin{pmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33} \\
\end{pmatrix}
\,\,\,\,
\textbf{B}=\begin{pmatrix}
b_{11} & b_{12} & b_{13} \\
b_{21} & b_{22} & b_{23} \\
b_{31} & b_{32} & b_{33} \\
\end{pmatrix}
{/$$}

La suma viene dada por:

{$$}
\textbf{A+B} = \begin{pmatrix}
a_{11}+b_{11} & a_{12}+b_{12} & a_{13}+b_{13} \\
a_{21}+b_{21} & a_{22}+b_{22} & a_{23}+b_{23} \\
a_{31}+b_{31} & a_{32}+b_{32} & a_{33}+b_{33} \\
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
**A** y **B**, y quiere calcular el producto matricial **A\*B**,
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

Si se intenta realizar la multiplicación **B\*A**, MATLAB devolverá un
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

## Concatenar, rotar y redimensionar una matriz

### Concatenación de matrices

La concatenación de matrices es en términos prácticos la unión de dos o
más matrices en una nueva, sin afectar la distribución original de los
elementos. Observe el siguiente ejemplo:

    >> M=[ones(3) zeros(3)]
    M =
         1     1     1     0     0     0
         1     1     1     0     0     0
         1     1     1     0     0     0

La matriz M resulta de la concatenación de dos matrices de ceros y unos
de 3x3 de forma horizontal. Para la concatenación de forma vertical debe
separar cada matriz utilizando el operador punto y coma, como se muestra
a continuación:

    >> M=[ones(3);zeros(3)]
    M =
         1     1     1
         1     1     1
         1     1     1
         0     0     0
         0     0     0
         0     0     0

Si quiere evitar el uso de operadores puede recurrir a las funciones
horzcat y vertcat de MATLAB que prácticamente devuelven resultados
similares a los anteriores. Puede verificar lo anterior con las
instrucciones siguientes:

    >> M=horzcat(ones(3),zeros(3));
    >> M=vertcat(ones(3),zeros(3));

Más aun, MATLAB proporciona la función cat para realizar concatenaciones
en cualquiera de las dimensiones de una matriz. La sintaxis es:

    cat(dim,A,B);

Donde dim es la dimensión en la cual se concatenarán las matrices A y B,
siendo 1 para las filas (equivalente a vertcat), 2 para las columnas
(equivalente a horzcat) y 3 para la concatenación en una hipermatriz.

Considere las matrices **M** y **N** definidas como:

{$$}
\textbf{M}=\begin{pmatrix}
1 & 3 \\
-2 & 1 \\
\end{pmatrix}
\,\,\,\,
\textbf{N}=\begin{pmatrix}
3 & 7 \\
0 & 2 \\
\end{pmatrix}
{/$$}

Observe los resultados que se producen utilizando la función `cat` para
cada una de las dimensiones:

    >> C=cat(1,M,N)
    C =
         1     3
        -2     1
         3     7
         0     2
    >> C=cat(2,M,N)
    C =
         1     3     3     7
        -2     1     0     2
    >> C=cat(3,M,N)
    C(:,:,1) =
         1     3
        -2     1
    C(:,:,2) =
         3     7
         0     2

### Rotación de matrices

La rotación de matrices consiste en redefinir la posición de sus
elementos mediante una modificación que no afecta el valor de sus
elementos. Para comenzar, suponga que se tiene un vector v definido como
sigue:

{$$} v=[v_1,v_2,v_3,...,v_{n-1},v_n] {/$$}

Y sea vea v’ el vector cuyas componentes son las mismas que v pero
dispuestas en un orden inverso, es decir:

{$$} v'=[v_n,v_{n-1},...,v_3,v_2,v_1] {/$$}

En MATLAB invertir el orden de los elementos de un vector resulta una
tarea muy sencilla, esto puede lograrse indexando los elementos de la
forma que a continuación se muestra:

    >> v=[-2 5 8 7 3 0] % Vector original
    v =
        -2     5     8     7     3     0
    >> vp=v(end:-1:1) % Vector con elementos invertidos
    vp =
         0     3     7     8     5    -2

La anterior es una forma muy simple de realizar dicha tarea, pero si
usted prefiere el uso de funciones existe para tal fin la función fliplr
cuya tarea es exactamente esa, extendiéndose su uso también a matrices,
véase el ejemplo utilizando el mismo vector definido anteriormente:

    >> vp=fliplr(v)
    vp =
         0     3     7     8     5    -2

La función fliplr rota una matriz en un eje vertical, de tal modo que
las columnas situadas a la izquierda queden en la parte derecha. Véase
el ejemplo a continuación:

    >> A=randi(10,3)
    A =
         4     5     3
         2     2     4
         5     6     6
    >> Ar=fliplr(A)
    Ar =
         3     5     4
         4     2     2
         6     6     5

Está claro que fliplr ejecuta una rotación basada en las columnas, pero
MATLAB dispone también de la función flipud que ejerce una rotación en
un eje horizontal o basada en las filas, enseguida se muestra un
ejemplo:

    >> A=randi(10,4)
    A =
         5     6     8     2
         9     4     5     3
         8     2     1     5
        10     7     3     6
    >> Ar=flipud(A)
    Ar =
        10     7     3     6
         8     2     1     5
         9     4     5     3
         5     6     8     2

Además de las anteriores MATLAB proporciona la función rot90 que permite
girar la matriz en un ángulo múltiplo de 90° en el sentido contrario a
las manecillas del reloj, de manera informal es como si la matriz rodase
en dirección izquierda. Los argumentos de entrada de la función son
primeramente la matriz a rotar y como segundo argumento un escalar
entero que indica el múltiplo de 90° con el cual habrá de ejecutarse la
rotación, si no se introduce un segundo argumento se asume que este será
unitario. Véanse los ejemplos a continuación:

    >> A=randi(20,3)
    A =
        14     8    10
         1    19     9
        13     1    10
    >> A90=rot90(A)  % Matriz rotada 90°
    A90 =
        10     9    10
         8    19     1
        14     1    13
    >> A180=rot90(A,2)  % Matriz  rotada en 180°
    A180 =
        10     1    13
         9    19     1
        10     8    14
    >> A270=rot90(A,3)   % Matriz rotada 270°

    A270 =

        13     1    14
         1    19     8
        10     9    10

### Redimensionar matrices

Para efectos de esta sección, entiéndase redimensionar como la acción de
transformar la disposición de los elementos de una matriz sin afectar
sus valores ni el número total de elementos, pero si sus posiciones y/o
número de filas o columnas. Por ejemplo, sea A una matriz de m x n, y
sea B una matriz de p x q resultante de redimensionar la matriz A, es
entonces estrictamente necesario que se cumpla la condición
(m)(n)=(p)(q) para que estemos tratando con un *redimensionamiento*.

MATLAB cuenta con la función `reshape` para el redimensionamiento de
matrices, la sintaxis es:

    >> X=reshape(A, m, n);

Siendo A la matriz original de dimensiones diferentes de m x n (o al
menos eso se espera), m y n son el número de filas y columnas,
respectivamente, que tendrá la nueva matriz X. Véanse los ejemplos
siguientes:

    >> V=1:10;
    >> X=reshape(V,5,2)
    X =
         1     6
         2     7
         3     8
         4     9
         5    10
    >> Y=reshape(ones(4),2,8)
    Y =
         1     1     1     1     1     1     1     1
         1     1     1     1     1     1     1     1

## Ordenar matrices

El ordenamiento de datos es una tarea muy común dentro del mundo de la
informática y en la programación científica. Se ordenan datos para
realizar análisis cualitativos, para la visualización gráfica o
cualquier otro procedimiento que requiera datos organizados. Los datos
se pueden organizar por criterios diversos, pero en esta sección veremos
simplemente como ordenarlos de acuerdo a su valor numérico, en orden
ascendente o descendente.

Generalmente los algoritmos de ordenamiento forman parte de los cursos
básicos de programación y algorítmica, dada su importancia mencionada
con anterioridad. Se estudian por lo general métodos tradicionales como:
el método de ordenamiento por selección, ordenamiento por inserción y
ordenamiento por combinación.

Ahora, enseguida sólo veremos cómo implementar el método de ordenamiento
por selección, puesto que resulta muy didáctico y fácil de programar, y
como no estamos en disposición de *reinventar* la rueda, entonces, para
el ordenamiento de las matrices y/o vectores utilizaremos la función
`sort` incluida en el núcleo de MATLAB, y el resto de métodos de
ordenamiento tradicionales se propondrán como ejercicios al final de
este capítulo.

Así pues, puede revisar el siguiente código:

    X=input('Inserte un vector: ');
    for i=1:length(X)
        [menor,k]=min(X(i:end));
        X((i-1)+k)=X(i);
        X(i)=menor;
    end
    disp(X); % Vector ordenado

El programa anterior tiene como punto de entrada un vector introducido
por el usuario de forma interactiva y que puede contener valores
numéricos cualesquiera. Una vez se ha introducido el vector, se utiliza
un bucle for cuyo recorrido está determinado por la longitud del vector,
y en cada iteración se busca el elemento de menor valor ubicado en el
sub-arreglo {$$}X(i,i+1,...,n-1,n){/$$} donde i es el i-ésimo elemento dado por
el número de iteración actual, y n el último elemento del arreglo, la
función min de MATLAB devuelve dos resultados: el valor y la posición
del mínimo encontrado, con ello se procede a intercambiar el valor
mínimo encontrado con aquel ubicado en la i-ésima posición del arreglo.
Y así, cuando se hayan ejecutado tantas iteraciones como elementos tenga
el vector, se habrán ordenado en forma ascendente dichos valores. Si por
el contrario necesita ordenar un vector en forma descendente,
simplemente habrá de sustituir la función `min` por `max`, es decir, buscar
un valor máximo en lugar del mínimo en cada iteración, o bien,
reutilizar el mismo algoritmo y audazmente rotar el vector resultante
mediante la función `fliplr`.

Como se mencionó, en MATLAB todo lo anterior puede reemplazarse
utilizando la función `sort`, cuya sintaxis más general es:

    >> sort(X, dim, mod);

Donde X es la matriz o vector a ordenar, dim es un escalar que puede ser
1 (columnas) o 2 (filas) y que representa la dimensión de referencia
sobre la cual se ordenará, y mod es el modo de ordenamiento, que puede
ser `’ascend’` (menor a mayor) o `’descend’` (mayor a menor), por
defecto las matrices o vectores se ordenan en forma ascendente. Véanse
los ejemplos siguientes:

    >> X=[10 2 8 17 20 1 4 8 9];
    >> sort(X)
    ans =
         1     2     4     8     8     9    10    17    20
    >> M=randi(10,5)
    M =
         3    10     3     2     8
         8     7     2    10     6
         9     4     9     5     5
         1    10     8     3    10
         4     8     4     5     6
    >> sort(M,1) % Ordenada por columnas
    ans =
         1     4     2     2     5
         3     7     3     3     6
         4     8     4     5     6
         8    10     8     5     8
         9    10     9    10    10
    >> sort(M,2) % Ordenada por filas
    ans =
         2     3     3     8    10
         2     6     7     8    10
         4     5     5     9     9
         1     3     8    10    10
         4     4     5     6     8
