USE BD1;
GO
DROP Procedure  IF EXISTS Cargar_Usuarios;
DROP TABLE  IF EXISTS #Temp;
GO
CREATE TABLE #Temp(Usuario varchar(30), Pass varchar(20) ,ValorDocumentoIdentidad varchar(10), EsAdministrador bit);
GO
CREATE PROCEDURE Cargar_Usuarios
	@Datos xml = NULL,
	@doc INT =0
	as
		SELECT @Datos = od	FROM OPENROWSET (BULK 'C:\Users\aguer\Documents\GitHub\Base1\Datos_Tarea1.xml', SINGLE_BLOB) AS TiposDoc(od) --pone la direccion donde se encuentra
		EXEC sp_xml_preparedocument @doc OUTPUT, @Datos
		INSERT INTO #Temp(Usuario,Pass,ValorDocumentoIdentidad,EsAdministrador) --selecciona la tabla a llenar y las columnas
		SELECT * FROM OPENXML (@doc, 'Datos/Usuarios/Usuario' ,2)   --encabezado a buscar y cantidad de elementos a agregar 2
			WITH(
				Usuario[VARCHAR](30)'@User',
				Pass [VARCHAR](30)'@Pass',
				ValorDocumentoIdentidad [VARCHAR](30)'@ValorDocumentoIdentidad',
				EsAdministrador [BIT]'@EsAdministrador'
				);
		UPDATE #Temp SET #Temp.ValorDocumentoIdentidad = (SELECT Id_Persona FROM Persona where Persona.Documento_Identidad=#Temp.ValorDocumentoIdentidad) ;
		INSERT INTO Usuario (Id_Persona,Nombre_Usuario,Clave,Es_Admin)
		SELECT ValorDocumentoIdentidad,Usuario,Pass,EsAdministrador
		FROM #Temp ;
GO			
EXEC Cargar_Usuarios

SELECT * FROM Usuario;
