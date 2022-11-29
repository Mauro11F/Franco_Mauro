const fs = require('fs');
const rawdata = fs.readFileSync('./departamentos.json', 'utf8');

var personaPuestos = JSON.parse(rawdata);

for (var i = 0; i < personaPuestos['departamentos'].length; i++) {

   // console.log(personaPuestos['departamentos'][i]['Tecnologia'].length);

   for (var j = 0; j < personaPuestos['departamentos'][i]['Tecnologia'].length; j++) {

      console.log(personaPuestos['departamentos'][i]['Tecnologia'][j].nombre + " " + personaPuestos['departamentos'][i]['Tecnologia'][j].puesto);

   }
  
}


