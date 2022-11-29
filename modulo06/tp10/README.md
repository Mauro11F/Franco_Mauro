# CURSO PROGRAMACIÓN WEB FULL STACK (NIVEL 2)

## Módulo 6 - Programación FrontEnd Trabajo Práctico 10

### HTML: Lenguaje de etiquetas de hipertexto

**HTML** no es un lenguaje de programación; es un lenguaje de marcado que define la estructura
de tu contenido. Los elementos se componen de: etiquetas (tags) con atributos y de contenido.

```html
<etiqueta_de_apertura> contenido <etiqueta_de_cierre>
```

**HTML** define el término elemento para referirse a las partes que componen los documentos
**HTML**. La estructura general de una línea de código (elemento) en lenguaje **HTML** sería ésta:

```html
<etiqueta atributo="valor">  ...  </etiqueta>
```

**HTML** define más de 140 etiquetas (algunas obsoletas en **HTML5**). La mayoría de las etiquetas
van en pareja: una inicial, entre ángulos, y otra final, también entre ángulos pero con la barra
inclinada derecha **/**, como por ejemplo la etiqueta de Título 1:

```html
<h1> Esto es un titulo principal </h1>
```

Una etiqueta por sí sola, a veces, no contiene la suficiente información para estar
completamente definida. Para ello existen atributos que son pares nombre-valor separados por
un **"="**. Los atributos pueden ser opcionales, pero algunas etiquetas necesitan ciertos atributos
para funcionar, como por ejemplo la etiqueta `<img>` para imágenes o la etiqueta `<a>` para
enlaces.
Además, los atributos siempre están escritos en la etiqueta inicial de un elemento, después del
nombre del elemento. El valor puede estar encerrado entre *"comillas dobles"* o *'simples'*.
Ejemplo:

```html
<button id="boton1" class="boton rojo"> Pulsa </button>

<a href="http://www.google.com" target="_black"> Ejemplo de enlace </a>
```

Donde

```html
<a> es la etiqueta o tag inical y </a> la etiqueta de cierre
href y > target son los atributos.
http://www.enlace.com y _blank son los valores.
Ejemplo de enlace es el contenido
```

No todas las etiquetas van por pares, hay algunas que se componen de una sola (son etiquetas
vacías), sin contenido, por ejemplo:

```html
<img src="/imagen.png">  ;  <br>  ;  <hr>
```

En resumen:

```html

              |      <html>   -------------------- >   Indica el inicio de la página web
              |
              |      <head>   -------------------- >   La Cabecera de la Página
              |
              |      <title>  -------------------- >   Titulo de la Página
              |       "El Titulo de la Página"
              |      </title> -------------------- >   Cierre de Etiqueta "/"
              |
Partes de una |      </head>
Página Web    |
              |      <body>  --------------------- >   Inicio del Contenido de la Página
              |
              |       "El contenido de la Página"
              |
              |      </body>
              |
              |      </html> --------------------- >   Fin del Documento html o página Web.
                     
```

---

### Ejercicio de ejemplo:

Copiar el siguiente código y guardarlo en un archivo mipagina.html. Luego abrir el archivo en el
navegador.

```html
<!DOCTYPE html>
<html lang="es">

<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="description" content="aproximadamente unos 160cc">
   <meta name="author" content="(cc) 3con14" />
   <link rel="icon" href="favicon.ico">
   <title>Título de la Página</title>
   <!-- Enlace a archivo/s de estilos CSS -->
   <link rel="stylesheet" href="css/normalize.css">
   <link rel="stylesheet" href="css/estilos.css">
</head>

<body>
   <h1>Esto es un título de nivel 1</h1>
   <p><em>Párrafo con texto tipográfico:</em> Lorem ipsum
      dolor sit amet, consectetur adipisicing elit. Explicabo
      consectetur, eum dignissimos repudiandae dolores odio
      ex blanditiis commodi labore fuga, veniam nostrum iste,
      sapiente? Veniam eos deleniti officia nemo error!</p>
   <!--
    Resto del contenido visible
    de la Página Web
   -->
   <!-- Enlace a archivo/s de programación JavaScript -->
   <script src="js/codigo.js"></script>
</body>

</html>
```

---

### Ejercicio 1:

- a) - Describe dos usos o funciones que proporciona la declaración DOCTYPE en una página web.
- b) - Para que se utilizan las siguientes etiquetas:

```html
  <head> </head>
  
  <title> </title>
  
  <meta>
  
  <style> </style>
  
  <body> </body>
  
  <h1>,<h2>,<h3>,<h4>,<h5>,<h6>
  
  <a>
  
  <strong>
  
  <br>
  
  <ul>
  
  <li>
  
  <p>
  
  <span>
  
  <table> </table>
  
  <tr> </tr>
  
  <td> </td>
  
  <img>
```

- c) - La etiqueta `<script>` puede ir dentro de las etiquetas de de `<body>` o `<head>`, hay alguna diferencia donde pueda ir?

---

### Ejercicio 2

A partir del texto que se proporciona, crear una página web que tenga el mismo aspecto que la
siguiente imagen:

![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png)

Reference-style: 
![logo]

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 2"




