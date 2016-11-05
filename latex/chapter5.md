# Exportar e importar variables y datos

## Guardar y cargar variables del workspace: save y load

Durante una sesión ordinaria utilizando MATLAB las variables creadas se
almacenan en el workspace y están disponibles para usarse, siempre y
cuando no se haya utilizado algún comando para borrar las variables, sin
embargo cuando se cierra la sesión de MATLAB las variables del workspace
son borradas y no es posible utilizarlas posteriormente. Para poder
“conservar” una variable creada y utilizarla en cálculos futuros, es
posible guardar estas en archivos MAT nativos del lenguaje MATLAB; lo
anterior se logra utilizando la función save, cuya sintaxis es:

    save('nomb_arch.mat','nvar');

Siendo `nomb_arch` el nombre del archivo en el cual se guardarán las
variables, que incluso puede ser una combinación de una dirección
absoluta o relativa y el nombre del archivo; nvar es el nombre de la
variable o variables a ser guardadas. Si desea guardar todas las
variables actuales puede omitir el resto de argumentos y solo utilizar
el nombre del archivo. Las siguientes líneas ejemplifican cómo hacer uso
de la función save:

    >> k=1.37;
    >> A=[1 2 -1;0 1 0;-2 0 0];
    >> C={'A','B','C'};
    >> save('arch1.mat'); % Guarda todas las variables
    >> save('arch2.mat','A'); % Guarda sólo la variable A

El contenido de los archivos MAT puede cargarse y guardar en el
workspace mediante la función `load`, con la sintaxis:

    load('narch.mat','vars');

Donde narch es el nombre del archivo y vars la(s) variable(s) a cargar
en el workspace. Si únicamente se indica como argumento el nombre del
archivo, entonces se cargan todas las variables contenidas en el
archivo. Para ejemplificar el uso de load utilizaremos el archivo
“arch1.mat” creado anteriormente:

    >> load('arch1.mat');
    >> whos % Verificamos las variables cargadas en el workspace
      Name      Size            Bytes  Class     Attributes
      A         3x3                72  double              
      C         1x3               342  cell                
      k         1x1                 8  double       

Puede asignarse la función load a una variable, con lo cual todo el
contenido del archivo MAT se guardara en una estructura con cada una de
las variables como campos. Para el mismo ejemplo anterior se tiene:

    >> S=load('arch1.mat');
    >> S
    S = 
        k: 1.3700
        A: [3x3 double]
        C: {'A'  'B'  'C'}
    >> whos 
      Name      Size            Bytes  Class     Attributes
      S         1x1               950  struct       

## Carpetas y archivos, operaciones básicas.

### Cambiar el directorio o carpeta actual

La función `cd` cambia la carpeta actual (Current Folder), utilizando como
argumento una cadena de caracteres con la dirección absoluta o relativa
del nuevo directorio de trabajo. La sintaxis es:

    cd('Nueva Carpeta');

Un ejemplo se muestra enseguida: 

    cd('C:\Users\User\Documents\MATLAB');

Si solo se pone la instrucción `cd` sin argumentos, entonces MATLAB
devuelve un string con la carpeta actual.

I> ### Direcciones absolutas y relativas
I>
I> Una dirección absoluta es aquella representada mediante toda la ruta
I> que la describe, incluyendo al directorio raíz. En Windows las
I> direcciones absolutas suelen ser de la forma `C:/Users/User/…`, donde
I> User es el nombre del usuario registrado en el equipo. Las direcciones
I> relativas se expresan con respecto a una determinada carpeta, por
I> ejemplo, si estamos ubicados dentro de una carpeta Documents cuya
I> dirección absoluta es `C:/Users/User/Documents` y dentro de ella
I> tenemos una carpeta llamada MATLAB, la forma relativa de referirnos a
I> esta carpeta sería simplemente con la cadena `’’`.

### Crear y eliminar carpetas

A estas alturas, crear y manipular carpetas resulta una tarea trivial
cuando se ejecuta en el ambiente de cualquier sistema operativo que
maneje, incluso en el Current Folder de MATLAB puede crear, modificar y
eliminar carpetas tal como lo hace normalmente. Pese a lo anterior, en
diversas situaciones puede ser necesario crear carpetas mediante la
ejecución de código a través de comandos y/o funciones destinadas para
tal fin. En MATLAB se dispone de la función mkdir que permite crear
carpetas utilizando el nombre de la misma como argumento, por ejemplo:

    >> mkdir('Mis Cursos');

La instrucción anterior crea una carpeta llamada Mis Cursos en el
directorio actual de trabajo. Es posible también pasar como argumento la
dirección absoluta o relativa de la carpeta a crear:

    >> mkdir('Mis Cursos/MATLAB');

En la línea anterior se crea dentro de la carpeta Mis Cursos una cuyo
nombre es MATLAB.

Habitualmente en la programación se hace necesario considerar la mayoría
de las situaciones posibles para dar una mayor robustez al código, y con
ello hacerlo más autónomo y eficiente. Imagine que necesite crear
carpeta a la cual le asignará un nombre determinado, entonces, hay una
posibilidad, aun siendo mínima, que ya exista una carpeta con ese mismo
nombre. MATLAB no remplazará la carpeta existente por la nueva, pero le
mostrará un mensaje de error o advertencia y posiblemente detenga la
ejecución del código. Para evitar lo anterior puede comprobar antes si
existe un directorio con ese nombre y mediante una sentencia de control
especificar las acciones a ejecutar en cada caso. Véase el ejemplo
siguiente en donde se realiza la comprobación mediante la función isdir:

    if ~isdir('Cursos')
        mkdir('Cursos');
    else
        mkdir(['Cursos','2']);
    end

Para eliminar una carpeta MATLAB proporciona la función rmdir cuyo
argumento es la carpeta a eliminar, o bien la dirección absoluta o
relativa de la misma. Por ejemplo, si quiere eliminar una carpeta
llamada Cursos, ubicada en el directorio actual:

    >> rmdir('Mis Cursos');

Lo anterior funciona para carpetas que no contengan subcarpetas, de lo
contrario MATLAB le devolverá un mensaje de error como el siguiente:

    >> rmdir('Mis Cursos')
    Error using rmdir
    No directories were removed.

Para borrar una carpeta que contenga subcarpetas debe incluir un segundo
argumento, siendo este una “s” entre comillas simples, como se muestra:

    >> rmdir('Mis Cursos','s');

### Crear y eliminar carpetas

Conocer los archivos y directorios dentro de una carpeta suele ser una
necesidad básica para cualquier programador, sobre todo para el
almacenamiento y organización de archivos de trabajo. MATLAB cuenta con
funciones que facilitan la tarea de consultar el contenido de una
carpeta, entre las más comunes están `dir`, `ls` y `what`, a continuación
veremos la utilidad de cada una.

#### La función dir

La función dir, sin argumentos de salida pedidos de forma explícita y
sin argumentos de entrada, devuelve en pantalla una lista de archivos y
directorios contenidos en el **Current Folder**. Véase el ejemplo:

    >> dir
    .               grlev.png       matricesEx.m    
    ..              idmat.m         ordseleccion.m  
    datos.txt       img.png         unos.m     

No obstante, si asignamos la función dir a una variable cualesquiera
entonces se guardará una estructura que contiene información acerca del
nombre, tamaño, fecha de modificación, entre otras características de
los archivos contenidos en el directorio actual.

    >> S=dir
    S = 
    9x1 struct array with fields:
        name
        date
        bytes
        isdir
        datenum

Para acceder a la información de cada archivo puede hacerlo mediante el
índice correspondiente, por ejemplo:

    >> S(3)
    ans = 
           name: 'datos.txt'
           date: '01-oct-2014 15:13:46'
          bytes: 74
          isdir: 0
        datenum: 7.3587e+05

Desde luego que esta forma de utilizar la función `dir` es mucho más útil
que aquella que simplemente muestra en pantalla la información.

Es posible además especificar como argumento la dirección de la cual se
requiere información (una distinta al Current Folder) e inclusive
utilizar comodines para visualizar solo archivos con una determinada
extensión, por ejemplo:

    >> dir('C:/Users/User/Documents/MATLAB/*.png')
    ayuda.png  img.png 

La instrucción anterior busca en la carpeta MATLAB todos los archivos
con extensión PNG (imágenes), sin importar el nombre de estos, e ignora
cualquier otro tipo de archivo o directorio ubicado en esta misma
carpeta. Ahora, revise el siguiente ejemplo:

    >> dir('C:/Users/User/Documents/MATLAB/m*')
    MATLAB TYP           Mecanismos           My File Exchange     
    MATLAB_Function.m    Mis Apuntes          matrizBinaria.m      
    Matemáticas Básicas  Moler Books          miHist.m       

Como puede observar, MATLAB devuelve todos aquellos archivos y carpetas
cuya primera letra sea **m**, sin importar ninguna otra característica.

### Mover, copiar y eliminar archivos

Mover, copiar y eliminar archivos son tareas muy comunes para cualquier
usuario de un ordenador y que pueden ejecutarse con mucha facilidad de
forma manual. No obstante, utilizar la programación para estas tareas
puede resultar de mucha ayuda, sobre todo cuando se necesita trabajar
con grandes volúmenes de datos y/o archivos, ya que permite automatizar
los procedimientos y ejecutarlos en un tiempo impensable para un
individuo. Claro que se podría justificar que existen formas para
seleccionar todos los archivos de un directorio y colocarlos en otro de
forma muy sencilla aun cuando fuesen millares de archivos, pero ¿qué
pasa si solo necesitamos trabajar con archivos cuyo nombre cumpla una
determinada característica o patrón? ¿O con archivos de un tamaño
específico? ¿O con una fecha de modificación reciente?, incluso con
combinaciones de las anteriores posibilidades, de esa manera no es tan
trivial seleccionar de forma manual archivos que cumplan tales
condiciones, pero utilizando la programación puede solucionar de forma
efectiva dichas situaciones.

MATLAB proporciona funciones que sirven para realizar las tareas
mencionadas en el párrafo anterior. Con movefile y copyfile puede mover
y copiar archivos de un directorio a otro, la sintaxis es muy similar,
necesitando solamente el directorio origen y destino como argumentos de
entrada. Usaremos movefile para ejemplificar, pero desde luego que esto
será aplicable para copyfile con tan solo cambiar el nombre de la
función.

## Exportar e importar datos de un fichero de texto

Existen múltiples formatos para ficheros que almacenan datos o texto
plano, siendo los más comunes el `*.txt` y el `*.dat`. Estos tipos de
ficheros son muy utilizados en casi cualquier ámbito para guardar datos
de cualquier tipo, con la ventaja de ser *leíbles* para una persona y,
por supuesto, para la computadora. Por tanto, con frecuencia se hace
necesario el hecho de importar y/o exportar información de un archivo de
este tipo, además es muy común utilizar MATLAB como un entorno de
visualización de datos generados a través de la adquisición mediante
tarjetas o bien mediante otro software.

### Exportar datos con `dlmwrite`

La función `dlmwrite` exporta el contenido de una matriz a un archivo de
texto usando un delimitador o separador entre los elementos. La sintaxis
más común es:

    >> dlmwrite(n_arch, M, 'delimitador');

Donde `n_arch` es el nombre del archivo en el cual se guardará la matriz
M, utilizando como separador el carácter especificado en `'delimitador'`.

