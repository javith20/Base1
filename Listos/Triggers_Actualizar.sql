USE BD1;
GO 
CREATE  TRIGGER Trigger_Actualizar_Beneficiario
ON Beneficiario 
FOR UPDATE
AS
DECLARE @Id_Tipo_Accion [INT]=20;
DECLARE @Quien_Inserto[VARCHAR](30)=(SELECT TOP 1 system_user);
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto='MARII-PC\aguer')
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Beneficiario,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 
GO

CREATE  TRIGGER Trigger_Actualizar_Usuario
ON Usuario 
FOR UPDATE
AS
DECLARE @Id_Tipo_Accion [INT]=2;
DECLARE @Quien_Inserto[VARCHAR](30)=(SELECT TOP 1 system_user);
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto='MARII-PC\aguer')
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Usuario,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 
GO

CREATE  TRIGGER Trigger_Actualizar_Tipo_Documento
ON Tipo_Documento 
FOR UPDATE
AS
DECLARE @Id_Tipo_Accion [INT]=5;
DECLARE @Quien_Inserto[VARCHAR](30)=(SELECT TOP 1 system_user);
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto='MARII-PC\aguer')
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_TipoDocumento,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 

GO
CREATE  TRIGGER Trigger_Actualizar_Tipo_Moneda
ON Tipo_Moneda 
FOR UPDATE
AS
DECLARE @Id_Tipo_Accion [INT]=8;
DECLARE @Quien_Inserto[VARCHAR](30)=(SELECT TOP 1 system_user);
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto='MARII-PC\aguer')
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Tipo_Moneda,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 

GO
CREATE  TRIGGER Trigger_Actualizar_Parentezco
ON Parentezco 
FOR UPDATE
AS
DECLARE @Id_Tipo_Accion [INT]=11;
DECLARE @Quien_Inserto[VARCHAR](30)=(SELECT TOP 1 system_user);
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto='MARII-PC\aguer')
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Parentezco,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 
GO

CREATE  TRIGGER Trigger_Actualizar_Tipo_Cuenta_Ahorros
ON Tipo_Cuenta_Ahorros 
FOR UPDATE
AS
DECLARE @Id_Tipo_Accion [INT]=14;
DECLARE @Quien_Inserto[VARCHAR](30)=(SELECT TOP 1 system_user);
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto='MARII-PC\aguer')
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Tipo_Cuenta_Ahorros,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 
GO

CREATE  TRIGGER Trigger_Actualizar_Persona
ON Persona 
FOR UPDATE
AS
DECLARE @Id_Tipo_Accion [INT]=17;
DECLARE @Quien_Inserto[VARCHAR](30)=(SELECT TOP 1 system_user);
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto='MARII-PC\aguer')
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Persona,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 
GO

CREATE  TRIGGER Trigger_Actualizar_Estado_Cuenta
ON Estado_Cuenta 
FOR UPDATE
AS
DECLARE @Id_Tipo_Accion [INT]=23;
DECLARE @Quien_Inserto[VARCHAR](30)=(SELECT TOP 1 system_user);
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto='MARII-PC\aguer')
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Estado_Cuenta,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 

GO
CREATE  TRIGGER Trigger_Actualizar_Usuario_Visualizacion
ON Usuario_Visualizacion 
FOR UPDATE
AS
DECLARE @Id_Tipo_Accion [INT]=26;
DECLARE @Quien_Inserto[VARCHAR](30)=(SELECT TOP 1 system_user);
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto='MARII-PC\aguer')
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Usuario_Visualizacion,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 
GO
CREATE  TRIGGER Trigger_Actualizar_Cuenta
ON Cuenta 
FOR UPDATE
AS
DECLARE @Id_Tipo_Accion [INT]=29;
DECLARE @Quien_Inserto[VARCHAR](30)=(SELECT TOP 1 system_user);
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto='MARII-PC\aguer')
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Cuenta,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 
