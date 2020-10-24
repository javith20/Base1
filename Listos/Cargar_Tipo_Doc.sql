USE BD1;
GO
DROP Procedure  IF EXISTS Cargar_Tipo_Doc;
GO
CREATE PROCEDURE Cargar_Tipo_Doc
	@tipo_Documento xml = NULL,
	@doc INT =0
		as
	SELECT @tipo_Documento = od	FROM OPENROWSET (BULK 'C:\Users\aguer\Documents\GitHub\Base1\Datos_Tarea1.xml', SINGLE_BLOB) AS TiposDoc(od) --pone la direccion donde se encuentra
	EXEC sp_xml_preparedocument @doc OUTPUT, @tipo_Documento
	INSERT INTO dbo.Tipo_Documento(Id_TipoDocumento, Nombre) --selecciona la tabla a llenar y las columnas
	SELECT * FROM OPENXML (@doc, 'Datos/Tipo_Doc/TipoDocuIdentidad' ,2)   --encabezado a buscar y cantidad de elementos a agregar 2
	WITH(Id_Tipo_Documento [INT]'@Id',Descripcion [VARCHAR](100)'@Nombre');
GO
EXEC Cargar_Tipo_Doc
select * from dbo.Tipo_Documento