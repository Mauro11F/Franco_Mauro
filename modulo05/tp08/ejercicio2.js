'use strict';
let jsonData = require('./personas.json');
//console.log(typeof(jsonData));

console.log(JSON.stringify(jsonData));

console.log(JSON.parse(jsonData));



////////////// .stringify() ////////////////
/*
   Recibe un objeto como parametro y
   devuelve una cadena JSON.

   El ejercicio nos devuelve el contenido
   del archivo JSON, en forma de lista o 
   todo el contenido uno al lado de otro
   sin los espacios osea sin "formatear"
*/

////////////// .parse() ////////////////
/*
   Acepta una cadena JSON como parametro
   y devuelve un objeto javascript.

   El ejercicio nos devuelve un error del
   tipo "SyntaxError: Unexpected token o 
   in JSON at position 1". El error se presenta
   por que el objeto .json que queremos "parsear"
   ya es un objeto del tipo javascript o ya esta parseado.
*/