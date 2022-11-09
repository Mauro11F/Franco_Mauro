-- 1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar
-- ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
SELECT * FROM pedidos ORDER BY fecha ASC;
-- 2. Devuelve todos los datos de los dos pedidos de mayor valor.
SELECT * FROM pedidos ORDER BY cantidad DESC LIMIT 2;
-- 3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido.
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
SELECT DISTINCT pedidos.id_cliente, clientes.nombre FROM pedidos
INNER JOIN clientes
ON clientes.id = pedidos.id_cliente;
-- 4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2022, cuya
-- cantidad total sea superior a $500.
SELECT * FROM pedidos WHERE fecha LIKE 2022;


-- 5. Devuelve un listado con el nombre y apellido de los vendedores que tienen una comisión entre 0.05 y 0.11.
SELECT concat_ws(' ', nombre, apellido) AS fullName FROM vendedores WHERE comisión BETWEEN 0.05 AND 0.11;
-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla vendedores.
SELECT comisión FROM vendedores ORDER BY comisión DESC LIMIT 1;
-- 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo cuitcuil no es
-- NULL. El listado deberá estar ordenado alfabéticamente por apellido y nombre.
SELECT id, nombre, apellido, cuitcuil FROM clientes
WHERE cuitcuil IS NOT NULL
ORDER BY nombre, apellido;
-- 8. Devuelve un listado de los nombres de los clientes que empiezan por “A” y terminan por “n” y
-- también los nombres que empiezan por “P”. El listado deberá estar ordenado alfabéticamente.
SELECT * FROM clientes 
WHERE nombre LIKE 'A%n' OR nombre LIKE 'P%'
ORDER BY nombre ASC;
-- 9. Devuelve un listado de los nombres de los clientes que no empiezan por “A”. El listado deberá
-- estar ordenado alfabéticamente.
SELECT nombre FROM clientes
WHERE nombre NOT LIKE 'A%'
ORDER BY nombre ASC;
-- 10. Devuelve un listado con los nombres de los vendedores que terminan por “el” o “o”. Tenga en
-- cuenta que se deberán eliminar los nombres repetidos.
SELECT nombre FROM vendedores
WHERE nombre LIKE '%el' OR nombre LIKE '%o';
-- 11. Devuelve un listado con el identificador, nombre y apellido de todos los clientes que han
-- realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
SELECT DISTINCT clientes.id, clientes.nombre, clientes.apellido FROM clientes
INNER JOIN pedidos
ON clientes.id = pedidos.id_cliente
ORDER BY nombre ASC;
-- 12. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado
-- debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
SELECT clientes.*, pedidos.* FROM clientes
INNER JOIN pedidos
ON clientes.id = pedidos.id_cliente
ORDER BY clientes.nombre ASC;
-- 13. Devuelve un listado que muestre todos los pedidos en los que ha participado un vendedor. El
-- resultado debe mostrar todos los datos de los pedidos y de los vendedores. El listado debe
-- mostrar los datos de los vendedores ordenados alfabéticamente.
SELECT vendedores.*, pedidos.* FROM vendedores
INNER JOIN pedidos
ON vendedores.id = pedidos.id_cliente
ORDER BY vendedores.nombre ASC;
-- 14. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y
-- con los datos de los vendedores asociados a cada pedido.
SELECT concat_ws(' ', clientes.nombre, clientes.apellido) AS "Cliente" , pedidos.id AS "id_Pedido", pedidos.cantidad, vendedores.* FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.id_cliente
INNER JOIN vendedores ON vendedores.id = pedidos.id_vendedor;
-- 15. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2022, cuyo monto esté entre $300 y $1000.
SELECT concat_ws(' ',clientes.nombre, clientes.apellido) AS "Cliente", pedidos.fecha, pedidos.cantidad AS "Monto" 
FROM pedidos INNER JOIN clientes
ON pedidos.id_cliente = clientes.id
WHERE year(fecha) = '2022' AND pedidos.cantidad BETWEEN 300 AND 1000;
-- 16. Devuelve el nombre y apellido de todos los vendedores que han participado en algún pedido
-- realizado por María Santana.
SELECT DISTINCT concat_ws(' ', vendedores.nombre, vendedores.apellido) AS "Vendedor", concat_ws(' ', clientes.nombre, clientes.apellido) AS "Cliente"
FROM vendedores INNER JOIN pedidos
ON vendedores.id = pedidos.id_vendedor
INNER JOIN clientes ON clientes.id = pedidos.id_cliente
WHERE clientes.nombre = 'María' AND clientes.apellido = 'Santana';
-- 17. Devuelve el nombre de todos los clientes que han realizado algún pedido con el vendedor Daniel Sáez.
SELECT DISTINCT concat_ws(' ', clientes.nombre, clientes.apellido) AS "Cliente", concat_ws(' ', vendedores.nombre, vendedores.apellido) AS "Vendedor" FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.id_cliente
INNER JOIN vendedores ON vendedores.id = pedidos.id_vendedor
WHERE vendedores.nombre = 'Daniel' AND vendedores.apellido = 'Sáez';
-- 18. Devuelve un listado con todos los clientes junto con los datos de los pedidos que han
-- realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido.
-- El listado debe estar ordenado alfabéticamente por el apellido y nombre de los clientes.
SELECT concat_ws(' ', clientes.apellido, clientes.nombre) AS "Clientes", pedidos.* FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.id_cliente
ORDER BY clientes.apellido ASC, clientes.nombre ASC;
-- 19. Devuelve un listado con todos los vendedores junto con los datos de los pedidos que han
-- realizado. Este listado también debe incluir los vendedores que no han realizado ningún
-- pedido. El listado debe estar ordenado alfabéticamente por el apellido y nombre de los vendedores.
SELECT concat_ws(' ', vendedores.apellido, vendedores.nombre) AS "Vendedores", pedidos.* FROM vendedores
LEFT JOIN pedidos ON vendedores.id = pedidos.id_vendedor
ORDER BY vendedores.apellido ASC, vendedores.nombre ASC;
-- 20. Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
SELECT concat_ws(' ', clientes.nombre, clientes.apellido) AS "Clientes", pedidos.* FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.id_cliente
WHERE pedidos.id_cliente IS NULL;
-- 21. Devuelve un listado que solamente muestre los vendedores que no han realizado ningún pedido.
SELECT concat_ws(' ', vendedores.nombre, vendedores.apellido) AS "Vendedor", pedidos.* FROM vendedores
LEFT JOIN pedidos ON vendedores.id = pedidos.id_vendedor
WHERE pedidos.id_vendedor IS NULL;
-- 22. Devuelve un listado con los clientes que no han realizado ningún pedido y de los vendedores
-- que no han participado en ningún pedido. Ordene el listado alfabéticamente por el apellido y
-- el nombre. En el listado deberá diferenciar de algún modo los clientes y los vendedores.
SELECT concat_ws(' ', clientes.nombre, clientes.apellido) AS "Clientes", pedidos.* FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.id_cliente
WHERE pedidos.id_cliente IS NULL
UNION
SELECT pedidos.*, concat_ws(' ', vendedores.nombre, vendedores.apellido) AS "Vendedores" FROM vendedores
LEFT JOIN pedidos ON vendedores.id = pedidos.id_vendedor
WHERE pedidos.id_vendedor IS NULL;
-- 23. Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT SUM(cantidad) FROM pedidos;
-- 24. Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT AVG(cantidad) FROM pedidos;
-- 25. Calcula el número total de vendedores distintos que aparecen en la tabla pedido.
SELECT count(DISTINCT id_vendedor) AS "Numeros_de_vendedores" FROM pedidos;
-- 26. Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT count(*) AS "Cantida_de_clientes" FROM clientes;
-- 27. Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
SELECT cantidad AS "Mayor_cantidad" FROM pedidos
ORDER BY cantidad DESC
LIMIT 1;
-- 28. Calcula cuál es la menor cantidad que aparece en la tabla pedido.
SELECT cantidad AS "Menor_cantidad" FROM pedidos
ORDER BY cantidad ASC
LIMIT 1;
-- 29. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
SELECT ciudad, max(categoría) FROM clientes
GROUP BY ciudad;
-- 30. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno
-- de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes
-- cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada
-- uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del
-- cliente, nombre, apellido, la fecha y el valor de la cantidad.
SELECT clientes.id, clientes.nombre, clientes.apellido, pedidos.fecha, max(pedidos.cantidad) FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.id_cliente
GROUP BY fecha
ORDER BY clientes.id;
-- 31. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno
-- de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de $2000 .
SELECT clientes.id, concat_ws(' ', clientes.nombre, clientes.apellido) AS "FullName", pedidos.fecha, max(pedidos.cantidad) FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.id_cliente
WHERE pedidos.cantidad >= 2000
GROUP BY fecha
ORDER BY clientes.id;
-- 32. Calcula el máximo valor de los pedidos realizados para cada uno de los vendedores durante la
-- fecha 2021-08-17. Muestra el identificador del vendedor, nombre, apellido y total.
SELECT vendedores.id, concat_ws(' ', vendedores.nombre, vendedores.apellido) AS "FullName", max(pedidos.cantidad), pedidos.fecha FROM vendedores
INNER JOIN pedidos ON vendedores.id = pedidos.id_vendedor
WHERE pedidos.fecha LIKE '2021-08-17'
GROUP BY vendedores.id;
-- 33. Devuelve un listado con el identificador de cliente, nombre y apellido y el número total de
-- pedidos que ha realizado cada uno de los clientes. Tenga en cuenta que pueden existir
-- clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el
-- listado indicando que el número de pedidos realizados es 0.
SELECT clientes.id, concat_ws(' ', clientes.nombre, clientes.apellido) AS "FullName", count(pedidos.cantidad) AS "CantidadTotalPedidos" FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.id_cliente
GROUP BY clientes.id
ORDER BY clientes.id;
-- 34. Devuelve un listado con el identificador de cliente, nombre, apellido y el número total de
-- pedidos que ha realizado cada uno de clientes durante el año 2020.
SELECT clientes.id, concat_ws(' ', clientes.nombre, clientes.apellido) AS "FullName", count(pedidos.cantidad) AS "CantidadTotalPedidos", pedidos.fecha
FROM clientes LEFT JOIN pedidos ON clientes.id = pedidos.id_cliente
WHERE year(pedidos.fecha) LIKE '2020'
GROUP BY clientes.id;
-- 35. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
SELECT id, MAX(cantidad), fecha FROM pedidos
GROUP BY year(fecha)
ORDER BY fecha;
-- 36. Devuelve el número total de pedidos que se han realizado cada año.
SELECT fecha, count(fecha) AS "PedidosAño" FROM pedidos
GROUP BY year(fecha)
ORDER BY fecha;
-- 37. Devuelve un listado con todos los pedidos que ha realizado Adela Salas. (Sin utilizar INNER JOIN).
SELECT concat_ws(' ', clientes.nombre, clientes.apellido) AS "FullName", pedidos.* FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.id_cliente
WHERE clientes.nombre = 'Adela' AND clientes.apellido = 'Salas';
-- 38. Devuelve el número de pedidos en los que ha participado el vendedor Daniel Sáez. (Sin utilizar INNER JOIN)
SELECT concat_ws(' ', vendedores.nombre, vendedores.apellido) AS "FullName", count(pedidos.id_vendedor) AS "CantPedidos" FROM vendedores
LEFT JOIN pedidos ON vendedores.id = pedidos.id_vendedor
WHERE vendedores.nombre = 'Daniel' AND vendedores.apellido = 'Sáez';
-- 39. Devuelve los datos del cliente que realizó el pedido más caro en el año 2020. (Sin utilizar INNER JOIN)
SELECT concat_ws(' ', clientes.nombre, clientes.apellido) AS "FullName", pedidos.cantidad FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.id_cliente
WHERE year(pedidos.fecha) = '2020'
ORDER BY pedidos.cantidad DESC
LIMIT 1;
-- 40. Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz y María Santana.
select concat_ws(' ', clientes.nombre, clientes.apellido) AS "FullName", pedidos.fecha, MIN(pedidos.cantidad) AS "PedidoMIN" from pedidos
LEFT JOIN clientes ON pedidos.id_cliente = clientes.id
WHERE (clientes.nombre = 'Pepe' AND clientes.apellido = 'Ruiz') OR (clientes.nombre = 'María' AND clientes.apellido = 'Santana')
GROUP BY clientes.nombre;
-- 41. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT id, concat_ws(' ', nombre, apellido) AS "FullName" FROM clientes
WHERE id NOT IN (SELECT id_cliente FROM pedidos);
-- 42. Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT id, concat_ws(' ', nombre, apellido) AS "FullName" FROM vendedores
WHERE id NOT IN (SELECT id_vendedor FROM pedidos);
-- 43. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT concat_ws(' ', nombre, apellido) AS "FullName" FROM clientes
WHERE NOT EXISTS (SELECT cantidad FROM pedidos
WHERE clientes.id = pedidos.id_cliente);
-- 44. Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT concat_ws(' ', nombre, apellido) AS "FullName" FROM vendedores
WHERE NOT EXISTS (SELECT cantidad FROM pedidos
WHERE vendedores.id = pedidos.id_vendedor);