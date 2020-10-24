USE BD1;
GO
DROP Procedure  IF EXISTS Cargar_Usuarios_Visualizacion;
DROP TABLE  IF EXISTS #Temp;
GO
CREATE TABLE #Temp(Usuario varchar(30), NumeroCuenta VARCHAR(20));
GO
CREATE PROCEDURE Cargar_Usuarios_Visualizacion
	@Datos xml = NULL,
	@doc INT =0
	as
		SELECT @Datos = od	FROM OPENROWSET (BULK 'C:\Users\aguer\Documents\GitHub\Base1\Datos_Tarea1.xml', SINGLE_BLOB) AS TiposDoc(od) --pone la direccion donde se encuentra
		EXEC sp_xml_preparedocument @doc OUTPUT, @Datos
		INSERT INTO #Temp(Usuario,NumeroCuenta) --selecciona la tabla a llenar y las columnas
		SELECT * FROM OPENXML (@doc, 'Datos/Usuarios_Ver/UsuarioPuedeVer' ,2)   --encabezado a buscar y cantidad de elementos a agregar 2
			WITH(Usuario[VARCHAR](30)'@User',NumeroCuenta [VARCHAR](30)'@NumeroCuenta');
		
		UPDATE #Temp SET 
		#Temp.Usuario =(SELECT Id_Usuario FROM Usuario where Usuario.Nombre_Usuario=#Temp.Usuario) ,
		NumeroCuenta = (SELECT Id_Cuenta FROM Cuenta where Cuenta.Num_Cuenta=#Temp.NumeroCuenta);

		INSERT INTO Usuario_Visualizacion(Id_Usuario,Id_Cuenta)
		SELECT Usuario,NumeroCuenta
		FROM #Temp ;
GO			
EXEC Cargar_Usuarios_Visualizacion

SELECT * FROM Usuario_Visualizacion;
