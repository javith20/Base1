USE BD1;
GO
DROP Procedure  IF EXISTS Cargar_Personas;
GO
CREATE PROCEDURE Cargar_Personas
	@Datos xml = NULL,
	@doc INT =0
		as
	SELECT @Datos = od	FROM OPENROWSET (BULK 'C:\Users\aguer\Documents\GitHub\Base1\Datos_Tarea1.xml', SINGLE_BLOB) AS TiposDoc(od) --pone la direccion donde se encuentra
	EXEC sp_xml_preparedocument @doc OUTPUT, @Datos
	INSERT INTO dbo.Persona(Nombre,Id_TipoDocumento,Documento_Identidad,Fecha_Nacimiento,Email,Telefono1,Telefono2) --selecciona la tabla a llenar y las columnas
	SELECT * FROM OPENXML (@doc, 'Datos/Personas/Persona' ,7)   --encabezado a buscar y cantidad de elementos a agregar 2
	WITH(Nombre [VARCHAR](100)'@Nombre',
		Id_TipoDocumento [INT]'@TipoDocuIdentidad',
		Documento_Identidad [VARCHAR](20)'@ValorDocumentoIdentidad',
		Fecha_Nacimiento [DATE]'@FechaNacimiento',
		Email [VARCHAR](100)'@Email',
		Telefono1 [VARCHAR](15)'@Telefono1',
		Telefono2 [VARCHAR](15)'@Telefono2');
GO
EXEC Cargar_Personas
select * from dbo.Persona