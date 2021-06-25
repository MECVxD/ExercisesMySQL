1. SELECT COUNT(CRE.CreditoID)
   FROM CREDITOS AS CRE
   INNER JOIN SALDOSCREDITOS AS SAL
   ON CRE.CreditoID =SAL.CreditoID
   WHERE SAL.ProgramaID != 'CARTERACIEDIAPRO';

   R = 5210

2. SELECT SUM(CRE.MontoCredito)
   FROM CREDITOS AS CRE
   LEFT JOIN SALDOSCREDITOS AS SAL
   ON CRE.CreditoID=SAL.CreditoID;

   R = SUM(CRE.MontoCredito)|
   ---------------------+
   116108195385.02|

3. SELECT CRE.CreditoID, CRE.MontoCredito
   FROM CREDITOS AS CRE
   LEFT JOIN SALDOSCREDITOS AS SAL
   ON CRE.CreditoID=SAL.CreditoID
   ORDER BY CRE.MontoCredito DESC LIMIT 1;

   R = CreditoID|MontoCredito|
   ---------+------------+
   100014866| 5000000.00|

4. SELECT DISTINCT COUNT(CLI.ClienteID), MAX(CLI.ClienteID), MIN(CLI.ClienteID)
   FROM CLIENTES AS CLI
   LEFT JOIN SUCURSALES AS SUC
   ON SUC.SucursalID =CLI.SucursalOrigen }
   INNER JOIN PROSPECTOS AS PRO
   ON PRO.Sucursal =CLI.SucursalOrigen
   ORDER BY ClienteID ASC LIMIT 3;

5. SELECT DISTINCT CLI.ApellidoPaterno
   FROM CLIENTES AS CLI
   INNER JOIN PROSPECTOS AS PRO
   ON CLI.ClienteID =PRO.ClienteID
   WHERE CLI.PrimerNombre ='THOMAS';
6. UPDATE CLIENTES
   SET PrimerNombre = 'MAURICIO'
   WHERE Titulo = 'SR.'
   ORDER BY ClienteID DESC LIMIT 1;

7. UPDATE
   CLIENTES
   SET PrimerNombre = 'MAURICIO'
   WHERE Titulo = 'SR.'
   ORDER BY ClienteID ASC LIMIT 3;

8. UPDATE SOLICITUDCREDITO AS SCD
   INNER JOIN PROSPECTOS AS PRP
   ON SCD.ProspectoID = PRP.ProspectoID
   SET SCD.ValorCAT = 1.0000
   WHERE SCD.ProspectoID = PRP.ProspectoID;

9. Hacer un UPDATE a la Tabla de SOLICITUDCREDITO
   De los datos que tenga en diferente el ProspectoID de SOLICITUDCREDITO Y ProspectoID de PROSPECTOS
   Modificando el ProgramaID de SOLICITUDCREDITO a 'Sin Prospectos'
   Es decir solo valores de SOLICITUDCREDITO

10. Hacer un UPDATE a la Tabla de PLDCLIENTES
    De los datos que tenga en comun el ClienteID de SOLICITUDCREDITO Y ClienteID de PLDCLIENTES
    De los datos que tenga en comun el ClienteID de CLIENTESCAPTACION Y ClienteID de PLDCLIENTES
    Modificando el ProgramaID de PLDCLIENTES a 'Sin Prospectos'
    Cuando el TipoPersona de CLIENTESCAPTACION sea 'M' y ProductoCreditoID de SOLICITUDCREDITO sea 7003
