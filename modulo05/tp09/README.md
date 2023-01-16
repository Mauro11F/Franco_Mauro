# CURSO PROGRAMACIÓN WEB FULL STACK (NIVEL 2)

## Módulo 5 - Programación BackEnd Trabajo Práctico 9.a

**Ejercicio 1**

- Investigar y dar una definición con sus palabras los siguientes términos:
  - REST
  - API
  - Endpoint
  - Encabezados (headers)

---

**Ejercicio 2**

- A) Realizar un fork, descargar y luego configurar el proyecto para que funcione localmente:
https://github.com/FacundoRauber/alpha-silicon
- B) Crear las siguientes tablas en la base de datos:

| CURSOS |                    |                     |
| ------ | :----------------: | -------------------:|
|        |       idcurso      |  int pk unico ai    |
|        |       nombre       |   varchar(100)      |
|        |     descripcion    |        text         |
|        |       estado       | char(1) default ‘1’ |

| USUARIOS  |                    |                     |
| --------- | :----------------: | -------------------:|
|           |     idusuario      |  int pk unique ai   |
|           |     nickname       | varchar(100) unique |
|           |        email       | varchar(100) unique |
|           |     password       |     varchar(100)    |
|           |       estado       | char(1) default ‘1’ |

| MATERIAS  |                    |                     |
| --------- | :----------------: | -------------------:|
|           |     idmateria      |   int pk unico ai   |
|           |      nombre        |     varchar(100)    |
|           |     objetivo       |         text        |
|           |   plan_estudio     |         text        |
|           |       estado       | char(1) default ‘1’ |

| SEDES  |              |                     |
| ------ | :----------: | -------------------:|
|        |   idsede     |   int pk unico ai   |
|        |   nombre     |    varchar(100)     |
|        |  dirección   |       text          |
|        |  localidad   |    varchar(50)      |
|        |  cod_postal  |    varchar(10)      |
|        | telcontacto1 |    varchar(15)      |
|        | telcontacto2 |    varchar(15)      |
|        |   estado     | char(1) default ‘1’ |


- C) Dar de alta como mínimo 5 cursos, materias y usuarios.Algunos ejemplos pueden ser:
  - Cursos: Introducción a la programación, Programación full stack, …
  - Materias: Ingles 1, Ingles 2, Programación Web, Base de datos, Programación de Apps, …
- D) Agregar al proyecto los controllers y datasource para poder realizar un alta, baja (solo lógica) y modificación de cursos, materias, sedes y usuarios.

`Nota: verificar que los endpoint funcionen correctamente`

---

**Ejercicio 3**

- A) Hacer un backup (dump) de la base de datos.
- B) Subir los cambios al repositorio personal y compartir el enlace en canvas.

---

## Los ejercicios subirlos a un repositorio público y compartir la URL en canvas.

```java
El repositorio debería ser apellido_nombre/modulo-N/tp-N/ejercicio-N.extencion
Donde:
apellido_nombre es el nombre del repositorio y representa al nombre y apellido del alumna/o.
N representa a un número de módulo, trabajo práctico o ejercicio.
extensión: es del archivo.
```

Generar un espacio de trabajo con los issues en el repositorio :
`https://github.com/FacundoRauber/fullstack2022/issues/new/choose`

 ## Bibliografía, instaladores, herramientas y mas
 
`https://www.w3schools.com/nodejs/nodejs_mysql.asp`

`https://jsdoc.app/tags-param.html`

`https://siliconmisiones.gob.ar/programacion-garupa-2-de-mayo-obera/`

Opcional Hosting MySQL:

`https://www.db4free.net/`

`https://www.freesqldatabase.com/`
 
 ---
