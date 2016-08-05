# Introducción a las GUIs MATLAB

Una interfaz gráfica de usuario (GUI) es un elemento gráfico que
contiene uno o más controles que están disponibles para interactuar con
el usuario mediante un entorno visual sencillo, el cual permite la
comunicación entre el usuario y el computador. Entre algunos de los
componentes más comunes de una GUI creada en MATLAB se tienen menús,
barras de herramientas, botones, menús desplegables, cajas de texto,
entre otros.

En las interfaces gráficas creadas en MATLAB pueden aprovecharse todas
las herramientas matemáticas y de ingeniería que proporciona MATLAB,
permiten además la manipulación de archivos de datos, así como la
interacción con otras GUIs y mostrar datos mediante tablas y gráficas de
gran calidad.

Generalmente las GUIs son programadas para que respondan a la
manipulación del usuario con una acción específica. Los controles
gráficos que componen una GUI están relacionados con una rutina de
programación, llamada callbacks en el entorno MATLAB, que se ejecuta
cuando sucede un determinado evento, que puede ser la entrada de
caracteres mediante el teclado, el clic de un botón del mouse, o
situarse sobre un objeto.

## ¿Cómo crear una GUI en MATLAB?

Una interfaz gráfica de usuario en MATLAB puede crearse de dos maneras, 
a saber:

* Utilizando el entorno de desarrollo integrado (GUIDE - *Graphical User Interface Development Environment*).
* Código puro (programmatically GUI), es decir, utilizando sólo un script en el cual se colocarán 
  las instrucciones necesarias para producir una interfaz gráfica.

¿Cuál es la mejor manera?, imposible dar una respuesta, dependerá mucho de 
con cuál el desarrollador se sienta más cómodo. Utilizando GUIDE puedes 
desarrollar interfaces gráficas rapidamente, arrastrando controles y 
posicionándolos manualmente, para enseguida programar la lógica principal. 
Con código puro quizá necesitas un poco más de *destreza* para colocar y 
organizar los elementos, pero vamos, nada complicado en extremo. 

En este capítulo, para presentar y conocer los objetos gráficos y sus propiedades 
utilizaremos código puro, dado que esto permite proporcionar toda la información 
necesaria a través del código mostrado, sin requerir ningún otro tipo de archivo 
adicional

## Los objetos gráficos en MATLAB

Graphics objects are the visual components used by MATLAB® to display data graphically. For example, a graph can contain lines, text, and axes, all displayed in a figure window.

Los objetos gráficos son los componentes visuales usados por MATLAB.


![Jerarquía de los objetos gráficos en MATLAB](images/ch8/checkbox_example.png)

## Elemento `figure`

En MATLAB cada interfaz gráfica está creada sobre un objeto figure, en
este elemento se añaden todos los controles gráficos que componen la
GUI. La forma más simple de definir un objeto figure se ejemplifica
enseguida:

    hFig = figure;

Donde `hFig` es el handle o referencia del elemento figure.

Es muy común que al momento de definir o crear un objeto figure, se
especifiquen algunas de sus propiedades con la sintaxis siguiente:

    hFig = figure('Propiedad ', 'Valor ',...);

A continuación se muestra un ejemplo característico:

    hFig = figure('NumberTitle','off',...
                  'MenuBar','None',...
                  'Name','Figure Ejemplo',...
                  'Position',[200 200 300 300]);

Las propiedades más comunes de un elemento figure se muestran en la
tabla siguiente:


| **Propiedad** | **Descripción** |
| `Color` | Establece el color de figure. El valor puede establecerse mediante un vector de tres elementos en formato RGB |
| `MenuBar` | Oculta o muestra la barra de menús estándar de MATLAB |
| `Name` | Título mostrado en la ventana de la figura. El valor especificado es una cadena de caracteres |
| `NumberTitle` | Determina si la numeración de los elementos figure creada automáticamente por MATLAB será visible. El valor por defecto es on, para ocultar deberá especificarse off. |
| `Position` | Especifica el tamaño de la GUI y la posición relativa a la esquina inferior izquierda de la pantalla. El valor se establece mediante un vector de cuatro elementos cuya estructura es la siguiente: `[Distancia de la izquierda, Distancia de la parte inferior, Ancho, Alto];` |
| `Resize` | Determina si puede modificarse el tamaño de la GUI utilizando el mouse. Los valores aceptados son: off y on, siendo este último el valor por defecto. |
| `Toolbar` | Muestra o borra el menú de herramientas del objeto figure. |
| `Units` | Unidad de medida que se utilizará para interpretar el vector de la propiedad position. Los valores disponibles son: centimeters, characters, inches, normalized, point y pixels. Siendo este último el valor por defecto. |
| `Visible` | Establece si la GUI es visible. Valores: on y off. |


## Controles de usuario

Los elementos gráficos son todos aquellos componentes que conforman una interfaz gráfica y que están 
contenidos dentro de una ventana o *figure*. Estos elementos pueden ser campos de texto, botones, 
listas desplegables, paneles, axes o cualquier otro tipo de elemento gráfico que permita una interacción 
con el usuario.


### Controles generales (`uicontrol`)

En esta sección vamos a ver cómo crear los controles básicos utilizando la función `uicontrol`, 
misma que tiene una sintaxis como sigue:

    hCont = uicontrol(Parent, 'Style', 'tipo de control',...
                      'Propiedad', 'Valor');

Donde `Parent` es un objeto gráfico de mayor jerarquía (como puede ser un panel o un frame/ventana) en
el cual va a estar contenido el control gráfico. La propiedad `style` define el tipo de control gráfico 
a desarrollar. Luego, se pueden pasar varios *argumentos pareados* que definan otras características del 
control como pueden ser la posición, el color, el contenido o valor, o bien la asociación a una 
función que maneje el evento *disparado* cuando el usuario o la lógica del programa interaccionen 
con este. En `hCont` se guardará la referencia al objeto creado, mediante la cual 
posteriormente podemos acceder o modificar sus propiedades con las funciones `get` y `set`.

En la siguiente tabla se muestran los posibles tipos de control que pueden ser pasados en 
la propiedad `style`.

{title="Tipos de controles gráficos"}
| **Tipo (`style`)** | **Control gráfico** |
| `checkbox` | ![](images/ch8/checkbox.png) |
| `edit` | ![](images/ch8/edit.png) |
| `listbox` | ![](images/ch8/listbox.png) |
| `popupmenu` | ![](images/ch8/popupmenu.png) |
| `pushbutton` | ![](images/ch8/pushbutton.png) |
| `radiobutton` | ![](images/ch8/radiobutton.png) |
| `slider` | ![](images/ch8/slider.png) |
| `text` | ![](images/ch8/text.png) |
| `togglebutton` | ![](images/ch8/togglebutton.png) |

La siguiente tabla resume algunas de las *propiedades pareadas* más utilizadas,  que pueden pasarse 
como argumentos a la función `uicontrol`:


{title="Propiedades de `uicontrol`"}
| **Propiedad** | ***Descripción** |
| `BackgroundColor` | Establece el color del control. El valor puede establecerse mediante un vector de tres elementos en formato RGB |
| `Callback` | Función que se ejecuta cuando el usuario interactúa con el control gráfico. El valor pasado puede ser la referencia a una función, por ej: `@mifuncion`|
| `FontName` | Fuente a utilizar. Debe ser un string con el nombre de la fuente, la cual debería estar instalada.|
| `FontSize` | Tamaño de fuente. Valor numérico en las unidades dadas por `FontUnits` |
| `FontUnits` | Unidad utilizada para interpretar el valor numérico de `FontSize` |
| `FontWeight` | Aspecto de la fuente, puede ser `normal` o `bold` (negritas), por default es `normal` |
| `ForegroundColor` | Color de la fuente utilizada en control gráfico |
| `Parent` | Objeto gráfico padre. El valor debe ser un handle o referencia a un objeto gráfico de mayor jerarquía |
| `Position` | Especifica el tamaño del control y la posición relativa a la esquina inferior del objeto padre. El valor se establece mediante un vector de cuatro elementos cuya estructura es la siguiente: `[Distancia de la izquierda, Distancia de la parte inferior, Ancho, Alto];` |
| `String` | Cadena de texto que se muestra en el control. El valor pasado como argumento puede ser cualquier string.
| `Units` | Unidad de medida que se utilizará para interpretar el vector de la propiedad `position`. Los valores disponibles son: centimeters, characters, inches, normalized, point y pixels. Siendo este último el valor por defecto. |
| `Visible` | Establece si el control es visible. Valores: `on` y `off`. |


#### Check Box

El Check Box es un elemento gráfico que sirve como casilla de verificación, para indicar dos 
posibles estados: activado/desactivado o falso/verdadero, como un tipo de check list. Vea 
el siguiente código:

{linenos=off}
	function test_checkbox

	figure('MenuBar','none',...
	    'Position',[100 100 200 100]);

	uicontrol('style','checkbox',...
	    'string','Rojo',...
	    'Position',[10 10 80 20],...
	    'Callback',@cambia_color);

	    function cambia_color(src, ~)
	        if get(src,'Value') == true
	            set(gcf,'Color','r');
	        else
	            set(gcf,'Color',0.8*ones(1,3));
	        end
	    end
	end

El código anterior crea una ventana de 200x100 pixeles que contiene un check box con el string `Rojo`. 
Además, puede notar que a la propiedad `Callback` se la pasa como argumento una función `cambia_color` 
que cada vez que es "llamada" cambia el color de fondo de la ventana: a rojo cuando se activa el check box 
y al color por default cuando se desactiva.

![](images/ch8/checkbox_example.png)


#### Edit Text

Un *edit text* es un campo de texto editable en el cual se puede introducir información en 
forma de texto, es el clásico *input* que todos conocemos, como la barra de búsqueda en 
un buscador de internet o aquellos cuando rellenamos un formulario *online*.




#### List Box

#### Pop-up Menu

#### Push Button 

#### Radio Button

#### Slider

#### Static Text


#### Toggle Button


### Paneles


### Axes


### Tablas 