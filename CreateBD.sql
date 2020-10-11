USE master ;  
GO
alter database Base1 SET single_USEr with rollback immediate --Permite eliminar un BD en uso
DROP DATABASE IF EXISTS Base1;  --Elimina la bd
CREATE DATABASE Base1
go
USE Base1;


CREATE TABLE Type_Document (
	Id_Type_Document int NOT NULL PRIMARY KEY,
	Description VARCHAR(100),
	Active bit NOT Null DEFAULT '1',
);
CREATE TABLE Client (
    Id_Client  int identity(1,1) not NULL PRIMARY KEY,
	Name_Client VARCHAR(100) NOT NULL,
	Password_Client  VARCHAR(15) NOT NULL,
	Document VARCHAR(15) NOT NULL UNIQUE,
	Id_Type_Document int NOT NULL,
	Active bit NOT Null DEFAULT '1',
	FOREIGN KEY (Id_Type_Document ) REFERENCES Type_Document (Id_Type_Document)
);





