USE BD1;
GO
DROP Procedure  IF EXISTS Cargar_Tipo_Moneda;

GO
CREATE PROCEDURE Cargar_Tipo_Moneda
	@tipo_Documento xml = NULL,
	@doc INT =0
		as
	SELECT @tipo_Documento = od	FROM OPENROWSET (BULK 'C:\Users\aguer\Documents\GitHub\Base1\Datos_Tarea1.xml', SINGLE_BLOB) AS TiposDoc(od) --pone la direccion donde se encuentra
	EXEC sp_xml_preparedocument @doc OUTPUT, @tipo_Documento
	INSERT INTO dbo.Tipo_Moneda(Id_Tipo_Moneda, Nombre,Simbolo) --selecciona la tabla a llenar y las columnas
	SELECT * FROM OPENXML (@doc, 'Datos/Tipo_Moneda/TipoMoneda' ,3)   --encabezado a buscar y cantidad de elementos a agregar 2
	WITH(Id_Tipo_Moneda [INT]'@Id',Nombre [VARCHAR](100)'@Nombre',Simbolo[VARCHAR](1)'@Simbolo');
GO
EXEC Cargar_Tipo_Moneda
select * from dbo.Tipo_Moneda