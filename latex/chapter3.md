# Arreglos de celdas, estructuras y cadenas de caracteres

## Arreglos de celdas

Un *cell array* o arreglo de celdas es un arreglo multidimensional que
puede contener diversos tipos de datos e incluso otro cell array. Suelen
utilizarse como agrupadores de datos heterogéneos.

### Crear un arreglo de celdas

La manera más *común* de definir un cell array es utilizando llaves como
delimitadores, comas y/o puntos y comas como separadores (funcionando de
la misma forma que en matrices). Por ejemplo:

    >> A={'Ana',rand(3),true}
    A = 
        'Ana'    [3x3 double]    [1]
    >> whos
      Name      Size            Bytes  Class    Attributes
      A         1x3               415  cell     

Puede notar que se han introducido elementos de diversos tipos y
tamaños, aunque claro que funciona también para elementos del mismo
tipo:

    >> A={1,2,3;0,2,1;2,3,1}
    A = 
        [1]    [2]    [3]
        [0]    [2]    [1]
        [2]    [3]    [1]

Además, puede definir un arreglo de celdas vacío utilizando la función
cell, cuya sintaxis es:

    >> C = cell(m,n);

Donde m y n especifican el tamaño del arreglo. Una vez creado el cell
array vacío puede utilizarse la asignación *uno a uno* para rellenar
cada posición del mismo, por ejemplo:

    >> C=cell(2,3);
    >> C{1,1}='A';
    >> C{1,2}='X';
    >> C{1,3}=2;
    >> C{2,1}=true;
    >> C{2,2}=false;
    >> C{2,3}='T';
    >> C
    C = 
        'A'    'X'    [2]
        [1]    [0]    'T'

### Indexado de un cell array

La parte de indexación de un cell array es una cuestión que en ocasiones 
puede tornarse media *dolorosa* para el usuario principiante, pero claro, 
la clave está en conocer que nos devuelve cada vez.


## Estructuras

Las estructuras (`struct`) son un tipo de arreglo multidimensional en
MATLAB, que permiten almacenar datos de diversos tipos, cada dato se
almacena en un campo definido mediante un nombre.

### Crear una estructura de datos

Una estructura de datos se puede definir utilizando la sintaxis:

    >> NombreEstructura.NombreCampo = Valor

Donde *NombreEstructura* es el nombre de la estructura, *NombreCampo* el
nombre del campo, y *Valor* el valor asignado a ese campo de la
estructura, el cual puede ser una variable o dato de cualquier tipo,
incluyendo otros tipos de arreglos o matrices. Note que el nombre de la
estructura y el del campo están separados por un punto.

    >> Alumnos.nombre='Juan Pérez';
    >> Alumnos.edad=20;
    >> Alumnos.notas=[10,8,9];
    >> Alumnos
    Alumnos = 
        nombre: 'Juan Pérez'
          edad: 20
         notas: [10 8 9]
    >> whos Alumnos
      Name         Size            Bytes  Class     Attributes

      Alumnos      1x1               580  struct      

### Accediendo a campos de una estructura

## Cadenas de caracteres

Las cadenas de caracteres o strings (aquí usaremos indistintamente ambos
términos) son un tipo de dato común en la mayoría de los lenguajes de
programación de alto nivel, consisten en una serie de caracteres que
representan una palabra, frase, texto o cualquier otra representación
mediante símbolos propios de un sistema de escritura.

Como ya sabemos en MATLAB no hace falta declarar el tipo de cada
variable, pero es necesario utilizar cierta sintaxis para que el
intérprete reconozca cada tipo de dato, así, para crear una cadena de
caracteres es necesario delimitar su contenido entre comillas simples,
por ejemplo:

    >> txt='Programación en MATLAB'
    txt =
    Programación en MATLAB
    >> whos
      Name      Size            Bytes  Class    Attributes
      txt       1x22               44  char    

### Concatenación

La concatenación de cadenas de caracteres es la operación de unir dos o
más cadenas en una nueva. Una forma de concatenar strings es utilizando
la notación de corchetes, véase el ejemplo a continuación:

    >> cad1='Hola, ';
    >> cad2='bienvenido';
    >> cad3=' a este curso de MATLAB';
    >> cad_res=[cad1,cad2,cad3]
    cad_res =
    Hola, bienvenido a este curso de MATLAB

Además de lo anterior MATLAB también dispone de una función
*especializada* para esta tarea: strcat. La sintaxis es muy sencilla, a
saber:

    >> concStr=strcat(s1, s2, s3, …, sN);

Siendo concStr la cadena resultante, y s1, s2, s3 y sN una lista de
strings separadas por comas, y que son los que habrán de concatenarse.
Por ejemplo:

    >> cad=strcat('Esto es una',' cadena concatenada',' con strcat')
    cad =
    Esto es una cadena concatenada con strcat

I> ### De la concatenación
I> 
I> En muchos otros lenguajes de programación
I> es común utilizar el operador de suma (+) para la concatenación de
I> strings, por lo cual puede resultar *tentador* intentarlo en MATLAB,
I> pero esto produce un resultado diferente al esperado. Lo que MATLAB hace
I> es sumar elemento a elemento el valor correspondiente en código ASCII de
I> cada una de las letras que componen el arreglo de caracteres, por lo
I> cual se deduce además que es imposible operar de esta forma con cadenas
I> de longitudes diferentes. Luego, si se suman dos cadenas de igual
I> longitud, entonces MATLAB devolverá un vector de tipo double.

### Mayúsculas y minúsculas

Si necesita representar una cadena de caracteres solo mediante
mayúsculas o minúsculas, MATLAB proporciona funciones para cada caso.
Con upper se convierte una cadena pasada como argumento en su
representación en mayúsculas:

    >> s=upper('hola mundo')
    s =
    HOLA MUNDO

Usando lower puede hacerlo para el caso de minúsculas:

    >> s=lower('MATLAB es divertido')
    s =
    matlab es divertido

### Buscar y remplazar strings

#### Buscar en una cadena de texto

Actualmente es común que millones de personas busquen a diario en el
internet cualquier diversidad de temas o palabras claves de algún
interés, obteniendo respuesta en milésimas de segundo. Claro que los
algoritmos de búsqueda que implementan los buscadores de la web como el
omnipresente Google son muy sofisticados y basan sus resultados en
conceptos muy definidos de clasificación y relevancia.

En esta sección veremos como MATLAB permite *buscar* palabras, frases y
caracteres dentro de una cadena de texto. Obviando las diferencias de
complejidad y utilidad, esto es muy similar a lo mencionado en líneas
anteriores.

La función más común para buscar un determinado patrón de caracteres es
strfind cuya sintaxis es:

    >> strfind(texto, busca);

Donde texto es la cadena de caracteres en donde se buscará el patrón
definido en la variable busca. Y como es *costumbre* en este texto,
iremos a por un ejemplo:

    >> texto='Anita lava la tina';
    >> busca='lava';
    >> strfind(texto,busca)
    ans =
         7

Y ahora, ¿por qué nos devuelve un 7?, MATLAB devuelve la posición en la
cual inicia el patrón o cadena buscada, en este caso la palabra lava
comienza en la posición 7 de texto. Un ejemplo más:

    >> texto='Este es otro ejemplo';
    >> busca='o';
    >> strfind(texto,busca)
    ans =
         9    12    20

Puede notar que en este caso MATLAB devuelve más de un resultado, lo
cual indica claramente que el carácter buscado se encuentra más de una
vez dentro del texto, y al igual que lo anterior estos números indican
la posición inicial del carácter o cadena buscada.

Puede ser que la utilidad de la función strfind hasta este punto le
parezca cuasi nula, démosle entonces una aplicación más *tangible*: dada
una cadena de texto y un patrón de búsqueda, eliminaremos cada
coincidencia encontrada:

    >> texto='Eliminando la vocal i de esta frase';
    >> busca='i';
    >> k=strfind(texto,busca);
    >> texto(k)='' % Eliminamos coincidencias
    texto =
    Elmnando la vocal  de esta frase

Es posible que haya notado que incluso puede remplazar cada coincidencia
por otra letra y no necesariamente por un string vacío. Lo anterior
funciona solamente para patrones de búsqueda cuya longitud sea unitaria,
para el resto de casos debe sustituir la última línea por:

    >> texto(k:k+length(busca))=''

#### Remplazando en una cadena de texto

Hemos visto como buscar y luego reemplazar cierto patrón buscado en una
cadena de caracteres, mediante la indexación de cada coincidencia, pero
MATLAB *facilita* el trabajo y proporciona la función `strrep` que
reemplaza las coincidencias encontradas, la sintaxis es:

    >> modStr=strrep(origStr,  anterior, nuevo)

Donde origStr es la cadena de caracteres original, anterior es el valor
o parte de la cadena a remplazar, nuevo es el valor por el cual será
remplazado, y modStr la cadena resultante al remplazar los valores
especificados. Enseguida se muestra un ejemplo, utilizando el clásico
trabalenguas de los tigres y trigos:

    >> s='tres tristes tigres tragaban trigo';
    >> srep=strrep(s,'tr','tl')
    srep =
    tles tlistes tigres tlagaban tligo

Tal como se observa, se ha remplazado toda aparición conjunta de las
letras tr por tl, conllevando ello a una versión *enrarecida* de tan
magnífico ejercicio de expresión oral.

La función `strrep`, como se ha visto, proporciona una herramienta para
reemplazar ciertos valores en una cadena de caracteres, pero también
está limitada a que los valores pasados como argumentos de entrada deben
ser exactos, sin permitir flexibilidad alguna al momento de definir los
patrones de búsqueda. Desde luego que lo anterior tiene una solución
práctica y muy conocida en el mundo de la programación: las expresiones
regulares, que se estarán tratando en una sección posterior.

### Comparar cadenas de caracteres

Comparar cadenas de caracteres resulta muy útil en casos que se necesite
hacer una selección o toma de decisión dependiendo de una variable cuyo
valor sea un string. Para tal fin se utiliza la función `strcmp`
devuelve un valor lógico verdadero si las cadenas comparadas son iguales
y falso en caso contrario, la sintaxis es:

    >> strcmp(str1, str2);

Donde str1 y str2 son las cadenas a comparar. Revise los siguientes
ejemplos:

    >> strcmp('MATLAB','MATLAB')
    ans =
         1
    >> strcmp('MATLAB','matlab')
    ans =
         0

Del último ejemplo puede deducir que la función strcmp es case-sensitive
y aun cuando las cadenas sean iguales y difieran únicamente por el uso
de mayúsculas o minúsculas, MATLAB devolverá un valor `false`. Para
ignorar o evitar que se tome en cuenta el uso de mayúsculas o minúsculas
puede emplear previamente una conversión a cualquiera de los casos, por
ejemplo:

    >> strcmp(lower('MATLAB'),lower('matlab'))
    ans =
         1

Por alguna razón la solución anterior podría parecerle poco elegante,
quizá lo mismo pensaron los desarrolladores de MathWorks y decidieron
ofrecer una función muy similar a strcmp, con la diferencia de ser
case-insensitive, hablamos de strcmpi:

    >> strcmpi('MATLAB','matlab')
    ans =
         1

### Expresiones regulares

Las expresiones regulares son patrones utilizados para encontrar una determinada 
combinación de caracteres dentro de una cadena de texto. [^mozdev]

[^mozdev]: https://developer.mozilla.org/es/docs/Web/JavaScript/Guide/Regular_Expressions

La utilidad de las expresiones regulares se vuelve evidente cuando debemos 
utilizar patrones de búsqueda en lugar de expresiones concretas.

Por ejemplo, vamos a suponer que tenemos un texto o string que contiene 
palabras varias, y del mismo queremos extraer todas las fechas con formato 
DD/MM/AAAA. Con una búsqueda ordinaria (`findstr` o `strfind`) tendríamos que 
definir cada string exacto que vamos a buscar o bien iterar para buscar todas 
las combinaciones posibles. Sí, suena bastante tardado, y quizá para un millar 
de líneas empezaríamos a buscar otras alternativas. No obstante, utilizando 
expresiones regulares podemos implementar una búsqueda  mediante 
patrones, con un sencillez considerable.

En las siguientes subsecciones veremos algunos ejemplos de cómo utilizar 
las expresiones regulares para búsqueda de patrones.

#### La función `regexp`

La función básica de MATLAB para buscar patrones mediante expresiones regulares 
es `regexp`, cuya sintaxis es:

    r = regexp(string, expr, option)

Donde `expr` es el patrón a buscar dentro de la cadena `string`, `option` es una 
parámetro predefinido que indica el tipo de salida que se guardará en `r`. 
Para la mayoría de los casos `option` puede ser `'match'` o `'start'`, en cuyo 
caso se tendrían como salida un cell array de las coincidencias encontradas y 
una lista de valores numéricos que indican la posición del primer caracter para 
cada una de las coincidencias, de manera respectiva.

#### Buscando números

Para entender mejor las expresiones regulares vamos a comenzar con un caso muy 
sencillo: buscar números dentro de un string.

El siguiente código muestra cómo buscar un número entero de cualquier cantidad 
de cifras dentro de un string:

    >> str = 'Avenida Siempreviva 742';
    >> nums = regexp(str,'\d*','match')
    nums = 
        '742'

El patrón o expresión `\d` le indica a MATLAB que queremos encontrar todos 
los caracteres que correspondan a un número, luego, el asterisco (`*`) se 
utiliza para especificar que pueden ser substrings de longitud cualesquiera, 
es decir, pueden ser números de dos, tres, cuatro o muchas cifras.

Note que, además, hemos pasado el argumento `'match'` a la función `regexp`, entonces 
nos devuelve la coincidencia encontrada, si en cambio pasamos `'start'` 
retornará el índice correspondiente al primer elemento de la coincidencia:

    >> nums = regexp(str,'\d*','start')
    nums =
        21

Lo anterior funciona bastante bien para números enteros, pero ¿qué pasa si 
tenemos cantidades con parte decimal?

    >> str = 'Tengo 1.5 y le sumo 0.45 con lo cual obtendré 1.95';
    >> nums = regexp(str,'\d*','match')
    nums = 
        '1'    '5'    '0'    '45'    '1'    '95'

Naturalmente esperaríamos obtener algo como `'1.5',  '0.45',  '1.95'`, pero 
el patrón que hemos especificado no corresponde con esas subcadenas, dado 
que el punto decimal no es propiamente un número. Entonces, debemos construir un 
patrón basándonos en la estructura general de un número decimal, el cual tiene 
una parte entera, el punto decimal y la parte fraccionaria, con lo cual podemos 
intuir que un patrón `\d*\.\d*` funcionará sin problemas, testeando esto:

    >> nums = regexp(str,'\d*\.\d*','match')
    nums = 
        '1.5'    '0.45'    '1.95'

Excelente, ¿cierto?. Sí, es un patrón que funciona para encontrar coincidencias 
de números decimales, pero que nos dejará a los enteros en el camino:

    >> str = ' 1 + 2 = 3 y 0.5 + 2.5 = 3.0';
    >> nums = regexp(str,'\d*\.\d*','match')
    nums = 
        '0.5'    '2.5'    '3.0'

Para corregir esto podemos utilizar un patrón más generalizado, que incluya tanto 
números enteros como decimales, como el siguiente ejemplo:

    >> str = ' 1 + 2 = 3 y 0.5 + 2.5 = 3.0';
    >> nums = regexp(str,'[\d\.]+','match')
    nums = 
        '1'    '2'    '3'    '0.5'    '2.5'    '3.0'

En lo anterior los corchetes se utilizan para agrupar un conjunto de caracteres, 
en este caso números y el punto decimal, además, el signo `+` sirve para indicar 
que los caracteres dentro de los corchetes podrían presentarse al menos una vez.

#### Buscando palabras

Una búsqueda ordinaria de palabras consiste en buscar una coincidencia exacta, 
una palabra o frase a la vez. No obstante, usando expresiones regulares podemos 
buscar coincidencias con una o más palabras, de manera incluyente.

Por ejemplo, vamos a tomar como referencia el poema *Amor mío, mi amor* del gran 
Jaime Sabines, y veremos cuantas veces utilizó las palabras amor y amar.

**Amor mío, mi amor.**

*Amor mío, mi amor, amor hallado*  
*de pronto en la ostra de la muerte.*  
*Quiero comer contigo, estar, amar contigo,*  
*quiero tocarte, verte.*  

*Me lo digo, lo dicen en mi cuerpo*  
*los hilos de mi sangre acostumbrada,*  
*lo dice este dolor y mis zapatos*  
*y mi boca y mi almohada.*  

*Te quiero, amor, amor absurdamente,*  
*tontamente, perdido, iluminado,*  
*soñando rosas e inventando estrellas*  
*y diciéndote adiós yendo a tu lado.*  

*Te quiero desde el poste de la esquina,*  
*desde la alfombra de ese cuarto a solas,*  
*en las sábanas tibias de tu cuerpo*  
*donde se duerme un agua de amapolas.*  

*Cabellera del aire desvelado,*  
*río de noche, platanar oscuro,*  
*colmena ciega, amor desenterrado,*  
*voy a seguir tus pasos hacia arriba,*  
*de tus pies a tu muslo y tu costado.*  

**-Jaime Sabines**

    >> str = fileread('amor_mio_mi_amor.txt');
    >> p = regexp(str,'amor|amar','match')
    p = 
        'amor'    'amor'    'amar'    'amor'    'amor'    'amor'

Vea que se utiliza el operador `|` para indicar que pueden ser tanto 
`amor` como `amar` las coincidencias a incluir. Incluso para el caso anterior 
puede observar que las palabras buscadas difieren en una letra, de modo 
que podemos usar un patrón como sigue:

    >> p=regexp(str,'am(a|o)r','match')
    p = 
        'amor'    'amor'    'amar'    'amor'    'amor'    'amor'

y funciona exactamente de la misma manera. Podemos incluso mejorar 
nuestro patrón de búsqueda haciendo que se incluyan las palabras 
que inician con mayúscula:

    >> p=regexp(str,'(A|a)m(a|o)r','match')
    p = 
        'Amor'    'amor'    'amor'    'amar'    'amor'    'amor'    'amor'


---

## Problemas

