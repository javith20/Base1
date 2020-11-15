---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---															   Stores Procedure Actualizar

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE Procedure Actualizar_Usuario 
	@inId_Usuario INT,
	@inNombre VARCHAR(120),
	@inPassword VARCHAR(120),
	@inEs_Admin VARCHAR(30), 
	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

				--Declaracion de variables
				Declare @Id_Persona Int,

				set @Id_Persona = (SELECT [Id_Persona] FROM [Persona] WHERE [Nombre] = @inNombre_Persona AND [Activo] = 1)

				--Actualizar AL USUARIO
				Update Usuario
					set [Id_Persona] = @Id_Persona
					set [Nombre_Usuario] = @inNombre
					set [Clave] = @inPassword
					set [Es_Admin]) = @inEs_Admin
					where Id_Usuario = @inId_Usuario AND
						[activo] = 1

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inNombre AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 2,
								@inId_Objeto_Accion = @idUsuarioMoidifica,  
								@inQuien_Inserto = @inUsuarioACargo, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62502,'Error: No se ha podido actualizar el usuario, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Actualizar_TipoDocumento 
	@inId_TipoDocumento INT,
	@inId_TipoDocumento INT,
	@inNombre VARCHAR(100),

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

				--Actualizar AL Tipo_Documento
				Update Tipo_Documento
					set [Nombre] = @inNombre
					where Id_TipoDocumento = @inId_TipoDocumento AND
						[activo] = 1

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inNombre AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 5,
								@inId_Objeto_Accion = @idUsuarioMoidifica,  
								@inQuien_Inserto = @inUsuarioACargo, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62505,'Error: No se ha podido actualizar el Tipo Documento, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Actualizar_Tipo_Moneda 
	@inId_Tipo_Moneda INT,
	@inId_Tipo_Moneda INT,
	@inNombre VARCHAR(100),
	@inSimbolo Varchar(5),

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

				--Actualizar AL Tipo_Moneda
				Update Tipo_Moneda
					set Nombre =  @inNombre
					set Simbolo = @inSimbolo
					where Id_Tipo_Moneda = @inId_Tipo_Moneda AND
						[activo] = 1

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inNombre AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 8,
								@inId_Objeto_Accion = @idUsuarioMoidifica,  
								@inQuien_Inserto = @inUsuarioACargo, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62508,'Error: No se ha podido actualizar el Tipo Moneda, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Actualizar_Parentezco 
	@inId_Parentezco INT,
	@inNombre VARCHAR(100),

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

				--Actualizar AL Parentezco
				Update Parentezco
					set Nombre = @inNombre
					where Id_Parentezco = @inId_Parentezco AND
						[activo] = 1

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inNombre AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 11,
								@inId_Objeto_Accion = @idUsuarioMoidifica,  
								@inQuien_Inserto = @inUsuarioACargo, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62511,'Error: No se ha podido actualizar el Parentezco, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Actualizar_Tipo_Cuenta_Ahorros 
	@inId_Tipo_Cuenta_Ahorros INT,  -- No me acuerdo si era catalogo
	@inNombre VARCHAR(100),
	@ininMoneda INT, 
	@inSaldo_Minimo MONEY,
	@inMulta_Saldo_Minimo MONEY,
	@inCargo_Anual MONEY,
	@inNum_Retiros_Humano INT, 
	@inNum_Retiros_Automatico INT, 
	@inComision_Humano MONEY, 
	@inComision_Automatico  MONEY,
	@inInteres REAL,

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

				Declare @Id_Tipo_Moneda 
				set @Id_Tipo_Moneda = (SELECT [Id_Tipo_Moneda] FROM [Tipo_Moneda] WHERE [Nombre] = @inMoneda AND [Activo] = 1)

				--Actualizar AL Tipo_Cuenta_Ahorros
				Update Tipo_Cuenta_Ahorros
					set Nombre = @inNombre 
					set Id_Tipo_Moneda = @Id_Tipo_Moneda
					set Saldo_Minimo = @inSaldo_Minimo
					set Multa_Saldo_Minimo = @inMulta_Saldo_Minimo
					set Cargo_Anual = @inCargo_Anual
					set Num_Retiros_Humano = @inNum_Retiros_Humano
					set Num_Retiros_Automatico = @inNum_Retiros_Automatico
					set Comision_Humano = @inComision_Humano
					set Comision_Automatico = @inComision_Automatico
					set Interes = @inInteres
					where Id_Tipo_Cuenta_Ahorros = @inId_Tipo_Cuenta_Ahorros AND
						[activo] = 1

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inNombre AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 14,
								@inId_Objeto_Accion = @idUsuarioMoidifica,  
								@inQuien_Inserto = @inUsuarioACargo, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62514,'Error: No se ha podido actualizar el Tipo de Cuenta Ahorros, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Actualizar_Persona 
	@inId_Persona INT,
	@inNombre VARCHAR(100),
	@inTipoDocumento VARCHAR(100),
	@inDocumento_Identidad VARCHAR(20),
	@inFecha_Nacimiento DATE,
	@inEmail VARCHAR(100),
	@inTelefono1 VARCHAR(15), 
	@inTelefono2 VARCHAR(15),

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

				Declare @Id_TipoDocumento INT,
				set @Id_TipoDocumento = (SELECT [Id_TipoDocumento] FROM [Tipo_Documento] WHERE [Nombre] = @inTipoDocumento AND [Activo] = 1)


				--Actualizar AL Persona
				Update Persona
					set Nombre = @inNombre
					set Id_TipoDocumento = @Id_TipoDocumento
					set Documento_Identidad = @inDocumento_Identidad
					set Fecha_Nacimiento = @inFecha_Nacimiento
					set Email = @inEmail
					set Telefono1 = @inTelefono1
					set Telefono2 = @inTelefono2
					where Id_Persona = @inId_Persona AND
						[activo] = 1

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inNombre AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 17,
								@inId_Objeto_Accion = @idUsuarioMoidifica,  
								@inQuien_Inserto = @inUsuarioACargo, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62517,'Error: No se ha podido actualizar la Persona, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Actualizar_Cuenta
	@inId_Cuenta INT,
	@inNombre_Persona VARCHAR(100),
	@inNombre_Tipo_Cuenta_Ahorros VARCHAR(100),
	@inNum_Cuenta VARCHAR(15),
	@inFecha_Creacion DATE,
	@inSaldo MONEY,

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

				--Declaracion de variables
				Declare @Id_Persona Int,
						@Id_Tipo_Cuenta_Ahorros int

				set @Id_Persona = (SELECT [Id_Persona] FROM [Persona] WHERE [Nombre] = @inNombre_Persona AND [Activo] = 1)
					@Id_Tipo_Cuenta_Ahorros = (SELECT [Id_Tipo_Cuenta_Ahorros] FROM [Tipo_Cuenta_Ahorros] WHERE [Nombre] = @inNombre_Tipo_Cuenta_Ahorros AND [Activo] = 1)

				--Actualizar AL Cuenta
				Update Cuenta
					set Id_Persona = @Id_Persona
					set Id_Tipo_Cuenta_Ahorros = @Id_Tipo_Cuenta_Ahorros
					set Num_Cuenta = @inNum_Cuenta
					set Fecha_Creacion = @inFecha_Creacion
					set Saldo = @inSaldo
					where Id_Cuenta = @inId_Cuenta AND
						[activo] = 1

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inNombre AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 20,
								@inId_Objeto_Accion = @idUsuarioMoidifica,  
								@inQuien_Inserto = @inUsuarioACargo, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62520,'Error: No se ha podido actualizar la Cuenta, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Actualizar_Beneficiario
	@inId_Beneficiario INT,
	@inNombre_Persona VARCHAR(100),
	@inNum_Cuenta VARCHAR(15),
	@inNombre_Parentezco INT,
	@inPorcentaje REAL,

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

				--Declaracion de variables
				Declare @Id_Persona Int,
						@Id_Cuenta int,
						Id_Parentezco int

				set @Id_Persona = (SELECT [Id_Persona] FROM [Persona] WHERE [Nombre] = @inNombre_Persona AND [Activo] = 1)
				set	@Id_Cuenta = (SELECT [Id_Cuenta] FROM [Cuenta] WHERE [Nombre] = @inNum_Cuenta AND [Activo] = 1)
				set	@Id_Parentezco = (SELECT [Id_Parentezco] FROM [Parentezco] WHERE [Nombre] = @inNombre_Parentezco AND [Activo] = 1)


				--Actualizar AL Beneficiario
				Update Beneficiario
					set Id_Persona = @Id_Persona
					set Id_Cuenta = @Id_Cuenta
					set Id_Parentezco = @Id_Parentezco
					set Porcentaje = @inPorcentaje
					where Id_Beneficiario = @inId_Beneficiario AND
							[activo] = 1					

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inNombre AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 23,
								@inId_Objeto_Accion = @idUsuarioMoidifica,  
								@inQuien_Inserto = @inUsuarioACargo, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62523,'Error: No se ha podido actualizar el beneficiario, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Actualizar_Estado_Cuenta
	@inId_Estado_Cuenta INT,
	@inNum_Cuenta VARCHAR(15),
	@inFecha_Inicio DATE,
	@inFecha_Fin DATE,
	@inSaldo_Inicial MONEY,
	@inSaldo_Final MONEY,

	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

				--Declaracion de variables
				Declare	@Id_Cuenta int,
						
				set	@Id_Cuenta = (SELECT [Id_Cuenta] FROM [Cuenta] WHERE [Nombre] = @inNum_Cuenta AND [Activo] = 1)

				--Actualizar AL Estado_Cuenta
				Update Estado_Cuenta
					set Id_Cuenta = @Id_Cuenta
						Fecha_Inicio = @inFecha_Inicio
						Fecha_Fin = @inFecha_Fin
						Saldo_Inicial = @inSaldo_Inicial
						Saldo_Final = @inSaldo_Final
					where Id_Estado_Cuenta = @inId_Estado_Cuenta AND
							[activo] = 1

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inNombre AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 26,
								@inId_Objeto_Accion = @idUsuarioMoidifica,  
								@inQuien_Inserto = @inUsuarioACargo, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62526,'Error: No se ha podido actualizar el Estado Cuenta, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Actualizar_Usuario_Visualizacion
	@inId_Usuario_Visualizacion INT,
	@inNombre_Usuario VARCHAR(120),
	@inNum_Cuenta VARCHAR(15),


	@inUsuarioACargo varchar(20), 
	@inIPusuario varchar(20)
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			BEGIN TRAN

				--Declaracion de variables
				Declare	@Id_Cuenta int,
						@Id_Usuario int,
						
				set	@Id_Cuenta = (SELECT [Id_Cuenta] FROM [Cuenta] WHERE [Nombre] = @inNum_Cuenta AND [Activo] = 1)
				set	@Id_Usuario = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inNombre_Usuario AND [Activo] = 1)


				--Actualizar AL Usuario_Visualizacion
				Update Usuario_Visualizacion(
					set Id_Usuario = Id_Usuario
						Id_Cuenta = @Id_Cuenta
					where Id_Usuario_Visualizacion = @inId_Usuario_Visualizacion AND
							[activo] = 1

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inNombre AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 29,
								@inId_Objeto_Accion = @idUsuarioMoidifica,  
								@inQuien_Inserto = @inUsuarioACargo, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62529,'Error: No se ha podido actualizar la relacion de Usuario Visualizacion, por favor revise los datos',1;
		END CATCH
	END
GO