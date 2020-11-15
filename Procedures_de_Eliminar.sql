USE BD1;
Go

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---											Stores Procedure Eliminar

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE Procedure Eliminar_Usuario 
	@inId_Usuario INT,
 
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

				--Eliminario AL USUARIO
				Update Usuario
					set [activo] = 0
					where Id_Usuario = @inId_Usuario

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] =  @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 3,
								@inId_Objeto_Accion = @inId_Usuario,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62503,'Error: No se ha podido eliminar el usuario, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Eliminar_TipoDocumento 
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

				--Eliminar AL Tipo_Documento
				Update Tipo_Documento
					set [activo] = 0
					where Id_TipoDocumento = @inId_TipoDocumento
						

--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 6,
								@inId_Objeto_Accion = @inId_TipoDocumento,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62506,'Error: No se ha podido eliminar el Tipo Documento, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Eliminar_Tipo_Moneda 
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

				--Eliminar AL Tipo_Moneda
				Update Tipo_Moneda
					set [activo] = 0
					where Id_Tipo_Moneda = @inId_Tipo_Moneda

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 9,
								@inId_Objeto_Accion = @inId_Tipo_Moneda,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El

			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62509,'Error: No se ha podido eliminar el Tipo Moneda, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Eliminar_Parentezco 
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

				--Eliminar AL Parentezco
				Update Parentezco
					set [activo] = 0
					where Id_Parentezco = @inId_Parentezco
						

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 12,
								@inId_Objeto_Accion = @inId_Parentezco,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El

			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62512,'Error: No se ha podido eliminar el Parentezco, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Eliminar_Tipo_Cuenta_Ahorros 
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

				--Eliminar AL Tipo_Cuenta_Ahorros
				Update Tipo_Cuenta_Ahorros
					set [activo] = 0
					where Id_Tipo_Cuenta_Ahorros = @inId_Tipo_Cuenta_Ahorros
					

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 15,
								@inId_Objeto_Accion = @inId_Tipo_Cuenta_Ahorros,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62515,'Error: No se ha podido eliminar el Tipo de Cuenta Ahorros, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Eliminar_Persona 
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

				--Eliminar AL Persona
				Update Persona
					set [activo] = 0
					where Id_Persona = @inId_Persona
						

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 18,
								@inId_Objeto_Accion = @inId_Persona,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62518,'Error: No se ha podido eliminar la Persona, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Eliminar_Cuenta
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

				--Eliminar AL Cuenta
				Update Cuenta
					set [activo] = 0
					where Id_Cuenta = @inId_Cuenta
						

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 21,
								@inId_Objeto_Accion = @inId_Cuenta ,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62521,'Error: No se ha podido eliminar la Cuenta, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Eliminar_Beneficiario
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

				--Eliminar AL Beneficiario
				Update Beneficiario
					set [activo] = 0
					where Id_Beneficiario = @inId_Beneficiario
												

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 24,
								@inId_Objeto_Accion = @inId_Beneficiario,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62524,'Error: No se ha podido eliminar el beneficiario, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Eliminar_Estado_Cuenta
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

				--Eliminar AL Estado_Cuenta
				Update Estado_Cuenta
					set [activo] = 0
					where Id_Estado_Cuenta = @inId_Estado_Cuenta
							

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 27,
								@inId_Objeto_Accion = @inId_Estado_Cuenta,  
								@inQuien_Inserto = @idUsuarioMoidifica , 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62527,'Error: No se ha podido eliminar el Estado Cuenta, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Eliminar_Usuario_Visualizacion
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

				--Eliminar AL Usuario_Visualizacion
				Update Usuario_Visualizacion
					set [activo] = 0
					where Id_Usuario_Visualizacion = @inId_Usuario_Visualizacion 
							

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 30,
								@inId_Objeto_Accion = @inId_Usuario_Visualizacion,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62530,'Error: No se ha podido eliminar la relacion de Usuario Visualizacion, por favor revise los datos',1;
		END CATCH
	END
GO