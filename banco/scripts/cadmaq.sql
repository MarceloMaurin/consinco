create table cadmaq (
	idcadmaq int  primary key ,
	dtentrada datetime not null,
	dtsaida datetime,
	idmodelo int not null,
	idfabricante int not null,
	nroserie char(20),
	idcategoria int not null,
	foreign key(idmodelo) references modelo(idmodelo),
	foreign key(idfabricante) references fabricante(idfabricante),
	foreign key(idcategoria) references categoria(idcategoria)	
);