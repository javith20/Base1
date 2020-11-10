USE BD1
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---															   Stores Procedure Beneficiario

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE Procedure Crear_Beneficiario

    @inNombre_Persona varchar(100),
	@inNum_Cuenta varchar(30),
    @inParentezco varchar(30),
    @inPorcentaje  real
AS  
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON 
			DECLARE @Id_Persona INT,
					@Id_Cuenta INT,
					@Id_Parentezco INT,
					@Porcentaje REAL,

			SET @Id_Persona = (SELECT [Id_Persona] FROM [dbo].[Persona] WHERE [Nombre] = @inNombre_Persona AND [activo]=1)
			SET @Id_Cuenta = (SELECT [Id_Cuenta] FROM [dbo].[Cuenta] WHERE [Num_Cuenta] = @inNum_Cuenta AND [activo]=1)
			SET @Id_Parentezco = (SELECT [Id_Parentezco] FROM [dbo].[Parentezco] WHERE [numFinca] = @inNumFincaOriginal AND [activo]=1)
			SET @Porcentaje = inPorcentaje

			BEGIN TRAN
				--ACTUALIZA LA RELACION
				INSERT INTO Beneficiario(Id_Persona,Id_Cuenta,Id_Parentezco,Porcentaje)
					values(@Id_Persona, @Id_Cuenta, @Id_Parentezco, @Porcentaje );
			COMMIT
		END TRY
		BEGIN CATCH;
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 82736,'Error: No se ha podido crear beneficiario',1;
		END CATCH
	END
GO													   



CREATE Procedure Eliminar_Beneficiario

    @inNombre_Persona varchar(100),
	@inNum_Cuenta varchar(30),
    @inParentezco varchar(30),
    @inPorcentaje  real
AS  
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON 
			DECLARE @Id_Persona INT,
					@Id_Cuenta INT,
					@Id_Parentezco INT,
					@Porcentaje REAL,

			SET @Id_Persona = (SELECT [Id_Persona] FROM [dbo].[Persona] WHERE [Nombre] = @inNombre_Persona AND [activo]=1)
			SET @Id_Cuenta = (SELECT [Id_Cuenta] FROM [dbo].[Cuenta] WHERE [Num_Cuenta] = @inNum_Cuenta AND [activo]=1)
			SET @Id_Parentezco = (SELECT [Id_Parentezco] FROM [dbo].[Parentezco] WHERE [numFinca] = @inNumFincaOriginal AND [activo]=1)
			SET @Porcentaje = inPorcentaje

			BEGIN TRAN
				--Eliminar Beneficiario
				Update Beneficiario
					SET activo = 0
					where (Id_Persona=@Id_Persona and Id_Cuenta=@Id_Cuenta and Id_Parentezco=@Id_Parentezco and Porcentaje=@Porcentaje)
			COMMIT
		END TRY
		BEGIN CATCH;
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 82737,'Error: No se ha podido eliminar beneficiario',1;
		END CATCH
	END
GO

CREATE Procedure Actualizar_Beneficiario_Porcentaje

    @inNombre_Persona varchar(100),
	@inNum_Cuenta varchar(30),
    @inParentezco varchar(30),
    @inPorcentaje  real
AS  
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON 
			DECLARE @Id_Persona INT,
					@Id_Cuenta INT,
					@Id_Parentezco INT,
					@Porcentaje REAL,

			SET @Id_Persona = (SELECT [Id_Persona] FROM [dbo].[Persona] WHERE [Nombre] = @inNombre_Persona AND [activo]=1)
			SET @Id_Cuenta = (SELECT [Id_Cuenta] FROM [dbo].[Cuenta] WHERE [Num_Cuenta] = @inNum_Cuenta AND [activo]=1)
			SET @Id_Parentezco = (SELECT [Id_Parentezco] FROM [dbo].[Parentezco] WHERE [numFinca] = @inNumFincaOriginal AND [activo]=1)
			SET @Porcentaje = inPorcentaje

			BEGIN TRAN
				--Eliminar Beneficiario
				Update Beneficiario
					SET Porcentaje = @inPorcentaje
					where (Id_Persona=@Id_Persona and Id_Cuenta=@Id_Cuenta and Id_Parentezco=@Id_Parentezco)
			COMMIT
		END TRY
		BEGIN CATCH;
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 82738,'Error: No se ha podido modificar el porcentaje del beneficiario',1;
		END CATCH
	END
GO

CREATE Procedure Leer_Todos_Beneficiario

AS  
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON 
			BEGIN TRAN
				--Leer todos los Beneficiario
				--SELECT P.Nombre, C.Num_Cuenta, Pa.Nombre, B.Porcentaje FROM Persona P, Cuenta C, Parentezco Pa, Beneficiario B.
				SELECT Id_Persona, Id_Cuenta, Id_Parentezco, Porcentaje FROM Beneficiario
			COMMIT
		END TRY
		BEGIN CATCH;
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 82739,'Error: No se ha podido leer los beneficiarios',1;
		END CATCH
	END
GO

CREATE Procedure Leer_Beneficiario_Cuenta

	@inNum_Cuenta varchar(30),
AS  
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON 
			DECLARE @Id_Cuenta INT

			SET @Id_Cuenta = (SELECT [Id_Cuenta] FROM [dbo].[Cuenta] WHERE [Num_Cuenta] = @inNum_Cuenta AND [activo]=1)

			BEGIN TRAN
				--Leer Beneficiario
				SELECT * FROM Beneficiario
					where (Id_Cuenta=@Id_Cuenta)
			COMMIT
		END TRY
		BEGIN CATCH;
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 82738,'Error: No se ha podido modificar el porcentaje del beneficiario',1;
		END CATCH
	END
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---															   Stores Procedure Beneficiario

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
