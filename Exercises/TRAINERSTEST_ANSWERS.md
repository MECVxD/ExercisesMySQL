Comun - INNER
Diferente - LEFT con IS NULL
Conjunto - LEFT

Para los 3 primeros es CreditoID.

1. Rescata la cantidad de creditos hay en CREDITOS que tenga en común con SALDOSCREDITOS y cuando el ProgramaID de SALDOSCREDITOS sea diferente a CARTERACIEDIAPRO.

    ```
    SELECT COUNT(C.CreditoID) FROM CREDITOS C
    INNER JOIN SALDOSCREDITOS CFM ON C.CreditoID = CFM.CreditoID
    WHERE CFM.ProgramaID != 'CARTERACIEDIAPRO';
    ```
    `R=5210`

2. Rescata la Suma de los 'MontoCredito' que hay en CREDITOS que tenga diferente al SALDOSCREDITOS. 
  - Es decir solo los valores de los CREDITOS
    
    ```
    SELECT SUM(C.MontoCredito) FROM CREDITOS C
    LEFT JOIN SALDOSCREDITOS CFM ON C.CreditoID = CFM.CreditoID
    WHERE CFM.CreditoID IS NULL;
    ```
    `R=26299130.08`

3.  Rescata el ClienteID y el MontoCredito de CREDITOS que tenga diferente al SALDOSCREDITOS. 
- Es decir solo los valores de los CREDITOS. 
- Ordenado de manera Descendente y solo el primer valor del Resultado

    ```
    SELECT C.ClienteID, C.MontoCredito FROM CREDITOS C
    LEFT JOIN SALDOSCREDITOS CFM ON C.CreditoID = CFM.CreditoID
    WHERE CFM.CreditoID IS NULL
    ORDER BY C.CreditoID DESC LIMIT 1;
    ```
    `R=3562 && 500000`

4.  Recatar la cantidad de Clientes, el maximo ClienteID y el minimo ClienteID de Distintos ClienteID de CLIENTES: 
- Que tengan en conjunto de SUCURSALES(SucursalID) y CLIENTES(SucursalOrigen)
- Que tengan en común de PROSPECTOS(Sucursal) y CLIENTES(SucursalOrigen)
- Ordenado de manera Ascendente por el ClienteID de CLIENTES
    - Ademas que cumpla las condiciones de:
- La Sucursal de PROSPECTOS debe ser igual a 1
- El PrimerNombre de CLIENTES debe tener la 'PA' en cualquier sitio
- El EsMenorEdad de CLIENTES debe ser diferente de 'N'

    ```
    SELECT count(ClienteID),  MAX(ClienteID), MIN(ClienteID) FROM (
    SELECT distinct C.ClienteID FROM CLIENTES C
    LEFT JOIN SUCURSALES S ON C.SucursalOrigen = S.SucursalID
    INNER JOIN PROSPECTOS P ON C.SucursalOrigen = P.Sucursal
    WHERE P.Sucursal = 1 AND C.PrimerNombre REGEXP 'PA' AND C.EsMenorEdad != 'N' ORDER BY C.ClienteID ASC) AS T;
    ```
    `R=2 && 6613 && 5653`

5.  Rescatar el Valor Distinto de ApellidoPaterno de CLIENTES: 
- Que tenga en conjunto con PROSPECTOS(ProspectoID) y CLIENTES(ClienteID)
- Cuando el PrimerNombre de CLIENTES sea 'THOMAS'
- UNIENDO Lo mismo pero ahora con el PrimerNombre de PROSPECTO = 'THOMAS'
   
    ```
    SELECT distinct(ApellidoPaterno) FROM (
    SELECT C.ApellidoPaterno FROM CLIENTES C
    LEFT JOIN PROSPECTOS P ON C.ClienteID = P.ProspectoID
    WHERE C.PrimerNombre = 'TOMAS'
    UNION
    SELECT C.ApellidoPaterno FROM CLIENTES C
    LEFT JOIN PROSPECTOS P ON C.ClienteID = P.ProspectoID
    WHERE P.PrimerNombre = 'TOMAS') AS T;
    ```
    `R= JUAREZ, AVILA, GONZALES, HERNANDEZ, MORENO, MENDOZA, MENDIZABAL, POOL, MARTINEZ`
6.  Hacer un UPDATE a la Tabla de CLIENTES Cuando el Titulo sea 'SR.'
- Solo a un Valor Ordenado de Manera Descendente por el CLienteID
- Modificando el PrimerNombre a su Nombre
    ```
    UPDATE CLIENTES SET PrimerNombre = 'Edwin'
    WHERE Titulo = 'SR.' ORDER BY ClienteID DESC LIMIT 1;
    ```
7.  Hacer un UPDATE a la Tabla de CLIENTES Cuando el Titulo sea 'SR.'
- Solo a los 3 valores Ordenado de Manera Ascendente por el CLienteID
- Modificando el PrimerNombre a su Nombre
    ```
    UPDATE CLIENTES SET PrimerNombre = 'Edwin'
    WHERE Titulo = 'SR.' ORDER BY ClienteID ASC LIMIT 3;
    ```
8. Hacer un UPDATE a la Tabla de SOLICITUDCREDITO
- De los datos que tenga en Comun el ProspectoID de SOLICITUDCREDITO Y ProspectoID de PROSPECTOS
- Modificando el ValorCAT de SOLICITUDCREDITO A 1.0000
    
    ```
    UPDATE SOLICITUDCREDITO SC
    INNER JOIN PROSPECTOS P ON SC.ProspectoID = P.ProspectoID
    SET SC.ValorCAT = 1.000;
    ```
9. Hacer un UPDATE a la Tabla de SOLICITUDCREDITO
- De los datos que tenga en diferente el ProspectoID de SOLICITUDCREDITO Y ProspectoID de PROSPECTOS
- Modificando el ProgramaID de SOLICITUDCREDITO a 'Sin Prospectos'
- Es decir solo valores de SOLICITUDCREDITO
    ```
    UPDATE SOLICITUDCREDITO SC
    LEFT JOIN PROSPECTOS P ON SC.ProspectoID = P.ProspectoID
    SET SC.ProgramaID = 'Sin Prospectos'
    WHERE P.ProspectoID IS NULL;
    ```
10. Hacer un UPDATE a la Tabla de PLDCLIENTES
- De los datos que tenga en comun el ClienteID de SOLICITUDCREDITO Y ClienteID de PLDCLIENTES
- De los datos que tenga en comun el ClienteID de CLIENTESCAPTACION Y ClienteID de PLDCLIENTES
- Modificando el ProgramaID de PLDCLIENTES a 'Sin Prospectos'
- Cuando el TipoPersona de CLIENTESCAPTACION sea 'M' y ProductoCreditoID de SOLICITUDCREDITO sea 7003

    ```
    UPDATE PLDCLIENTES PLD
    INNER JOIN SOLICITUDCREDITO SC ON PLD.ClienteID = SC.ClienteID
    INNER JOIN CLIENTESCAPTACION CC ON PLD.ClienteID = CC.ClienteID
    SET PLD.ProgramaID = 'Sin Prospectos'
    WHERE CC.TipoPersona = 'M' AND SC.ProductoCreditoID = 7003;
    ```
