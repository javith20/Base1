USE BD1;
GO
DROP Procedure  IF EXISTS Cargar_Parentezco;
GO
CREATE PROCEDURE Cargar_Parentezco
	@Datos xml = NULL,
	@doc INT =0
		as
	SELECT @Datos = od	FROM OPENROWSET (BULK 'C:\Users\aguer\Documents\GitHub\Base1\Datos_Tarea1.xml', SINGLE_BLOB) AS TiposDoc(od) --pone la direccion donde se encuentra
	EXEC sp_xml_preparedocument @doc OUTPUT, @Datos
	INSERT INTO dbo.Parentezco(Id_Parentezco, Nombre) --selecciona la tabla a llenar y las columnas
	SELECT * FROM OPENXML (@doc, 'Datos/Parentezcos/Parentezco' ,2)   --encabezado a buscar y cantidad de elementos a agregar 2
	WITH(Id_Parentezco [INT]'@Id',Nombre [VARCHAR](100)'@Nombre');
GO
EXEC Cargar_Parentezco
select * from dbo.Parentezco