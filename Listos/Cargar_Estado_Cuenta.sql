USE BD1;
GO
DROP Procedure  IF EXISTS Cargar_Estado_Cuenta;
DROP TABLE  IF EXISTS #Temp;
GO
CREATE TABLE #Temp(NumeroCuenta [varchar](20), fechaInicio DATE, fechaFin DATE , saldoInicial MONEY, saldoFinal MONEY);
GO
CREATE PROCEDURE Cargar_Estado_Cuenta
	@Datos xml = NULL,
	@doc INT =0
	as
		SELECT @Datos = od	FROM OPENROWSET (BULK 'C:\Users\aguer\Documents\GitHub\Base1\Datos_Tarea1.xml', SINGLE_BLOB) AS TiposDoc(od) --pone la direccion donde se encuentra
		EXEC sp_xml_preparedocument @doc OUTPUT, @Datos
		INSERT INTO #Temp(NumeroCuenta,fechaInicio,fechaFin,saldoInicial,saldoFinal) --selecciona la tabla a llenar y las columnas
		SELECT * FROM OPENXML (@doc, 'Datos/Estados_de_Cuenta/Estado_de_Cuenta' ,2)   --encabezado a buscar y cantidad de elementos a agregar 2
			WITH(
				NumeroCuenta[VARCHAR](100)'@NumeroCuenta',
				fechaInicio [DATE]'@fechaInicio',
				fechaFin [DATE]'@fechaFin',
				saldoInicial [MONEY]'@saldoInicial',
				saldoFinal[MONEY]'@saldoFinal'
				);
		UPDATE #Temp SET NumeroCuenta = (SELECT Id_Cuenta FROM Cuenta where Cuenta.Num_Cuenta=#Temp.NumeroCuenta);
		INSERT INTO Estado_Cuenta (Id_Cuenta,Fecha_Inicio,Fecha_Fin,Saldo_Inicial,Saldo_Final)
		SELECT NumeroCuenta,fechaInicio,fechaFin,saldoInicial,saldoFinal
		FROM #Temp ;
GO			
EXEC Cargar_Estado_Cuenta

SELECT * FROM Estado_Cuenta;
