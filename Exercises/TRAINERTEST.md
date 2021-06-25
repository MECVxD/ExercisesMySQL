## Trainer Test

1. Rescata la cantidad de creditos hay en CREDITOS que tenga en común con SALDOSCREDITOS
   y cuando el ProgramaID de SALDOSCREDITOS sea diferente a CARTERACIEDIAPRO.

2. Rescata la Suma de los 'MontoCredito' que hay en CREDITOS que tenga diferente al SALDOSCREDITOS.
   Es decir solo los valores de los CREDITOS

3. Rescata el ClienteID y el MontoCredito de CREDITOS que tenga diferente al SALDOSCREDITOS.
   Es decir solo los valores de los CREDITOS.
   Ordenado de manera Descendente y solo el primer valor del Resultado

4. Recatar la cantidad de Clientes, el maximo ClienteID y el minimo ClienteID de Distintos ClienteID de CLIENTES
   Que tengan en conjunto de SUCURSALES(SucursalID) y CLIENTES(SucursalOrigen)
   Que tengan en común de PROSPECTOS(Sucursal) y CLIENTES(SucursalOrigen)
   Ordenado de manera Ascendente por el ClienteID de CLIENTES
   Ademas que cumpla las condiciones de:
   La Sucursal de PROSPECTOS debe ser igual a 1
   El PrimerNombre de CLIENTES debe tener la 'PA' en cualquier sitio
   El EsMenorEdad de CLIENTES debe ser diferente de 'N'

5. Rescatar el Valor Distinto de ApellidoPaterno de CLIENTES
   Que tenga en conjunto con PROSPECTOS(ProspectoID) y CLIENTES(ClienteID)
   Cuando el PrimerNombre de CLIENTES sea 'THOMAS'
   UNIENDO Lo mismo pero ahora con el PrimerNombre de PROSPECTO = 'THOMAS'
6. Hacer un UPDATE a la Tabla de CLIENTES Cuando el Titulo sea 'SR.'
   Solo a un Valor Ordenado de Manera Descendente por el CLienteID
   Modificando el PrimerNombre a su Nombre

7. Hacer un UPDATE a la Tabla de CLIENTES Cuando el Titulo sea 'SR.'
   Solo a los 3 valores Ordenado de Manera Ascendente por el CLienteID
   Modificando el PrimerNombre a su Nombre

8. Hacer un UPDATE a la Tabla de SOLICITUDCREDITO
   De los datos que tenga en Comun el ProspectoID de SOLICITUDCREDITO Y ProspectoID de PROSPECTOS
   Modificando el ValorCAT de SOLICITUDCREDITO A 1.0000

9. Hacer un UPDATE a la Tabla de SOLICITUDCREDITO
   De los datos que tenga en diferente el ProspectoID de SOLICITUDCREDITO Y ProspectoID de PROSPECTOS
   Modificando el ProgramaID de SOLICITUDCREDITO a 'Sin Prospectos'
   Es decir solo valores de SOLICITUDCREDITO

10. Hacer un UPDATE a la Tabla de PLDCLIENTES
    De los datos que tenga en comun el ClienteID de SOLICITUDCREDITO Y ClienteID de PLDCLIENTES
    De los datos que tenga en comun el ClienteID de CLIENTESCAPTACION Y ClienteID de PLDCLIENTES
    Modificando el ProgramaID de PLDCLIENTES a 'Sin Prospectos'
    Cuando el TipoPersona de CLIENTESCAPTACION sea 'M' y ProductoCreditoID de SOLICITUDCREDITO sea 7003
