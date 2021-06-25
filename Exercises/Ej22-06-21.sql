/*  Alias: Los Alias usualmente se suelen usar cuando usamos JOINs
    GROUP BY: Se utiliza cuando usamos MAX, MIN, COUNT Y SUM
    DESC: Se utiliza para mostrar los resultados de forma descendente 
            y tambien para ver los campos de la tablatodo depende del 
            contexto en el que se use.
*/

/*1-    Recuperar:
            -NombreCompleto
            -FechaNacimiento
            -RFC
            -Todos los campos de DIRECCLIENTE
        De los clientes con ID del 16 al 20
*/

SELECT c.ClienteID, c.NombreCompleto, c.FechaNacimiento, c.RFC, d.*
FROM CLIENTES c
INNER JOIN DIRECCLIENTE d ON c.ClienteID=d.ClienteID   --INNER JOIN para devolver los datos en común con la tabla DIRECCLIENTE
WHERE c.ClienteID BETWEEN 16 AND 20;

SELECT c.ClienteID, c.NombreCompleto, c.FechaNacimiento, c.RFC, d.*  
FROM CLIENTES c  
INNER JOIN DIRECCLIENTE d ON c.ClienteID=d.ClienteID 
WHERE c.ClienteID>=16 AND c.ClienteID<=20;

SELECT c.ClienteID, c.NombreCompleto, c.FechaNacimiento, c.RFC, d.*  
FROM CLIENTES c  
INNER JOIN DIRECCLIENTE d ON c.ClienteID=d.ClienteID 
WHERE c.ClienteID IN (16,17,18,19,20);

/*2-    Recuperar todos los clientes que tengan una direccion 
    y cuya fecha de nacimiento sea mayor o igual al 01/01/1990*/

SELECT c.ClienteID, c.NombreCompleto, c.FechaNacimiento, c.RFC, d.*
FROM CLIENTES c  
INNER JOIN DIRECCLIENTE d ON c.ClienteID=d.ClienteID 
WHERE c.FechaNacimiento >= '1990-01-01';

/*3-    Recuperar los clientes que no tienen registro en la tabla de clientes*/

SELECT c.ClienteID, c.NombreCompleto, c.FechaNacimiento, c.RFC, d.*  
FROM CLIENTES c  
LEFT JOIN DIRECCLIENTE d ON c.ClienteID=d.ClienteID
WHERE d.DireccionID IS NULL;

/*4-    Seleccionar el mayor monto de credito de la tabla creditos*/

SELECT MAX(MontoCredito) 
FROM CREDITOS;

/*5-    Seleccionar el mayor monto de credito por cilente*/

SELECT ClienteID,MAX(MontoCredito)
FROM CREDITOS
GROUP BY ClienteID;

/*6-    Seleccionar el menor monto de credito de la tabla creditos*/

SELECT MIN(MontoCredito) 
FROM CREDITOS;

/*7-    Seleccionar el menor monto de credito por cilente*/

SELECT ClienteID,MIN(MontoCredito)
FROM CREDITOS
GROUP BY ClienteID;

/*8-    Selecciona el monto minimo de credito de todos los clientes cuyo nombre completo contenga los caracteres DIANA*/

SELECT c.ClienteID, c.NombreCompleto, MIN(cr.MontoCredito)
FROM CLIENTES c  
INNER JOIN CREDITOS AS cr ON c.ClienteID=cr.ClienteID 
WHERE c.NombreCompleto LIKE '%DIANA%'
GROUP BY c.ClienteID;

/*9-    Sumar todos los montos de los creditos*/

SELECT SUM(CRE.MontoCredito) 
FROM CREDITOS AS CRE;

/*10-   Contar cuantos campos existen en la tabla creditos*/

SELECT COUNT(CRE.CreditoID) 
FROM CREDITOS AS CRE;

/*11-   ClienteID, MontoMinimo cuando el monto de credito menor que sea menor a 2000*/

SELECT ClienteID, MIN(MontoCredito)
FROM CREDITOS
GROUP BY ClienteID
HAVING MIN(MontoCredito) < 2000;

/*12-   Listar todos los clientes ordenados por nombre completo de manera ascendente*/

SELECT NombreCompleto 
FROM CLIENTES
ORDER BY NombreCompleto ASC;

    -- Solo los 10 primeros
SELECT NombreCompleto 
FROM CLIENTES
ORDER BY NombreCompleto ASC LIMIT 10;

    -- Solo 10 posiciones a partir de la posicion 11
SELECT NombreCompleto 
FROM CLIENTES
ORDER BY NombreCompleto DESC LIMIT 10,10;-- Limit inicia desde el 0