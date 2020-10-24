USE BD1;
GO
DROP Procedure  IF EXISTS Cargar_Beneficiario;
DROP TABLE  IF EXISTS #Temp;
GO
CREATE TABLE #Temp(NumeroCuenta VARCHAR(20),ValorDocumentoIdentidadBeneficiario VARCHAR(20),ParentezcoId INT,Porcentaje INT);
GO
CREATE PROCEDURE Cargar_Beneficiario
	@Datos xml = NULL,
	@doc INT =0
	as
		SELECT @Datos = od	FROM OPENROWSET (BULK 'C:\Users\aguer\Documents\GitHub\Base1\Datos_Tarea1.xml', SINGLE_BLOB) AS TiposDoc(od) --pone la direccion donde se encuentra
		EXEC sp_xml_preparedocument @doc OUTPUT, @Datos
		INSERT INTO #Temp(NumeroCuenta,ValorDocumentoIdentidadBeneficiario,ParentezcoId,Porcentaje) --selecciona la tabla a llenar y las columnas
		SELECT * FROM OPENXML (@doc, 'Datos/Beneficiarios/Beneficiario' ,2)   --encabezado a buscar y cantidad de elementos a agregar 2
			WITH(
				NumeroCuenta[VARCHAR](100)'@NumeroCuenta',
				ValorDocumentoIdentidadBeneficiario [VARCHAR](100)'@ValorDocumentoIdentidadBeneficiario',
				ParentezcoId[INT]'@ParentezcoId',Porcentaje[INT]'@Porcentaje'
				);
		UPDATE #Temp SET 
		ValorDocumentoIdentidadBeneficiario = (SELECT Id_Persona FROM Persona where Persona.Documento_Identidad=#Temp.ValorDocumentoIdentidadBeneficiario),
		NumeroCuenta = (SELECT Id_Cuenta FROM Cuenta where Cuenta.Num_Cuenta=#Temp.NumeroCuenta);
		INSERT INTO Beneficiario (Id_Cuenta,Id_Persona,Id_Parentezco,Porcentaje)
		SELECT NumeroCuenta,ValorDocumentoIdentidadBeneficiario,ParentezcoId,Porcentaje
		FROM #Temp ;
	
GO			
EXEC Cargar_Beneficiario

SELECT * FROM Beneficiario;
