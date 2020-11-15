USE BD1;
GO 
exec sp_configure 'contained database authentication', 1
go
reconfigure
go

alter database BD1
set containment = partial

go
CREATE  TRIGGER Trigger_Crear_Beneficiario
ON Beneficiario 
FOR INSERT
AS
DECLARE @Id_Tipo_Accion [INT]=19;
DECLARE @Quien_Inserto[VARCHAR](30)=0;
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto=0)
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Beneficiario,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 
GO

CREATE  TRIGGER Trigger_Crear_Usuario
ON dbo.Usuario 
FOR INSERT
AS
DECLARE @Cursor [int] =1;
DECLARE @Id_Tipo_Accion [INT]=1;
DECLARE @Quien_Inserto[VARCHAR](30)=0;
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto=0)
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Usuario,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 
while (@Cursor < (SELECT count(Id_Usuario) FROM dbo.Usuario))
begin
	DECLARE @Usuario [VARCHAR](100)= (SELECT TOP 1 Nombre_Usuario FROM Usuario WHERE Id_Usuario = @Cursor);
	DECLARE @Contra [VARCHAR](100)= (SELECT TOP 1 Clave FROM Usuario WHERE Id_Usuario = @Cursor);
	DECLARE @sqlCommand[NVARCHAR](MAX);
	SET @sqlCommand = 'IF EXISTS (SELECT * FROM sys.syslogins WHERE name = '+CHAR(39)+@Usuario+CHAR(39)+')'+ 'DROP LOGIN '+@Usuario+';'
	EXEC sp_executesql @sqlCommand;
	SET @sqlCommand = 'CREATE USER '+ @Usuario+ ' WITH PASSWORD = '+CHAR(39)+@Contra+CHAR(39)+';'+'CREATE LOGIN '+ @Usuario +' WITH PASSWORD = '+CHAR(39)+@Contra+CHAR(39)+';'
	EXEC sp_executesql @sqlCommand;
	SET @sqlCommand = 'ALTER SERVER ROLE [sysadmin] ADD MEMBER '+@Usuario
	EXEC sp_executesql @sqlCommand;

	SET @Cursor = @Cursor+1;
end;
GO


CREATE  TRIGGER Trigger_Crear_Tipo_Documento
ON Tipo_Documento 
FOR INSERT
AS
DECLARE @Id_Tipo_Accion [INT]=4;
DECLARE @Quien_Inserto[VARCHAR](30)=0;
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto=0)
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_TipoDocumento,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 

GO
CREATE  TRIGGER Trigger_Crear_Tipo_Moneda
ON Tipo_Moneda 
FOR INSERT
AS
DECLARE @Id_Tipo_Accion [INT]=7;
DECLARE @Quien_Inserto[VARCHAR](30)=0;
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto=0)
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Tipo_Moneda,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 

GO
CREATE  TRIGGER Trigger_Crear_Parentezco
ON Parentezco 
FOR INSERT
AS
DECLARE @Id_Tipo_Accion [INT]=10;
DECLARE @Quien_Inserto[VARCHAR](30)=0;
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto=0)
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Parentezco,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 
GO

CREATE  TRIGGER Trigger_Crear_Tipo_Cuenta_Ahorros
ON Tipo_Cuenta_Ahorros 
FOR INSERT
AS
DECLARE @Id_Tipo_Accion [INT]=13;
DECLARE @Quien_Inserto[VARCHAR](30)=0;
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto=0)
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Tipo_Cuenta_Ahorros,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 
GO

CREATE  TRIGGER Trigger_Crear_Persona
ON Persona 
FOR INSERT
AS
DECLARE @Id_Tipo_Accion [INT]=16;
DECLARE @Quien_Inserto[VARCHAR](30)=0;
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto=0)
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Persona,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 
GO

CREATE  TRIGGER Trigger_Crear_Estado_Cuenta
ON Estado_Cuenta 
FOR INSERT
AS
DECLARE @Id_Tipo_Accion [INT]=22;
DECLARE @Quien_Inserto[VARCHAR](30)=0;
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto=0)
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Estado_Cuenta,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 

GO
CREATE  TRIGGER Trigger_Crear_Usuario_Visualizacion
ON Usuario_Visualizacion 
FOR INSERT
AS
DECLARE @Id_Tipo_Accion [INT]=25;
DECLARE @Quien_Inserto[VARCHAR](30)=0;
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto=0)
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Usuario_Visualizacion,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 
GO
CREATE  TRIGGER Trigger_Crear_Cuenta
ON Cuenta 
FOR INSERT
AS
DECLARE @Id_Tipo_Accion [INT]=28;
DECLARE @Quien_Inserto[VARCHAR](30)=0;
DECLARE @Insertado_Por [VARCHAR](30);
DECLARE @Fecha [DATETIME] = (SELECT TOP 1 GETDATE());
IF (@Quien_Inserto=0)
	SET @Insertado_Por = 'XML';	
ELSE
	SET @Insertado_Por = 'WEB/SCRIPT';

--Insertar en tabla Bitacora
INSERT INTO Bitacora_Accion(Id_Tipo_Accion,Id_Objeto_Accion,Quien_Inserto,Insertado_Por,Inserto_El)
SELECT @Id_Tipo_Accion,Id_Cuenta,@Quien_Inserto,@Insertado_Por,@Fecha from INSERTED 