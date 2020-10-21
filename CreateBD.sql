USE master 
GO
alter database BD1 SET single_USEr with rollback immediate --Permite eliminar un BD en uso
DROP DATABASE IF EXISTS BD1;  --Elimina la bd
CREATE DATABASE BD1;

USE BD1;
GO

CREATE TABLE Tipo_Documento (
	Id_TipoDocumento INT NOT NULL PRIMARY KEY,
	Nombre VARCHAR(100),
	Activo BIT NOT NULL DEFAULT '1'
);

CREATE TABLE Tipo_Moneda (
	Id_Tipo_Moneda INT NOT NULL PRIMARY KEY,
	Nombre VARCHAR(100),
	Simbolo Varchar(5),
	Activo BIT NOT NULL DEFAULT '1'
);

CREATE TABLE Parentezco (
	Id_Parentezco INT NOT NULL PRIMARY KEY,
	Nombre VARCHAR(100),
	Activo BIT NOT NULL DEFAULT '1'
);

CREATE TABLE Tipo_Cuenta_Ahorros (
	Id_Tipo_Cuenta_Ahorros INT NOT NULL PRIMARY KEY,
	Nombre VARCHAR(100),
	Id_Tipo_Moneda INT NOT NULL, 
	Saldo_Minimo MONEY NOT NULL,
	Multa_Saldo_Minimo MONEY NOT NULL,
	Cargo_Anual MONEY NOT NULL,
	Num_Retiros_Humano INT NOT NULL, 
	Num_Retiros_Automatico INT NOT NULL, 
	Comision_Humano MONEY NOT NULL, 
	Comision_Automatico  MONEY NOT NULL,
	Interes REAL NOT NULL,
	Activo BIT NOT NULL DEFAULT '1',
	FOREIGN KEY (Id_Tipo_Moneda) REFERENCES Tipo_Moneda(Id_Tipo_Moneda)

);
CREATE TABLE Persona (
	Id_Persona INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(100) NOT NULL,
	Id_TipoDocumento INT NOT NULL,
	Documento_Identidad VARCHAR(20) NOT NULL UNIQUE,
	Fecha_Nacimiento DATE NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Telefono1 VARCHAR(15) NOT NULL, 
	Telefono2 VARCHAR(15) NOT NULL,
	Activo BIT NOT NUll DEFAULT '1',
	FOREIGN KEY (Id_TipoDocumento) REFERENCES Tipo_Documento(Id_TipoDocumento)
);
CREATE TABLE Cuenta (
	Id_Cuenta INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Id_Persona INT NOT NULL,
	Id_Tipo_Cuenta_Ahorros INT NOT NULL,
	Num_Cuenta INT NOT NULL UNIQUE,
	Fecha_Creacion DATE NOT NULL,
	Saldo MONEY NOT NULL,
	Activo BIT NOT NULL DEFAULT '1',
	FOREIGN KEY (Id_Tipo_Cuenta_Ahorros) REFERENCES Tipo_Cuenta_Ahorros(Id_Tipo_Cuenta_Ahorros),
	FOREIGN KEY (Id_Persona) REFERENCES Persona(Id_Persona)
);

CREATE TABLE Beneficiario (
	Id_Beneficiario INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Id_Persona INT NOT NULL,
	Id_Cuenta INT NOT NULL,
	Id_Parentezco INT NOT NULL,
	Porcentaje REAL NOT NULL,
	Activo BIT NOT NULL DEFAULT '1',
	FOREIGN KEY (Id_Cuenta) REFERENCES Cuenta(Id_Cuenta),
	FOREIGN KEY (Id_Persona) REFERENCES Persona(Id_Persona),
	FOREIGN KEY (Id_Parentezco) REFERENCES Parentezco(Id_Parentezco)
);
CREATE TABLE Estado_Cuenta (
	Id_Estado_Cuenta INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Id_Cuenta INT NOT NULL,
	Fecha_Inicio DATE NOT NULL,
	Fecha_Fin DATE NOT NULL,
	Saldo_Inicial MONEY NOT NULL,
	Saldo_Final MONEY NOT NULL,
	Activo BIT NOT NULL DEFAULT '1',
	FOREIGN KEY (Id_Cuenta) REFERENCES Cuenta(Id_Cuenta)
);
CREATE TABLE Usuario (
	Id_Usuario INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Id_Persona INT NOT NULL,
	Nombre_Usuario VARCHAR(120) NOT NULL UNIQUE,
	Clave VARCHAR(120) NOT NULL,
	Es_Admin BIT NOT NULL,
	Activo BIT NOT NULL DEFAULT '1',
	FOREIGN KEY (Id_Persona) REFERENCES Persona(Id_Persona)
);
CREATE TABLE Usuario_Visualizacion (
	Id_Usuario_Visualizacion INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Id_Usuario INT NOT NULL,
	Id_Cuenta INT  NOT NULL,
	Activo BIT NOT NULL DEFAULT '1',
	FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario),
	FOREIGN KEY (Id_Cuenta) REFERENCES Cuenta(Id_Cuenta)
);