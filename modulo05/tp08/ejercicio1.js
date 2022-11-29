const fs = require('fs');
let rawdata = fs.readFileSync('./personas.json');
let persona = JSON.parse(rawdata);
//console.log(persona);
console.log(JSON.stringify(rawdata));

//const stringify = JSON.stringify(rawdata);
//console.log(typeof(stringify));


////////////// .parse() ////////////////
/*
   Acepta una cadena JSON como parametro
   y devuelve un objeto javascript.

   El ejercicio nos devuelve el contenido
   del archivo JSON, osea el objeto "personas.
*/

////////////// .stringify() ////////////////
/*
   Recibe un objeto como parametro y
   devuelve una cadena JSON.

   El ejercicio nos devuelve una salida
   de un objeto con un monton de numeros
   como datos ("data" : [123, 13, 10, ...])
*/