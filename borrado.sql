Create Table Tipo_Accion(
	inId_Tipo_Accion INT NOT NULL PRIMARY KEY,
	Nombre VARCHAR(100),
	Activo BIT NOT NULL DEFAULT '1'
);

1 Nuevo_Usuario
2 Actualizar_Usuario
3 Eliminar_Usuario

4 Nuevo_Tipo_Documento
5 Actualizar_Tipo_Documento
6 Eliminar_Tipo_Documento

7 Nuevo_Tipo_Moneda
8 Actualizar_Tipo_Moneda
9 Eliminar_Tipo_Moneda

10 Nuevo_Parentezco
11 Actualizar_Parentezco
12 Eliminar_Parentezco
 
13 Nuevo_Tipo_Cuenta_Ahorros
14 Actualizar_Tipo_Cuenta_Ahorros
15 Eliminar_Tipo_Cuenta_Ahorros

16 Nuevo_Persona
17 Actualizar_Persona
18 Eliminar_Persona

19 Nuevo_Cuenta
20 Actualizar_Cuenta
21 Eliminar_Cuenta

22 Nuevo_Beneficiario
23 Actualizar_Beneficiario
24 Eliminar_Beneficiario

25 Nuevo_Estado_Cuenta
26 Actualizar_Estado_Cuenta
27 Eliminar_Estado_Cuenta

28 Nuevo_Usuario_Visualizacion
29 Actualizar_Usuario_Visualizacion
30 Eliminar_Usuario_Visualizacion

----------------------------------------------------------------------------------------------------------------------

--			Bitacora Cambio

----------------------------------------------------------------------------------------------------------------------
Create Table BitacoraCambio(
	@Id_Tipo_Accion -- El tipo dfe accion que se realizo
	@Id_Objeto_Accion --El Id que fue modificado o insertado 
	@Quien_Inserto-- El usuario que lo hizo
	@Insertado_Por-- Medio por el cual lo hizo 
	@Inserto_El --Fecha
									