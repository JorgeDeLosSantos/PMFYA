# Matemáticas con MATLAB

## Manipulación algebraica

### Definir variables simbólicas

Para la manipulación de expresiones algebraicas MATLAB dispone de un
toolbox especial, el **Symbolic Math Toolbox**, que tiene la capacidad de
trabajar con expresiones de manera simbólica. Para comenzar se debe
conocer cómo definir una variable de tipo simbólico, esto puede hacerlo
de la siguiente forma:

    >> x=sym('x')
    x =
    x

Puede introducir el comando whos para verificar el tipo de variable
creada:

    >> whos
      Name      Size            Bytes  Class    Attributes
      x         1x1               112  sym         

Normalmente, si introduce una literal que no ha sido asignada a un valor
numérico o que no se ha declarado como simbólica MATLAB devuelve un
mensaje de error similar a esto:

    >> x
    Undefined function or variable 'x'.

Una vez se ha definido una variable como simbólica puede utilizarla en
conjunto con valores numéricos para formar expresiones algebraicas, por
ejemplo:

    >> x=sym('x');
    >> x+2*cos(x)
    ans =
    x + 2*cos(x)
    >> x^3-3*x^2-x+2
    ans = 
    x^3 - 3*x^2 - x + 2

Pueden definirse dos o más variables simbólicas en una misma línea de
código utilizando el comando syms de la siguiente manera:

    >> syms x y z

Para simplificar una expresión algebraica MATLAB proporciona la función
simplify, cuyo argumento de entrada es la expresión a simplificar, por
ejemplo:

    >> simplify(sin(x)^2+cos(x)^2)
    ans =
    1

Debe tomar en cuenta que el resultado que la función simplify devuelve
es de tipo simbólico.

### Factorizar y expandir expresiones algebraicas

Las funciones factor y expand del **Symbolic Math Toolbox** permiten
factorizar y expandir toda clase de expresiones algebraicas. Por
ejemplo, si se tiene la expresión algebraica {$$} x^2+2x+1 {/$$} y se requiere
factorizarla. En MATLAB bastaría con utilizar la función factor como
sigue:

    >> factor(x^2+2*x+1)
    ans =
    (x + 1)^2

Utilizando la función expand en la expresión devuelta puede regresarse a
la forma inicial:

    >> expand((x+1)^2)
    ans =
    x^2 + 2*x + 1

## Resolver ecuaciones e inecuaciones

Una ecuación es una igualdad matemática entre dos expresiones
algebraicas en las que aparecen valores conocidos y una variable
desconocida (incógnita), relacionados mediante operaciones matemáticas
básicas, ejemplos de ecuaciones se muestran a continuación:

{$$}3x^2+2x-2=0{/$$}

{$$}x+\frac{3}{7}=2{/$$}

{$$}\cos(x)+sin(\frac{\pi}{2})=0{/$$}

Las ecuaciones algebraicas sirven para modelar situaciones poco
complejas pero que requieren el uso de la herramienta matemática para
obtener una solución satisfactoria. Existen diversos métodos para
resolver ecuaciones, los cuales se aplican dependiendo del tipo de
ecuación, incluso hay fórmulas establecidas para algunos tipos de
ecuaciones que minimizan el esfuerzo de cálculo.

MATLAB dispone de la función solve perteneciente al Symbolic Math
Toolbox, la cual permite resolver ecuaciones, inecuaciones y sistemas de
ecuaciones; la sintaxis general de la función `solve` es:

    solve(ec, var);

Donde ec es una ecuación algebraica definida usando variables simbólicas
y var es la incógnita respecto a la cual se resuelve la ecuación dada.

A manera de ejemplo se resolverá la siguiente ecuación lineal {$$} x+3=2 {/$$}:

    >> x=sym('x');
    >> solve(x+3==2,x)
    ans =
    -1

Es importante hacer mención que para especificar una igualdad se
utilizan dos signos, dado que un sólo signo hace referencia a una
asignación.

Si no se especifica el segundo miembro de la igualdad, MATLAB asumirá
que la expresión estará igualada a cero, es decir, para resolver la
ecuación:

{$$} x^2-2x-1=0 {/$$}

Puede hacerlo de las diversas formas que enseguida se muestran:

    >> solve(x^2-2*x-1==0,x)
    ans =
     2^(1/2) + 1
     1 - 2^(1/2)
    >> solve(x^2-2*x-1,x)
    ans =
     2^(1/2) + 1
     1 - 2^(1/2)
    >> solve(x^2-2*x-1)
    ans =
     2^(1/2) + 1
     1 - 2^(1/2)

Para resolver desigualdades o inecuaciones la sintaxis es prácticamente
la misma, claro, sólo hay que utilizar los operadores relacionales mayor
que o menor que en lugar del signo de igualdad. Por ejemplo, resolviendo
la siguiente desigualdad {$$} x+2>10 {/$$}:

    >> solve(x+2>10,x)
    ans =
    Dom::Interval(8, Inf)

MATLAB devuelve el intervalo solución para la inecuación, en este caso
{$$} (8,\infty) {/$$}. Para el caso de un intervalo cerrado MATLAB devuelve entre
corchetes el valor del límite correspondiente, por ejemplo:

    >> solve(x+2>=10,x)
    ans =
    Dom::Interval([8], Inf)

Un sistema de ecuaciones se compone de dos o más ecuaciones y un número
equivalente de valores desconocidos, es posible resolver sistemas de
ecuaciones utilizando también la función solve con la sintaxis
siguiente:

    solve(ec1,ec2,ec3,…)

Un ejemplo, resolver el siguiente sistema de ecuaciones:

{$$} x+y=4 {/$$} 
{$$} x-y=3 {/$$}

    >> syms x y
    >> sol=solve(x+y==4,x-y==3)
    sol = 
        x: [1x1 sym]
        y: [1x1 sym]

Para visualizar los resultados puede acceder a los campos de cada
variable como se muestra enseguida:

    >> sol.x 
    ans =
    7/2
    >> sol.y
    ans =
    1/2

## Números complejos

Los números complejos son una extensión de los números reales, se
representan como la suma de un número real y un número imaginario,
siendo este último un múltiplo real de la unidad imaginaria, cuya
representación suele hacerse utilizando las letras i o j. MATLAB, por
defecto considera a las letras j e i como unidades imaginarias, siempre
y cuando no hayan sido asignadas a un valor específico. Por ejemplo, vea
que sucede cuando teclea la letra i o j en la ventana de comandos:

    >> i
    ans =
            0 + 1.0000i
    >> j
    ans =
            0 + 1.0000i
    >> whos
      Name      Size            Bytes  Class     Attributes
      ans       1x1                16  double    complex   

Para crear un número complejo en su forma rectangular puede hacer uso de
cualquiera de las siguientes formas que producen un resultado
equivalente:

    >> Z=3+2i
    Z =
       3.0000 + 2.0000i
    >> Z=complex(3,2)
    Z =
       3.0000 + 2.0000i

Es posible obtener la parte real e imaginaria de un número complejo
utilizando las funciones `real` e `imag` respectivamente, véase el ejemplo a
continuación:

    >> z=4+5i;
    >> real(z)
    ans =
         4
    >> imag(z)
    ans =
         5

## Cálculo diferencial e integral

### Límites

Para calcular límites en MATLAB se tiene la función limit cuya sintaxis
es:

    limit(f,x,a)

Donde f es la función a calcular el límite, x la variable independiente
en cuestión, y a el valor al cual tiende la variable independiente, es
decir, expresado en notación más amable sería:

{$$} \lim_{x \to a} f(x) {/$$} 

Compute los siguientes ejemplos y verifique los resultados:

    >> limit(sin(x)/x,x,0)
    ans =
    1
    >> limit((x-2)/(x+3),x,-3)
    ans =
    NaN
    >> limit(exp(-x)+2,x,inf)
    ans =
    2

La función limit acepta argumentos adicionales para calcular límites
laterales por la izquierda y derecha, siendo estos las cadenas `'left'`
y `'right'`. Revise los siguientes ejemplos:

    >> limit(1/(x-3),x,3,'left')
    ans =
    -Inf
    >> limit(1/(x-3),x,3,'right')
    ans =
    Inf

### Derivadas

Es pertinente mencionar que MATLAB dispone de dos funciones llamadas
diff, una acepta un vector numérico como argumento de entrada, y la otra
una expresión simbólica, de esta última nos ocuparemos en esta sección.
Para solicitar ayuda con la sintaxis de esta función puede utilizar:

    >> help sym/diff
     diff   Differentiate.
        diff(S) differentiates a symbolic expression S with respect to its
        free variable as determined by SYMVAR.
        diff(S,'v') or diff(S,sym('v')) differentiates S with respect to v.
        diff(S,n), for a positive integer n, differentiates S n times.
        diff(S,'v',n) and diff(S,n,'v') are also acceptable.
     
        Examples;
           syms x t
           diff(sin(x^2)) is 2*x*cos(x^2)
           diff(t^6,6) is 720.
     
        See also sym/int, sym/jacobian, sym/symvar.

La función diff del **Symbolic Math Toolbox** tiene una sintaxis general
como sigue:

    >> df = diff(f,var)

Donde f es la función a derivar, var la variable respecto a la cual se
deriva y df la función derivada resultante.

Por ejemplo, derivando la siguiente función:

{$$} f(x)=x\cos(x) {/$$}

    >> syms x
    >> f=x*cos(x);
    >> df=diff(f,x)
    df =
    cos(x) - x*sin(x)

### Integrales

La función int del Symbolic Math Toolbox permite integrar una función
definida simbólicamente, la sintaxis de `int` es:

    >> int(fun,var);

Por ejemplo, integrando la siguiente función:

{$$} \int \,x\,\cos(x) dx {/$$}

    >> syms x
    >> f=x*cos(x);
    >> int(f,x)
    ans =
    cos(x) + x*sin(x)

Evidentemente puede utilizar cualquier variable que haya sido definida
como simbólica previamente:

    >> syms x y z t
    >> int(z^2+z-1,z)
    ans =
    (z*(2*z^2 + 3*z - 6))/6
    >> int(sqrt(x),x)
    ans =
    (2*x^(3/2))/3
    >> int(y*log(y),y)
    ans =
    (y^2*(log(y) - 1/2))/2
    >> int(t*exp(-t),t)
    ans =
    -exp(-t)*(t + 1)

Para calcular una integral definida basta con agregar los extremos del
intervalo como argumentos de entrada de la función `int`, con lo cual la
sintaxis sería:

    >> int(fun,var,a,b) 

Por ejemplo, suponga que se requiere calcular:

{$$} \int_{0}^{\pi} \,\sin(x)\,dx {/$$}

    >> syms x
    >> int(sin(x),x,0,pi)
    ans =
    2

Hay casos en que la respuesta devuelta por MATLAB es una expresión
simbólica y no una cantidad numérica, por ejemplo:

    >> int(x*exp(x),x,0,5)
    ans =
    4*exp(5) + 1

Para solucionar lo anterior puede aplicarse la función `eval` al
resultado obtenido:

    >> int(x*exp(x),x,0,5)
    ans =
    4*exp(5) + 1
    >> eval(ans)
    ans =
      594.6526

## Cálculo vectorial y multivariable

### Derivadas parciales

Las funciones de varias variables describen la mayoría de los fenómenos
físicos, químicos, económicos, sociales, etc. Por ello resulta
fundamental conocer aspectos cualitativos y cuantitativos de estas, que
puedan determinarse a partir del análisis variacional de las mismas. Un
estudio elemental podría ser la manera en que las múltiples variables
evolucionan cuando se efectua cierto cambio en las condiciones, tiempo o
espacio. Y para lo anterior se cuenta precisamente con las derivadas
parciales, que describen el comportamiento de la función cuando se hace
variar alguna de sus variables.

Debido a que el propósito de este libro queda lejos de proporcionar una
base matemática, se asumirá que el lector conoce los fundamentos de las
funciones multivariables y sus derivadas parciales . A modo de ejemplo o
*recordatorio* se verá el siguiente caso.

Sea f una función de dos variables definida por:

{$$} f(x,y) = x^2 + y^2 {/$$}

Entonces, sus derivadas parciales están dadas por:

{$$} \frac{\partial}{\partial x} f(x,y) = 2x {/$$}
{$$} \frac{\partial}{\partial y} f(x,y) = 2y {/$$}

Note que el calcular una derivada parcial consiste, en términos simples,
en derivar ordinariamente la función multivariable respecto a la
variable indicada, tratando las otras variables como si fuesen
constantes cualesquiera.

En MATLAB, para definir una función multivariable, basta con declarar
las variables simbólicas requeridas y posteriormente utilizarlas en
expresión matemática que defina una función, por ejemplo para la función
mencionada en párrafos anteriores:

    >> syms x y
    >> f=x^2+y^2
    f =
    x^2 + y^2

Para derivar la función anterior respecto a la variable {$$}x{/$$} la sintaxis
es prácticamente la misma que para una función de una variable:

    >> diff(f,x)
    ans =
    2*x

Lo mismo para el caso de la derivada parcial respecto a {$$}y{/$$}:

    >> diff(f,y)
    ans =
    2*y

### Integrales múltiples

Una integral doble tiene la forma general:

{$$} \int_a^b \int_c^d f(x,y) dy dx {/$$}

Y se resuelve integrando primeramente la función {$$}f(x,y){/$$} respecto {$$}y{/$$}
evaluada en los límites {$$}c{/$$} y {$$}d{/$$}, y enseguida el valor resultante se
integra respecto a {$$}x{/$$} evaluando en el intervalo {$$}[a,\, b]{/$$}, es decir:

{$$} I=\int_a^b \int_c^d f(x,y) dy \, dx {/$$} 
{$$} I=\int_a^b  F_1  dx {/$$}
{$$} I=F_2(b) - F_2(a) {/$$}

Donde:

{$$} F_1 = \int_c^d f(x,y) dy
\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\, y \,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,
F_2 = \int F_1 dx {/$$}

Por ejemplo, si se requiere resolver la integral doble:

{$$} \int_0^1 \int_2^3 \left( 6x+6y^2 \right) dx \, dy {/$$}

Entonces:

{$$} \int_0^1 \int_2^3 \left( 6x+6y^2 \right) dx \, dy = \int_0^1 \left(3x^2+6y^2x\right)\bigg|_2^3 dy {/$$}

{$$} = \int_0^1 \left(15+6y^2\right) dy = \left( 15y + 2y^3\right) \bigg|_0^1 = 15 + 2 = 17 {/$$}

Para calcular la integral anterior en MATLAB debe definir la función:

    >> syms x y
    >> f=6*x+6*y^2;

Luego, integrar la función respecto a {$$}x{/$$} en el intervalo {$$}[2,3]{/$$}:

    >> I1=int(f,x,2,3)
    I1 =
    6*y^2 + 15

Y finalmente integrar el resultado anterior respecto a {$$}y{/$$} en el
intervalo {$$}[0,1]{/$$}:

    >> I2=int(I1,y,0,1)
    I2 =
    17

Claro que lo anterior puede reducirse a una linea haciendo:

    >> int(int(f,x,2,3),y,0,1)
    ans =
    17

Para calcular una integral triple el procedimiento en MATLAB es muy
similar al caso anterior, por ejemplo suponga que se requiere calcular:

{$$} \int_0^2 \int_0^x \int_0^{x+y} e^{x}\left(y+2z\right) dz \, dy \, dx {/$$}

Entonces:

    >> syms x y z
    >> f=exp(x)*(y+2*z);
    >> int(int(int(f,z,0,x+y),y,0,x),x,0,2)
    ans =
    (19*exp(2))/3 + 19

Note que el resultado devuelto es una expresión de tipo simbólico, si
necesita obtener un resultado aproximado puede utilizar la función
`double` o `eval`.

    >> double(ans)
    ans =
       65.7974

### Gradiente, divergencia y rotacional.

El gradiente de una función escalar {$$}f(x,y,z){/$$} es la función vectorial
definida por:

{$$} \nabla f = \frac{\partial f}{\partial x} {\bf i}+ \frac{\partial f}{\partial y} {\bf j}+ 
\frac{\partial f}{\partial z} {\bf k} {/$$}

Por ejemplo, sea:

{$$} f(x,y,z)=2x+yz-3y^2 {/$$}

Entonces el gradiente viene dado por:

{$$} \nabla f = 2 {\bf i} + (z-6y) {\bf j} + y {\bf k} {/$$}

En MATLAB:

    >> syms x y z
    >> f=2*x+y*z-3*y^2; 
    >> gradient(f)
    ans =
           2
     z - 6*y
           y

El resultado es un vector columna de tipo simbólico de tres elementos,
correspondientes a las componentes vectoriales rectangulares.

    >> whos ans
      Name      Size            Bytes  Class    Attributes
      ans       3x1               112  sym                

## Álgebra lineal

### Álgebra matricial

### Determinante e inversa de una matriz

## Ecuaciones diferenciales

Una ecuación diferencial es aquella que contiene, generalmente,
funciones y sus derivadas como términos, además de constantes. Ejemplos
de ecuaciones diferenciales son:

{$$} \frac{dy}{dt}=-3y$$ $$\frac{d^2x}{dt^2}+2\frac{dx}{dt}+3x=0 {/$$}

## Métodos numéricos

### Método de bisección

### Método de la secante

### Método del punto fijo

### Método de Newton-Raphson
