USE BD1;
GO
DROP Procedure  IF EXISTS Cargar_Tipo_Cuenta_Ahorros;
GO
CREATE PROCEDURE Cargar_Tipo_Cuenta_Ahorros
	@Datos xml = NULL,
	@doc INT =0
		as
	SELECT @Datos = od	FROM OPENROWSET (BULK 'C:\Users\aguer\Documents\GitHub\Base1\Datos_Tarea1.xml', SINGLE_BLOB) AS TiposDoc(od) --pone la direccion donde se encuentra
	EXEC sp_xml_preparedocument @doc OUTPUT, @Datos
	INSERT INTO dbo.Tipo_Cuenta_Ahorros(Id_Tipo_Cuenta_Ahorros, Nombre,Id_Tipo_Moneda,Saldo_Minimo,Multa_Saldo_Minimo,Cargo_Anual,Num_Retiros_Humano,Num_Retiros_Automatico,Comision_Humano,Comision_Automatico,Interes) --selecciona la tabla a llenar y las columnas
	SELECT * FROM OPENXML (@doc, 'Datos/Tipo_Cuenta_Ahorros/TipoCuentaAhorro' ,11)   --encabezado a buscar y cantidad de elementos a agregar 2
	WITH(Id_Tipo_Cuenta_Ahorros [INT]'@Id',	Nombre [VARCHAR](100)'@Nombre',	Id_Tipo_Moneda[INT]'@IdTipoMoneda',	Saldo_Minimo[MONEY]'@SaldoMinimo',	Multa_Saldo_Minimo[MONEY]'@MultaSaldoMin',	Cargo_Anual[MONEY]'@CargoAnual',
		Num_Retiros_Humano[INT]'@NumRetirosHumano',	Num_Retiros_Automatico[INT]'@NumRetirosAutomatico',	Comision_Humano[MONEY]'@ComisionHumano', Comision_Automatico[MONEY]'@ComisionAutomatico',
		Interes[int]'@Interes');
GO
EXEC Cargar_Tipo_Cuenta_Ahorros
select * from dbo.Tipo_Cuenta_Ahorros