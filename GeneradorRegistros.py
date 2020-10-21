# -⁻- coding: UTF-8 -*-
import random
ListaNombres= ["Jose","Maria","Guadalupe","Juana","Jesus","Pedro","Manuel","Carmen","Roberto","Daniel","Jorge","Miguel","Javier","Martin","David","Antonio","Marco","Francisco","Veronica","Elena","Rosa","Francisca","Teresa","Fernanda","Alberto","Armando","Martha","Yolanda","Rosa","Gloria","Gabriela","Victor","Maria","Gabriel","Óscar","Ana","Isabel","Ruben","Luisa","Rosario","Jorge","Guadalupe","Jose","Araceli","Isabel","Irma","Lucia","Agustin","Gustavo"]
ListaApellidos = ["Vargas","Mora","Gonzalez","Hernandez","Castro","Araya","Alvarado","Perez","Campos","Gomez","Zuñiga","Fernandez","Villalobos","Gutierrez","Alfaro","Aguilar","Valverde","Alvarez","Salas","Martinez","Murillo","Chacon","Mendez","Monge","Barrantes","Madrigal","Marin","Fallas","Rivera","Fonseca","Calvo","Ruiz","Arce","Zamora","Muñoz","Vasquez","Picado","Gamboa","Umaña","Esquivel","Flores","Arroyo","Guzman","Cerdas","Cascante","Elizondo","Arguedas","Ortiz","Carvajal","Duran","Ureña","Cespedes","Romero","Serrano","Artavia","Venegas","Mata","Matarrita","Montoya","Vindas","Reyes","Arrieta","Varela","Moya","Benavides","Orozco","Garita","Guevara","Duarte","Masis","Retana","Cordoba","Padilla","Fuentes","Leiva","Trejos","Ulate","Piedra","Oviedo","Cubero","Ulloa","Carmona","Mesen","Lobo","Robles","Contreras","Pereira","Madriz","Sancho","Suarez","Acosta","Saborio","Saenz","Briceño","Villarreal","Lizano","Peña","Moreno","Roman","Melendez"]
ListaCedulas = ["193587733", "197666462", "144664984", "101705162", "130644719", "109602368", "104371521", "131927856", "123485695", "168556538", "152756684", "168152775", "199603377", "174009421", "144488000", "112998614", "107832530", "191757524", "157550145", "152711632", "152348362", "105060642", "123282003", "148272761", "108486280", "167231980", "148542712", "188901235", "180881845", "151415508", "185351883", "159901000", "193734836", "179461355", "146448431", "110730448", "110852503", "199213424", "174808854", "169330599", "182157649", "197587019", "118343518", "106778341", "139813320", "195176428", "125000522", "165553974", "108498449", "160356030", "145224763", "143713856", "151555723", "174329739", "145019786", "111072532", "118427232", "142941111", "169839045", "182283982", "123168420", "142411024", "190827168", "134225981", "139329273", "102460905", "186962518", "165057936", "183199146", "122111670", "150445262", "113251331", "160998916", "117359964", "199403646", "140728483", "147877492", "114663582", "186738774", "142131301", "111505749", "155341022", "138597348", "110839943", "160713985", "168856475", "188401987", "131567071", "182017351", "128501832", "182246416", "137030304", "100467125", "138282667", "147441451", "163663784", "113437879", "159967351", "143062990", "107687952", "159058598", "144127398", "142179574", "101658647", "100673640", "156949586", "134914730", "176967894", "117971568", "153816920", "156723924", "108487167", "136617546", "169428160", "172959405", "190123830", "178375881", "161104984", "127920248", "133747610", "176790244", "104391318", "193696838", "173168687", "101504889", "101070522", "196837375", "118882593", "113219168", "159471918", "133999731", "192535738", "144098161", "124532423", "198079285", "163482829", "117983527", "153062089", "118753677", "149892757", "198887703", "111281632", "169813540", "157863720", "169006829", "119625873", "111266789", "123203923", "141498147", "117171162", "106129872", "190231136", "195864670", "150211783", "160860246", "188410319", "106261426", "170710883", "107268130", "169518333", "158742839", "152668209", "189149822", "130982238", "136975395", "180442444", "143217478", "163553801", "199287994", "108986975", "192439288", "108747104", "171712987", "100632009", "173606912", "197721488", "197009534", "136191600", "171426907", "181351136", "175117521", "177230015", "163444875", "169098517", "120333190", "105711321", "129152559", "158453180", "135878368", "109067704", "128965552", "101995117", "101055382", "150205835", "179934028", "180890135", "144250746", "169618231", "133186390"]
ListaCedulasRegistradas = []
ListaCuentasRegistradas = []
def GenerarCedulas(cantidad):
	lista=[]
	for x in range(1,cantidad):
		cedula ="\""+str((random.randint(100000000, 199999999)))+"\""
		if(not cedula in lista):
			lista.append(cedula)
	return lista
def GenerarFecha(agnoInicio,agnoFin):
	fecha="ano-mes-dia"
	fecha = fecha.replace("ano",str (random.randint(agnoInicio,agnoFin)))
	mes =str (random.randint(1,12))
	if(len(mes)==1):
		mes="0"+mes
	fecha = fecha.replace("mes",mes)
	dia = str (random.randint(1,28))
	if(len(dia)==1):
		dia="0"+dia
	fecha = fecha.replace("dia",dia)
	return fecha
def genCorreo(nombre,apellido):
	servidor=["@gmail.com","@outlook.com","@yahoo.com","@hotmail.com"]
	return apellido.lower()+nombre.lower()+ servidor[random.randint(0,3)]
def genPersona():
	nombre = ListaNombres[random.randint(0,len(ListaNombres)-1)]
	apellido1 = ListaApellidos[random.randint(0,len(ListaApellidos)-1)]
	apellido2 = ListaApellidos[random.randint(0,len(ListaApellidos)-1)]
	cedula = ListaCedulas.pop (random.randint(0,len(ListaCedulas)-1))
	ListaCedulasRegistradas.append(cedula)
	persona = "<Persona TipoDocuIdentidad=\"1\" Nombre=\"#N#\" ValorDocumentoIdentidad=\"#ID#\" FechaNacimiento=\"#FN#\" Email=\"#Correo#\" telefono1=\"#Cel#\" telefono2=\"#Tel#\"/>"
	persona = persona.replace("#N#",nombre+" "+apellido1+" "+apellido2)
	persona = persona.replace("#ID#",cedula)
	persona = persona.replace("#FN#",GenerarFecha(1970,2010))
	persona = persona.replace("#Correo#",genCorreo(nombre,apellido1))
	persona = persona.replace("#Cel#",str(random.randint(62000000,89999999)))
	persona = persona.replace("#Tel#",str(random.randint(20000000,29999999)))
	return persona

def genCuenta():
	cuenta=" <Cuenta ValorDocumentoIdentidadDelCliente=\"#ID#\" TipoCuentaId=\"#TC#\" NumeroCuenta=\"#NC#\" FechaCreacion=\"#FC#\" Saldo=\"#S#\"/>"
	cuenta=cuenta.replace("#ID#",ListaCedulasRegistradas[random.randint(0,len(ListaCedulasRegistradas)-1)])
	cuenta=cuenta.replace("#TC#",str (random.randint(1,3)))
	NumeroCuenta = str(random.randint(11000001,11999999))
	ListaCuentasRegistradas.append(NumeroCuenta)
	cuenta=cuenta.replace("#NC#",NumeroCuenta)
	cuenta=cuenta.replace("#FC#",GenerarFecha(2010,2020))
	cuenta=cuenta.replace("#S#",str (random.randint(1,90000000))+".00")
	return cuenta

def genBeneficiarios():
	beneficiario ="<Beneficiario NumeroCuenta=\"#C#\" ValorDocumentoIdentidadBeneficiario=\"#ID#\" ParentezcoId=\"#PI#\" Porcentaje=\"#P#\""
	beneficiario = beneficiario.replace("#C#",ListaCuentasRegistradas[random.randint(0,len(ListaCuentasRegistradas)-1)])
	beneficiario = beneficiario.replace("#ID#",ListaCedulasRegistradas[random.randint(0,len(ListaCedulasRegistradas)-1)])
	beneficiario = beneficiario.replace("#PI#",str(random.randint(0,8)))
	beneficiario = beneficiario.replace("#P#",str(random.randint(1,100)))
	return beneficiario

listaPersonas = []
listaCuentas= []
listaBeneficiarios= []

for x in range(0,100):
	listaPersonas.append(genPersona())
for x in range(0,100):
	listaCuentas.append(genCuenta())
for x in range(0,100):
	listaBeneficiarios.append(genBeneficiarios())

print(listaPersonas)
print(listaCuentas)
print(listaBeneficiarios)