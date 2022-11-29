'use strict';
const fs = require('fs');
fs.readFile('personas.json', (err, data) => {

   if (err) throw err;

   console.log(JSON.parse(data));
   //console.log(JSON.stringify(data));
   //console.log(typeof(JSON.stringify(data)));

   //console.log(data);
   //console.log(typeof(data));
});

////////////// .stringify() ////////////////
/*
   a)
   Recibe un objeto como parametro y
   devuelve una cadena JSON.

   El ejercicio nos devuelve una salida
   de un objeto con un monton de numeros
   como datos ("data" : [123, 13, 10, ...])
*/

////////////// data ////////////////
/*
   b)
   El ejercicio nos devuelve una salida
   que es el Buffer con el contenido en tipo
   de formato de Bytes...

   El readFile No nos devuelve un onjeto
   que javascript pueda interpretar por eso
   en los dos casos hay que "parsear" el contenido
   de personas.js con .parse()
*/