CREATE TABLE "cadmaq" (
	"idcadmaq"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"dtentrada"	datetime NOT NULL,
	"dtsaida"	datetime,
	"idfabricante"	INTEGER NOT NULL,
	"idmodelo"	INTEGER NOT NULL,
	"idcategoria"	INTEGER NOT NULL,
	"nroserie"	char(20),
	"descricao" char(20) NOT NULL,
	foreign key(idmodelo) references modelo(idmodelo),
	foreign key(idfabricante) references fabricante(idfabricante),
	foreign key(idcategoria) references categoria(idcategoria)	
);