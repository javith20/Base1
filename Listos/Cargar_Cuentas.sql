USE BD1;
GO
DROP Procedure  IF EXISTS Cargar_Cuentas;
DROP TABLE  IF EXISTS #Temp;
GO
CREATE TABLE #Temp(ValorDocumentoIdentidadDelCliente VARCHAR(20),TipoCuentaId INT,NumeroCuenta VARCHAR (20),FechaCreacion Date,	Saldo Money);
GO
CREATE PROCEDURE Cargar_Cuentas
	@Datos xml = NULL,
	@doc INT =0
	as

				SELECT @Datos = od	FROM OPENROWSET (BULK 'C:\Users\aguer\Documents\GitHub\Base1\Datos_Tarea1.xml', SINGLE_BLOB) AS TiposDoc(od) --pone la direccion donde se encuentra
				EXEC sp_xml_preparedocument @doc OUTPUT, @Datos
				INSERT INTO #Temp(ValorDocumentoIdentidadDelCliente,TipoCuentaId,NumeroCuenta,FechaCreacion,Saldo) --selecciona la tabla a llenar y las columnas
				SELECT * FROM OPENXML (@doc, 'Datos/Cuentas/Cuenta' ,2)   --encabezado a buscar y cantidad de elementos a agregar 2
				WITH(
					ValorDocumentoIdentidadDelCliente [VARCHAR](100)'@ValorDocumentoIdentidadDelCliente',
					TipoCuentaId [INT]'@TipoCuentaId',
					NumeroCuenta [VARCHAR](20)'@NumeroCuenta',
					FechaCreacion [DATE]'@FechaCreacion',
					Saldo [MONEY]'@Saldo'
					);
				UPDATE #Temp SET #Temp.ValorDocumentoIdentidadDelCliente = (SELECT Id_Persona FROM Persona where Persona.Documento_Identidad=#Temp.ValorDocumentoIdentidadDelCliente) ;
				INSERT INTO Cuenta (Id_Persona,Id_Tipo_Cuenta_Ahorros,Num_Cuenta,Fecha_Creacion,Saldo)
				SELECT ValorDocumentoIdentidadDelCliente,TipoCuentaId,NumeroCuenta,FechaCreacion,Saldo
				FROM #Temp ;
	
GO			
EXEC Cargar_Cuentas
SELECT * FROM Cuenta


