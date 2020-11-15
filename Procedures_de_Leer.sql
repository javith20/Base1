USE BD1;
Go
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---															   Stores Procedure Leer

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE Procedure Leer_Usuario 
	@inId_Usuario INT,

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

				--Declaracion de variables
				Declare 
					@idUsuarioMoidifica int,
					@insertado_El date

				--Leer AL USUARIO
				Select Id_Persona, Nombre_Usuario, Clave, Es_Admin 
					from  Usuario 
					when Id_Usuario = @inId_Usuario AND [activo] = 1
				
				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] =  @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 31,
								@inId_Objeto_Accion = @inId_Usuario,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62531,'Error: No se ha podido leer el usuario, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Leer_TipoDocumento 
	@inId_TipoDocumento INT,

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

				Declare
					@idUsuarioMoidifica int,
					@insertado_El date

				--Leer AL Tipo_Documento
				Select Nombre 
					from Tipo_Documento
					when Id_TipoDocumento = @inId_TipoDocumento AND [activo] = 1
						

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 32,
								@inId_Objeto_Accion = @inId_TipoDocumento,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62532,'Error: No se ha podido leer el Tipo Documento, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Leer_Tipo_Moneda 
	@inId_Tipo_Moneda INT,

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

			Declare
					@idUsuarioMoidifica int,
					@insertado_El date

				--Leer AL Tipo_Moneda
				Select Nombre,Simbolo 
					from Tipo_Moneda
					where Id_Tipo_Moneda = @inId_Tipo_Moneda and [activo] = 1

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 33,
								@inId_Objeto_Accion = @inId_Tipo_Moneda,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El

			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62533,'Error: No se ha podido leer el Tipo Moneda, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Leer_Parentezco 
	@inId_Parentezco INT,

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

			Declare
					@idUsuarioMoidifica int,
					@insertado_El date

				--Leer AL Parentezco
				Select Nombre 
					from Parentezco
					when Id_Parentezco = @inId_Parentezco and [activo] = 1
						

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 34,
								@inId_Objeto_Accion = @inId_Parentezco,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El

			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62534,'Error: No se ha podido leer el Parentezco, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Leer_Tipo_Cuenta_Ahorros 
	@inId_Tipo_Cuenta_Ahorros INT,  -- No me acuerdo si era catalogo

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

			Declare
					@idUsuarioMoidifica int,
					@insertado_El date

				--Leer AL Tipo_Cuenta_Ahorros
				Select Nombre, Id_Tipo_Moneda, Saldo_Minimo, Multa_Saldo_Minimo, Cargo_Anual, Num_Retiros_Humano, Num_Retiros_Automatico,	Comision_Humano, Comision_Automatico, Interes
					from Tipo_Cuenta_Ahorros
					where Id_Tipo_Cuenta_Ahorros = @inId_Tipo_Cuenta_Ahorros and [activo] = 1
					

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 35,
								@inId_Objeto_Accion = @inId_Tipo_Cuenta_Ahorros,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62535,'Error: No se ha podido leer el Tipo de Cuenta Ahorros, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Leer_Persona 
	@inId_Persona INT,

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

			Declare
					@idUsuarioMoidifica int,
					@insertado_El date

				--Leer AL Persona
				Select Nombre, Id_TipoDocumento, Documento_Identidad, Fecha_Nacimiento, Email, Telefono1, Telefono2 
					from Persona
					when Id_Persona = @inId_Persona and [activo] = 1
						

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 36,
								@inId_Objeto_Accion = @inId_Persona,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62536,'Error: No se ha podido leer la Persona, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Leer_Cuenta
	@inId_Cuenta INT,

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

			Declare
					@idUsuarioMoidifica int,
					@insertado_El date

				--Leer AL Cuenta
				Select Id_Persona, Id_Tipo_Cuenta_Ahorros, Num_Cuenta, Fecha_Creacion, Saldo 
					from Cuenta
					when Id_Cuenta = @inId_Cuenta and [activo] = 1
						

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 37,
								@inId_Objeto_Accion = @inId_Cuenta ,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62537,'Error: No se ha podido leer la Cuenta, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Leer_Beneficiario
	@inId_Beneficiario INT,

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

			Declare
					@idUsuarioMoidifica int,
					@insertado_El date

				--Leer AL Beneficiario
				Select Id_Persona, Id_Cuenta, Id_Parentezco, Porcentaje
					from Beneficiario
					where Id_Beneficiario = @inId_Beneficiario and [activo] = 1
												

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 38,
								@inId_Objeto_Accion = @inId_Beneficiario,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62538,'Error: No se ha podido leer el beneficiario, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Leer_Estado_Cuenta
	@inId_Estado_Cuenta INT,

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

			Declare
					@idUsuarioMoidifica int,
					@insertado_El date

				--Leer AL Estado_Cuenta
				Select Id_Cuenta, Fecha_Inicio, Fecha_Fin, Saldo_Inicial, Saldo_Final
					from Estado_Cuenta
					where Id_Estado_Cuenta = @inId_Estado_Cuenta and [activo] = 1
							

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 39,
								@inId_Objeto_Accion = @inId_Estado_Cuenta,  
								@inQuien_Inserto = @idUsuarioMoidifica , 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62539,'Error: No se ha podido leer el Estado Cuenta, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Leer_Usuario_Visualizacion
	@inId_Usuario_Visualizacion INT,

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

			Declare
					@idUsuarioMoidifica int,
					@insertado_El date

				--Leer AL Usuario_Visualizacion
				Select Id_UsuarioL,Id_Cuenta 
					from Usuario_Visualizacion
					when Id_Usuario_Visualizacion = @inId_Usuario_Visualizacion and [activo] = 1
							

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 40,
								@inId_Objeto_Accion = @inId_Usuario_Visualizacion,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62540,'Error: No se ha podido leer la relacion de Usuario Visualizacion, por favor revise los datos',1;
		END CATCH
	END
GO