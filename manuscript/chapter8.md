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


## Elementos gráficos 

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
con este.

| **Tipo** | **Control gráfico** |
| `checkbox` | ![](images/ch8/checkbox.png) |
| `edit` | ![](images/ch8/edit.png) |
| `listbox` | ![](images/ch8/listbox.png) |
| `popupmenu` | ![](images/ch8/popupmenu.png) |
| `pushbutton` | ![](images/ch8/pushbutton.png) |
| `radiobutton` | ![](images/ch8/radiobutton.png) |
| `slider` | ![](images/ch8/slider.png) |
| `text` | ![](images/ch8/text.png) |
| `togglebutton` | ![](images/ch8/togglebutton.png) |


#### Check Box

#### Edit Text

#### List Box

#### Pop-up Menu

#### Push Button 

#### Radio Button

#### Slider

#### Static Text


#### Toggle Button


### 