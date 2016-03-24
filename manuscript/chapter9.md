Programación orientada a objetos
================================

Conceptos básicos de la POO
---------------------------

La programación orientada a objetos (POO) es un paradigma de
programación que utiliza objetos como parte esencial de sus
interacciones, para el desarrollo de aplicaciones y soluciones
tecnológicas. La POO está soportada por técnicas de programación tales
como la herencia, el polimorfismo, el encapsulamiento, entre otras, cada
una de ellas proporciona herramientas que han permitido la proliferación
de este modelo de programación en las últimas décadas. Actualmente
existen una variedad de lenguajes que soportan la POO, siendo los más
conocidos C++, Java y C\#.\
El soporte *moderno* de MATLAB para la POO es relativamente nuevo,
siendo introducido a partir de la versión 7.6 (R2008a) con notables
carencias respecto a los lenguajes de referencia en ese aspecto, pero
evidentemente la mejora desde entonces ha sido considerable.\

> Con soporte *moderno* se hace alusión a la notación actual que se
> utiliza en la definición de clases, por ejemplo `classdef` para crear
> una clase. Puesto que antes de la implementación de esta notación,
> existía la posibilidad de programar orientado a objetos haciendo uso
> de algunos *artilugios*, como el colocar la clase (definida mediante
> una función que hacía lo de un *constructor* de la clase) y sus
> métodos dentro de una carpeta cuyo nombre debería ser el de la clase
> misma anteponiéndole un arroba (@).

### Clases y objetos

Una clase es una definición de las propiedades y/o características de un
determinado tipo de objetos, es decir, un modelo particular que sirve
para crear objetos bajo esas mismas especificaciones.\
Un objeto es la representación concreta derivada de una clase que está
provisto de atributos y métodos, o en términos más formales: un objeto
es la instancia de una clase.\
A manera de ejemplo y un contexto más apegado a la realidad,
consideremos a los perros como una determinada clase, es sencillo
hacernos la idea de cómo es un perro y cuáles son sus características y
apariencia general; luego, el perro que tenemos en casa (en caso de que
así sea) es una instancia de esa clase o un objeto de la clase perro,
con características más particulares pero que no les excluyen de ser un
perro.\

### Atributos

Los atributos son las propiedades asociadas a una clase de objetos.
Siguiendo con el ejemplo de los perros, estos tienen atributos como el
tamaño, color, raza, temperamento, etc. Es común en la POO diferenciar
entre dos tipos de atributos acorde a su accesibilidad: los privados y
los públicos. Los privados son atributos disponibles solo dentro de la
definición de la clase, en cambio los públicos son accesibles desde
cualquier otra clase o fichero de instrucciones.

### Métodos

Los métodos de una clase de objetos son algoritmos o bloques de
programación que determinan el comportamiento de un objeto. Por lo
general los métodos se usan para modificar los atributos de un objeto o
bien generar un nuevo evento. En MATLAB los métodos son definidos
mediante funciones.

### Eventos

Un evento es la *reacción* que tiene un objeto resultante de la
interacción con el usuario o bien mediante la ejecución de los métodos.

Definiendo clases en MATLAB
---------------------------

Las clases son el *alma* de la POO, y suelen definirse en ficheros
únicos. En MATLAB pueden crearse utilizando un fichero \*.m ordinario y
colocando en este la sintaxis para la definición de una clase, la cual
se muestra enseguida:

        classdef nombreClase
            % Descripción de la clase
            
            properties
                % Atributos
            end
            
            methods
                % Métodos
            end
            
        end

En la mayoría de los lenguajes que soportan POO se utiliza la palabra
clave class para definir una clase, pero en MATLAB class se utiliza para
identificar el tipo o clase de una variable u objeto, y en cambio se
utiliza classdef para definir una clase. Los atributos de una clase se
definen en un bloque properties-end, y pueden simplemente ser declarados
sin asignación de valores. Los métodos de la clase se especifican dentro
de un bloque methods-end, incluyendo al constructor de la clase.

### El constructor de la clase

El constructor de una clase es parte esencial de la misma y en este se
definen los argumentos o parámetros formales necesarios para crear un
objeto de la clase, de ahí su importancia. En MATLAB el constructor se
considera, de manera no estricta, un método y por tanto se define dentro
del bloque correspondiente a los métodos. Así pues, incluyendo al
constructor la definición de una clase sería algo similar a:

        classdef nombreClase
            % Descripción de la clase
            
            properties
                % Atributos
            end
            
            methods
                function obj = nombreClase(args)
                   % Constructor de la clase 
                end
                % ...
                % Métodos
                % ...
            end
            
        end

En lo anterior obj es, dentro la definición de la clase, una referencia
al objeto instanciado y es obligatorio el colocarlo como *valor de
salida* (en la terminología de funciones); claro que el identificador
`obj` puede cambiarlo por cualesquiera otro de su comodidad (`this` o
`self` podrían ser buenas opciones, claro, mucho influye el hecho de
haber programado en otro lenguaje de POO en este tipo de *adopciones* de
estilo). Tal como se ejemplifica, el nombre de la función que funge como
constructor debe ser el mismo que el de la clase, además deben
especificarse los argumentos que se utilizarán para crear un objeto.

La clase Persona, una primera aproximación
------------------------------------------

En la sección anterior hemos visto la sintaxis para definir una clase,
pero como casi todo siempre es mejor asociar un concepto teórico con un
ejemplo concreto. Para tal fin crearemos la clase Persona, de naturaleza
muy sencilla pero significativa.\
En principio vamos a definir las propiedades o atributos que habrán de
caracterizar a un objeto de la clase Persona, así pues, dada la
simplicidad del caso solamente utilizaremos el nombre y la edad para
*construir* un objeto de esta clase. Por ahora no definiremos método
alguno, solamente el constructor de la clase. Véase la definición
resultante:

        classdef Persona
            % Persona
            %
            % Ejemplo :
            %           p1 = Persona('Jorge',22);
            %           p2 = Persona('Anna',28);          
            %
            
            properties % Atributos de la clase
                nombre;
                edad;
            end
            
            methods
                function obj = Persona(nombre,edad) % Constructor
                    obj.edad=edad;
                    obj.nombre=nombre;
                end
            end
            
        end

Para *testear* una clase podemos crear un script en donde colocar las
instrucciones necesarias para crear un objeto de la misma. No obstante,
por ahora haremos esto en la ventana de comandos de la siguiente manera:

        >> p = Persona('Ana',25);
        >> whos
          Name      Size            Bytes  Class      Attributes
          p         1x1               118  Persona        
