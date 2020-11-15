
USE BD1
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Enlaces
--https://docs.microsoft.com/en-us/sql/t-sql/statements/set-quoted-identifier-transact-sql?view=sql-server-ver15
--https://docs.microsoft.com/en-us/sql/t-sql/statements/set-quoted-identifier-transact-sql?view=sql-server-ver15
--https://docs.microsoft.com/en-us/sql/t-sql/statements/set-nocount-transact-sql?view=sql-server-ver15
--https://docs.microsoft.com/en-us/sql/t-sql/statements/set-xact-abort-transact-sql?view=sql-server-ver15#:~:text=When%20SET%20XACT_ABORT%20is%20ON,and%20the%20transaction%20continues%20processing.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---															   Stores Procedure Bitacora Acciones

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE Procedure Insertar_BitacoraAcciones
	@inNombre_Persona VARCHAR(100),
	@inId_Tipo_Accion int,
	@inId_Objeto_Accion int,
	@inQuien_Inserto varchar(20), --InsertBy
	@inInsertado_Por varchar(20),  --InsertIn  (xml o web)
	@inInserto_El DATE			 --InsertAt
AS   
	BEGIN 
		BEGIN TRY
		SET NOCOUNT ON -- No devuelve el recuento (el evio del mensaje por cada procedimiento almacenado)
		SET XACT_ABORT ON --Transact genera un error en tiempo de ejecución, entonces esta termina y se revierte.
			DECLARE @Id_Usuario int

			SET @Id_Usuario = (SELECT Id_Usuario FROM Usuario WHERE Nombre_Usuario = @inQuien_Inserto)

			INSERT INTO Bitacora_Accion(Id_Tipo_Accion, Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
			SELECT @inId_Tipo_Accion, @inId_Objeto_Accion, @Id_Usuario,@inInsertado_Por,@inInserto_El
		END TRY
		BEGIN CATCH
			THROW 60500,'Error: No se ha podido guardar la accion en la bitacora',1;
		END CATCH
	END
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---															   Stores Procedure Crear

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE Procedure Crear_Usuario 
	@inNombre_Persona VARCHAR(120),
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
					@Id_Usuario int,
					@insertado_El date,
					@idUsuarioMoidifica int

				set @Id_Persona = (SELECT [Id_Persona] FROM [Persona] WHERE [Nombre] = @inNombre_Persona AND [Activo] = 1)

				--INSERTA AL USUARIO
				INSERT INTO Usuario([Id_Persona],[Nombre_Usuario], [Clave], [Es_Admin])
				values (@Id_Persona, @inNombre, @inPassword, @inEs_Admin)

				set @Id_Usuario = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inNombre AND [Activo] = 1)

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 1,
								@inId_Objeto_Accion = @Id_Usuario,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62501,'Error: No se ha podido crear el usuario, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Crear_TipoDocumento 
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

				Declare				
						@idUsuarioMoidifica INT,
						@insertado_El DATE

				--INSERTA AL Tipo_Documento
				INSERT INTO Tipo_Documento([Id_TipoDocumento], [Nombre])
				values (@inId_TipoDocumento, @inNombre)

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 4,
								@inId_Objeto_Accion = @inId_TipoDocumento,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62504,'Error: No se ha podido crear el Tipo Documento, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Crear_Tipo_Moneda 
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

				Declare 
						@idUsuarioMoidifica INT,
						@insertado_El DATE

				--INSERTA AL Tipo_Moneda
				INSERT INTO Tipo_Moneda(Id_Tipo_Moneda, Nombre,Simbolo)
				values (@inId_Tipo_Moneda, @inNombre,@inSimbolo)

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 7,
								@inId_Objeto_Accion = @inId_Tipo_Moneda,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62507,'Error: No se ha podido crear el Tipo Moneda, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Crear_Parentezco 
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
					
				Declare					
						@idUsuarioMoidifica INT,
						@insertado_El DATE

				--INSERTA AL Parentezco
				INSERT INTO Parentezco(Id_Parentezco, Nombre)
				values (@inId_Parentezco, @inNombre)

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 10,
								@inId_Objeto_Accion = @inId_Parentezco,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62510,'Error: No se ha podido crear el Parentezco, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Crear_Tipo_Cuenta_Ahorros 
	@inId_Tipo_Cuenta_Ahorros INT,  -- No me acuerdo si era catalogo
	@inNombre VARCHAR(100),
	@inMoneda INT, 
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

				Declare @Id_Tipo_Moneda int,
						@idUsuarioMoidifica INT,
						@insertado_El DATE

				set @Id_Tipo_Moneda = (SELECT [Id_Tipo_Moneda] FROM [Tipo_Moneda] WHERE [Nombre] = @inMoneda AND [Activo] = 1)

				--INSERTA AL Tipo_Cuenta_Ahorros
				INSERT INTO Tipo_Cuenta_Ahorros(Id_Tipo_Cuenta_Ahorros, Nombre, Id_Tipo_Moneda, Saldo_Minimo, Multa_Saldo_Minimo, Cargo_Anual, Num_Retiros_Humano, Num_Retiros_Automatico, Comision_Humano, Comision_Automatico,Interes)
				values (@inId_Tipo_Cuenta_Ahorros, @inNombre, @inMoneda, @inSaldo_Minimo, @inMulta_Saldo_Minimo, @inCargo_Anual, @inNum_Retiros_Humano, @inNum_Retiros_Automatico, @inComision_Humano, @inComision_Automatico, @inInteres)

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 13,
								@inId_Objeto_Accion = @inId_Tipo_Cuenta_Ahorros,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62513,'Error: No se ha podido crear el Tipo de Cuenta Ahorros, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Crear_Persona 
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
						@Id_Persona int,
						@idUsuarioMoidifica INT,
						@insertado_El DATE

				set @Id_TipoDocumento = (SELECT [Id_TipoDocumento] FROM [Tipo_Documento] WHERE [Nombre] = @inTipoDocumento AND [Activo] = 1)


				--INSERTA AL Persona
				INSERT INTO Persona(Nombre, Id_TipoDocumento, Documento_Identidad, Fecha_Nacimiento, Email, Telefono1, Telefono2)
				values ( @inNombre, @Id_TipoDocumento, @inDocumento_Identidad, @inFecha_Nacimiento, @inEmail, @inTelefono1,  @inTelefono2)

				set @Id_Persona = (SELECT @Id_Persona FROM [Persona] WHERE Nombre = @inNombre AND [Activo] = 1)


				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 16,
								@inId_Objeto_Accion = @Id_Persona,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62516,'Error: No se ha podido crear la Persona, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Crear_Cuenta
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
						@Id_Tipo_Cuenta_Ahorros int,
						@Id_Cuenta int,
						@idUsuarioMoidifica INT,
						@insertado_El DATE

				set @Id_Persona = (SELECT [Id_Persona] FROM [Persona] WHERE [Nombre] = @inNombre_Persona AND [Activo] = 1)
				set	@Id_Tipo_Cuenta_Ahorros = (SELECT [Id_Tipo_Cuenta_Ahorros] FROM [Tipo_Cuenta_Ahorros] WHERE [Nombre] = @inNombre_Tipo_Cuenta_Ahorros AND [Activo] = 1)

				--INSERTA AL Cuenta
				INSERT INTO Cuenta(	Id_Persona, Id_Tipo_Cuenta_Ahorros, Num_Cuenta, Fecha_Creacion, Saldo)
				values (@Id_Persona, @Id_Tipo_Cuenta_Ahorros, @inNum_Cuenta, @inFecha_Creacion, @inSaldo )

				set @Id_Cuenta = (SELECT @Id_Cuenta FROM [Cuenta] WHERE Num_Cuenta = @inNum_Cuenta AND [Activo] = 1)

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 19,
								@inId_Objeto_Accion = @Id_Cuenta,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62519,'Error: No se ha podido crear el Cuenta, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Crear_Beneficiario
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
						@Id_Parentezco int,
						@idUsuarioMoidifica INT,
						@insertado_El DATE,
						@Id_Beneficiario int

				set @Id_Persona = (SELECT [Id_Persona] FROM [Persona] WHERE [Nombre] = @inNombre_Persona AND [Activo] = 1)
				set	@Id_Cuenta = (SELECT [Id_Cuenta] FROM [Cuenta] WHERE [Num_Cuenta] = @inNum_Cuenta AND [Activo] = 1)
				set	@Id_Parentezco = (SELECT [Id_Parentezco] FROM [Parentezco] WHERE [Nombre] = @inNombre_Parentezco AND [Activo] = 1)


				--INSERTA AL Beneficiario
				INSERT INTO Beneficiario(Id_Persona, Id_Cuenta, Id_Parentezco, Porcentaje)
				values (@Id_Persona,@Id_Cuenta,@Id_Parentezco,@inPorcentaje)

				set @Id_Beneficiario = (SELECT @Id_Beneficiario FROM [Beneficiario] WHERE Id_Persona=@Id_Persona and Id_Cuenta=@Id_Cuenta and Id_Parentezco=@Id_Parentezco   AND [Activo] = 1)

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 22,
								@inId_Objeto_Accion = @Id_Beneficiario,  
								@inQuien_Inserto = @idUsuarioMoidifica , 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62522,'Error: No se ha podido crear el beneficiario, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Crear_Estado_Cuenta
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
						@idUsuarioMoidifica INT,
						@insertado_El DATE,
						@idEstado_Cuenta int
						
				set	@Id_Cuenta = (SELECT [Id_Cuenta] FROM [Cuenta] WHERE [Num_Cuenta] = @inNum_Cuenta AND [Activo] = 1)

				--INSERTA AL Estado_Cuenta
				INSERT INTO Estado_Cuenta(Id_Cuenta, Fecha_Inicio, Fecha_Fin, Saldo_Inicial, Saldo_Final)
				values (@Id_Cuenta, @inFecha_Inicio, @inFecha_Fin, @inSaldo_Inicial, @inSaldo_Final)

				set @idEstado_Cuenta = (SELECT Id_Estado_Cuenta FROM [Estado_Cuenta] WHERE Id_Cuenta =@Id_Cuenta and Fecha_Inicio = @inFecha_Inicio and Fecha_Fin = @inFecha_Fin and Id_Cuenta=@Id_Cuenta AND [Activo] = 1)


				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 25,
								@inId_Objeto_Accion = @idEstado_Cuenta,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62525,'Error: No se ha podido crear el Estado Cuenta, por favor revise los datos',1;
		END CATCH
	END
GO

CREATE Procedure Crear_Usuario_Visualizacion
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
						@idUsuarioMoidifica INT,
						@insertado_El DATE,
						@Id_Usuario_Visualizacion int 
						
				set	@Id_Cuenta = (SELECT [Id_Cuenta] FROM [Cuenta] WHERE [Num_Cuenta] = @inNum_Cuenta AND [Activo] = 1)
				set	@Id_Usuario = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inNombre_Usuario AND [Activo] = 1)


				--INSERTA AL Usuario_Visualizacion
				INSERT INTO Usuario_Visualizacion(Id_Usuario, Id_Cuenta)
				values (@Id_Usuario, @Id_Cuenta)

				set @Id_Usuario_Visualizacion = (SELECT Id_Usuario_Visualizacion FROM [Usuario_Visualizacion] WHERE Id_Usuario=@Id_Usuario and Id_Cuenta=@Id_Cuenta AND [Activo] = 1)

				--GUARDA EL ID y fecha
				SET @idUsuarioMoidifica = (SELECT [Id_Usuario] FROM [Usuario] WHERE [Nombre_Usuario] = @inUsuarioACargo AND [Activo] = 1)
				SET @insertado_El = GETDATE()

				--INSERTA EL CAMBIO
				EXEC Insertar_BitacoraAcciones 
								@inId_Tipo_Accion = 28,
								@inId_Objeto_Accion = @Id_Usuario_Visualizacion,  
								@inQuien_Inserto = @idUsuarioMoidifica, 
								@inInsertado_Por = @inIPusuario, 
								@inInserto_El = @insertado_El
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 62528,'Error: No se ha podido crear la relacion de Usuario Visualizacion, por favor revise los datos',1;
		END CATCH
	END
GO