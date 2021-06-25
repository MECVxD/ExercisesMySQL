/*1- Agrupar al el maximo numero de creditoID por clienteID solo los ultimos 10*/

SELECT ClienteID, MAX(CreditoID), MAX(Estatus) 
FROM CREDITOS 
GROUP BY ClienteID
ORDER BY ClienteID DESC LIMIT 10;

/*2- El cliente que tiene mas creditos: 
        ClienteID
        NombreCompleto
        Total de los creditos*/

SELECT CRE.ClienteID, CLI.NombreCompleto, COUNT(CRE.CreditoID) AS TOTALCREDITOS 
FROM CREDITOS AS CRE 
INNER JOIN CLIENTES AS CLI
ON CRE.ClienteID = CLI.ClienteID 
GROUP BY CLI.ClienteID 
HAVING MAX(TOTALCREDITOS) ORDER BY TOTALCREDITOS DESC LIMIT 2;

/*3- El id de todos los creditos de ese cliente*/

SELECT CRE.ClienteID,CRE.CreditoID, CLI.NombreCompleto 
FROM CREDITOS AS CRE 
INNER JOIN CLIENTES AS CLI
ON CRE.ClienteID = CLI.ClienteID
WHERE CRE.ClienteID=293;

/*4- Recuperar todos los creditos con Estatus vigente*/

SELECT * 
FROM CREDITOS 
WHERE Estatus ='v';

/*5- Escoger un credito y su cliente*/
creditoID=10000003137
ClienteID=8625


/*6- Recuperar el RFC, nombre completo y fecha de nacimiento del cliente*/

SELECT CRE.CreditoID, CLI.RFC,  CLI.NombreCompleto, CLI.FechaNacimiento
FROM CREDITOS AS CRE
INNER JOIN CLIENTES AS CLI
ON CRE.ClienteID=CLI.ClienteID 
WHERE CRE.CreditoID=10000003137;

/*7- Recuperar los datos de un cliente*/

SELECT CRE.CreditoID, CLI.RFC,  CLI.NombreCompleto, CLI.FechaNacimiento, DATEDIFF(CLI.FechaActual, CLI.FechaNacimiento) AS FECHA 
FROM CREDITOS AS CRE
INNER JOIN CLIENTES AS CLI
ON CRE.ClienteID=CLI.ClienteID 
WHERE CRE.CreditoID=10000003137;